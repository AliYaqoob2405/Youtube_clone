<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Search;
use App\Models\User;
use App\Models\Channel; // Assuming you have a Channel model
use App\Models\Video; // Assuming you have a Video model
use Illuminate\Support\Facades\DB;
class HomeController extends Controller
{
    public function user()
    {
        $videos = Video::where('status', 1)->get();
        // $videos = Video::where('videos.status', 1)
        //        ->whereHas('channel', function($query) {
        //            $query->where('status', 1);
        //        })
        //        ->get();

        // $videos = Video::with('channel')->get();
        return view('dashboard', compact('videos'));
    }
    public function likedPlaylist()
    {
        $user = Auth::user();
        $likedVideos = $user->likedVideos()->get();
        // $user = Auth::user();
        // $videos = $user->favoriteVideos()->get();
        return view('playlist', compact('likedVideos'));
    }
    public function showByCategory($category)
    {
        $videos = Video::where('category', $category)->get();
        return view('dashboard', compact('videos'));
    }
    public function index()
    {
        $channel = Channel::all();
        return view('channel', compact('channel'));
    }

    public function create()
    {
        return view('channels.create');
    }


    public function store(Request $request)
    {
        // $request->validate([
        //     'name' => 'required|string|max:255',
        //     'description' => 'nullable|string',
        // ]);
        $request->validate(Channel::$rules);
        Channel::create([
            'name' => $request->name,
            'description' => $request->description,
        ]);
        return redirect()->route('channel')->with('success', 'Channel created successfully.');
    }
    public function channel_store(Request $request)
    {
        $user = auth()->user();
        $channel = $user->channel;

        if (!$channel) {
            return redirect()->route('channel.create')->with('error', 'You need to create a channel first.');
        }

        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'video' => 'required|file|mimes:mp4,mov,avi,flv|max:10240', // Example validation rules
        ]);

        $videoPath = $request->file('video')->store('videos', 'public');

        $video = new Video();
        $video->title = $validatedData['title'];
        $video->description = $validatedData['description'];
        $video->path = $videoPath;
        $video->channel()->associate($channel);
        $video->save();

        return redirect()->route('videos.show', $video)->with('success', 'Video uploaded successfully.');
    }
    public function edit($id)
    {
        $channel = Channel::find($id);
        return view('channels.edit', compact('channel'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'nullable|string',
        ]);

        $channel = Channel::find($id);
        $channel->update($request->all());

        return redirect()->route('channel')->with('success', 'Channel updated successfully.');
    }

    public function destroy($id)
    {
        $channel = Channel::find($id);
        $channel->delete();

        return redirect()->route('channel')->with('success', 'Channel deleted successfully.');
}
    public function shorts()
    {
        return view('shorts');
    }
    public function channel()
    {
        $channels = Channel::all();
        return view('channels.show', compact('channels'));
    }

    public function create_channel()
    {
        return view('user.create_channel');
    }
    public function channel_show($id)
    {
        $channel = Channel::findOrFail($id);
        return view('user.show_channel', compact('channel'));
    }
    public function search(Request $request)
    {
        $query = $request->input('query');
        $search = Search::where('title', 'like', "%{$query}%")
        ->orWhere('description', 'like', "%{$query}%")
        ->get();
        return view('dashboard', ['shorts' => $search, 'query' => $query]);
    }
}
