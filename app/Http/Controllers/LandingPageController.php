<?php

namespace App\Http\Controllers;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LandingPageController extends Controller
{
    public function index()
    {
        // Fetch videos from the database
        // $videos = Video::all();
        $videos = Video::inRandomOrder()->take(7)->get();
        return view('welcome', compact('videos'));
    }
    public function show(Video $video)
    {
        // $videos = Video::inRandomOrder()->take(7)->get();
        return view('user.show', compact('video'));

    }
    public function like(Request $request, Video $video)
    {
        // Increment like count
        $video->increment('likes');
        return response()->json([
            'success' => true,
            'likes' => $video->likes,
            'dislikes' => $video->dislikes
        ]);
    }

    public function dislike(Request $request, Video $video)
    {
        // Increment dislike count
        $video->increment('dislikes');
        return response()->json([
            'success' => true,
            'likes' => $video->likes,
            'dislikes' => $video->dislikes
        ]);
    }

}

