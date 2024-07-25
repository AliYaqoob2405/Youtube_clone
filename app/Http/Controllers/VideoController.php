<?php

namespace App\Http\Controllers;
use App\Models\Channel;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VideoController extends Controller
{
    public function upload()
    {
        $channels = Channel::all();
        return view('videos.upload', compact('channels'));

    }
    public function video_upload()
    {
        $channel = auth()->user()->channel;
        return view('user.video_upload', compact('channel'));
    }
    public function video_upload_show()
    {
        $user = Auth::user();
        $videos = Video::withCount(['likes', 'dislikes', 'favorites'])
        ->where('channel_id', auth()->user()->channel->id)
        ->get();
        return view('user.show_video', compact('videos'));
    }
    public function favorites()
    {
        $user = Auth::user();

        // Assuming you have defined the relationships correctly in your Video model
        $videos = $user->favoriteVideos()->get();

        return view('favourites', compact('videos'));
    }
    public function list()
    {
        $videos = Video::with('channel')->get();

        return view('videos.index', compact('videos'));
    }
    public function show(Video $video)
    {
        return view('videos.show', compact('video'));
    }
    public function user_video_play(Video $video)
    {
        // $user = Auth::user();
        // $video = Video::withCount(['likes', 'dislikes', 'favorites'])
        // ->where('channel_id', auth()->user()->channel->id)
        // ->get();
        return view('user.video_play', compact('video'));
    }
    public function edit($id)
    {
        $video = Video::find($id);
        $channels = Channel::all(); // Assuming you might need channels for a dropdown
        return view('videos.edit', compact('video', 'channels'));
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'channel_id' => 'required|exists:channels,id',
            'video' => 'nullable|file|mimes:mp4,mov,ogg,qt|max:20000', // Optional validation for video file
            'url' => 'nullable|url',
        ]);
        $video = Video::find($id);
        $video->update($request->all());
        return redirect()->route('channel')->with('success', 'Video updated successfully.');
    }
    public function destroy($id)
    {
        $video = Video::find($id);
        if ($video) {
            $video->delete();
            return back()->with('success', 'Video deleted successfully.');
        } else {
            return redirect(route('videos.upload'))->with('error', 'Video not found.');
        }
    }
    public function store(Request $request)
    {
        $request->validate([
            'channel_id' => 'required|exists:channels,id',
            'title' => 'required|string|max:255',
            'video' => 'required_if:video_type,file|file|mimes:mp4,mov,avi',
            'video_type' => 'required|in:file,url',
            'video_url' => 'required_if:video_type,url|nullable|url',
            'category' => 'required',
        ]);
        $videoPath = null;
        if ($request->video_type === 'file' && $request->hasFile('video'))
        {
            $videoPath = $request->file('video')->store('videos', 'public');
        }
        $video = Video::create([
            'channel_id' => $request->channel_id,
            'title' => $request->title,
            'path' => $videoPath,
            'video_url' => $request->video_url, // Include video URL
            'category' => $request->category,
        ]);
        $video = Video::find($video->id);
        $video->channels()->attach($request->channel_id);
        return redirect()->route('channel')->with('success', 'Video uploaded successfully.');
    }
    public function showByCategory($category)
    {
        $videos = Video::where('category', 'LIKE', '%' . $category . '%' )->get();
        return view('dashboard', compact('videos'));
    }
    public function like($id)
    {
        $video = Video::find($id);
        $user = auth()->user();

        if ($video) {
            // Check if the user has already liked the video
            if ($user->hasLiked($video)) {
                // Unlike the video
                $user->likes()->detach($video->id);
                $video->decrementLikes();
            } else {
                // Remove dislike if exists
                if ($user->hasDisliked($video)) {
                    $user->dislikes()->detach($video->id);
                    $video->decrementDislikes();
                }
                // Like the video
                $user->likes()->attach($video->id);
                $video->incrementLikes();
            }

            return response()->json(['success' => true, 'likes' => $video->likes, 'dislikes' => $video->dislikes]);
        }

        return response()->json(['success' => false], 404);
    }

    public function dislike($id)
    {
        $video = Video::find($id);
        $user = auth()->user();

        if ($video) {
            // Check if the user has already disliked the video
            if ($user->hasDisliked($video)) {
                // Remove dislike
                $user->dislikes()->detach($video->id);
                $video->decrementDislikes();
            } else {
                // Remove like if exists
                if ($user->hasLiked($video)) {
                    $user->likes()->detach($video->id);
                    $video->decrementLikes();
                }
                // Dislike the video
                $user->dislikes()->attach($video->id);
                $video->incrementDislikes();
            }

            return response()->json(['success' => true, 'likes' => $video->likes, 'dislikes' => $video->dislikes]);
        }

        return response()->json(['success' => false], 404);
    }
    public function view(Video $video)
    {
        $video->increment('views');
        return response()->json(['success' => true, 'views' => $video->views]);
    }
}

