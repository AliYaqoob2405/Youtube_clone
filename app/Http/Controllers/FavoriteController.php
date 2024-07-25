<?php

namespace App\Http\Controllers;

use App\Models\Video;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function toggleFavorite(Request $request, $videoId)
    {
        $user = Auth::user();
        $video = Video::find($videoId);

        if (!$video) {
            return response()->json(['success' => false, 'message' => 'Video not found']);
        }

        if ($user->favoriteVideos()->where('video_id', $videoId)->exists()) {
            $user->favoriteVideos()->detach($videoId);
            return response()->json(['success' => true, 'favorited' => false]);
        } else {
            $user->favoriteVideos()->attach($videoId);
            return response()->json(['success' => true, 'favorited' => true]);
        }
    }
}
