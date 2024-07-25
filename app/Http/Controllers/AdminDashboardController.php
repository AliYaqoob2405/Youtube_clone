<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Channel;
class AdminDashboardController extends Controller
{
    public function index()
    {
        // dd(auth()->user()->roles[0]->name);

        // $user = Auth::user();
        // return view('admin.dashboard', compact('user'));
        // Fetch the data from the database
        $videos = DB::table('videos')
                    ->select('channel_id', DB::raw('COUNT(*) as count'))
                    ->groupBy('channel_id')
                    ->get();

        // Prepare the data for Highcharts
        $data = [];
        $totalUploads = 0;

        foreach ($videos as $video) {
            $data[] = [
                'name' => 'Channel ' . $video->channel_id, // Assuming you want to display 'Channel' with ID
                'y' => $video->count
            ];
            $totalUploads += $video->count;
        }

        return view('charts', compact('data', 'totalUploads'));
    }
    public function control()
    {
        $users = User::all();
        // $users = User::where('role', '!=', 'admin')->get();
        return view('admin.control', compact('users'));
    }
    public function channel_control()
    {
        // $users = User::all();
        $channels = channel::all();
        return view('channel.control', compact('channels'));
    }

    public function video_control()
    {
        // $users = User::all();
        $videos = Video::all();
        return view('video.control', compact('videos'));
    }
    public function edit($id)
    {
        $user = User::find($id);
        return view('admin.edit', compact('user'));
    }
    public function channel_edit($id)
    {
        $user = Channel::find($id);
        return view('channel.edit', compact('user'));
    }
    public function video_edit($id)
    {
        $video = Video::find($id);
        return view('video.edit', compact('video'));
    }
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->update($request->only(['name', 'email']));

        return redirect()->route('admin.control')->with('success', 'User updated successfully.');
    }
    public function channel_update(Request $request, $id)
    {
        $user = Channel::find($id);
        $user->update($request->only(['name', 'email']));

        return redirect()->route('admin.channel.control')->with('success', 'User updated successfully.');
    }
    public function video_update(Request $request, $id)
    {
        $video = Video::find($id);
        $video->update($request->only(['title', 'description']));

        return redirect()->route('admin.video.control')->with('success', 'Videos updated successfully.');
    }

    public function destroy($id)


    {
        $user = User::findorFail($id);
        $user->delete();

        return redirect()->route('admin.control')->with('success', 'User deleted successfully.');
    }
    public function channel_destroy($id)
    {
        $user = Channel::findOrFail($id);
        $user->delete();

        return redirect()->route('admin.channel.control')->with('success', 'Channel deleted successfully.');
    }
    public function video_destroy($id)
    {
        $user = User::find($id);
        $user->delete();

        return redirect()->route('video.control')->with('success', 'User deleted successfully.');
    }
    public function changeStatus(Request $request, User $user)
    {
        $user->status = $request->status;
        //  $user->save();
        if($user->save()) {
            return response()->json(['success' => true]);
        }
        return response()->json(['success' => false, 'message' => 'Failed to update status.']);

        // return response()->json(['success' => true, 'statusHtml' => $user->status ? 'Active' : 'Inactive']);
    }
    public function video_changeStatus(Request $request, Video $video)
    {
        $video->status = $request->status;
        if ($video->save()) {
        return response()->json(['success' => true]);
        }
        return response()->json(['success' => false, 'message' => 'Failed to update status.']);

    }
    public function channel_changeStatus(Request $request, Channel $channel)
    {
        $channel->status = $request->status;
        if ($channel->save()) {
        return response()->json(['success' => true]);
        }
        return response()->json(['success' => false, 'message' => 'Failed to update status.']);

    }
}
