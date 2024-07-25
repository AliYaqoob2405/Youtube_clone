<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminDashboardController;
use App\Http\Controllers\VideoController;
use App\Http\Controllers\UserDashboardController;
use App\Http\Controllers\ChartController;
use App\Http\Controllers\LandingPageController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\FavoriteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [LandingPageController::class,'index'])->name('welcome.index');
Route::get('/videos/favorites', [VideoController::class, 'favorites'])->name('videos.favorites')->middleware('auth');
Route::get('/dashboard',[HomeController::class,'user'])->name('dashboard');
Route::get('/shorts',[HomeController::class,'shorts'])->name('shorts');
Route::get('/search', [HomeController::class, 'search'])->name('search');
Route::get('user/videos/{video}', [LandingPageController::class, 'show'])->name('user.videos.show');
Route::get('/videos/{video}', [VideoController::class, 'show'])->name('videos.show');
Route::get('/user/videos/play/{video}', [VideoController::class, 'user_video_play'])->name('user.videos.play');
Route::get('/channel/create', [HomeController::class, 'create_channel'])->name('channel.create');
Route::get('/channel/{id}', [HomeController::class, 'channel_show'])->name('channel.show');
Route::post('/channel', [HomeController::class, 'channel_store'])->name('channel.store');
Route::get('/video/upload', [VideoController::class, 'video_upload'])->name('video.upload');
Route::get('/video/upload/show', [VideoController::class, 'video_upload_show'])->name('video.upload.show');
Route::get('/videos/category/{category}', [VideoController::class, 'showByCategory'])->name('videos.category');
Route::post('/videos/{video}/like', [VideoController::class, 'like'])->name('videos.like');
Route::post('/videos/{video}/dislike', [VideoController::class, 'dislike'])->name('videos.dislike');
Route::post('/user/videos/{video}/like', [LandingPageController::class, 'like'])->name('user.videos.like');
Route::post('/user/videos/{video}/dislike', [LandingPageController::class, 'dislike'])->name('user.videos.dislike');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});
Route::middleware('auth')->group(function () {
    Route::post('/videos/{video}/favorite', [FavoriteController::class, 'toggleFavorite'])->name('videos.favorite');
});

Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
});
require __DIR__.'/auth.php';

Route::group(['middleware' => ['role:admin|super admin|user|test']] ,function () {
    Route::get('/admin', [AdminDashboardController::class, 'index']);
    Route::get('/admin/dashboard', [AdminDashboardController::class, 'index'])->name('admin.dashboard');
    Route::get('/admin/videos/upload', [VideoController::class, 'upload'])->name('admin.videos.upload');
    Route::post('/videos', [VideoController::class, 'store'])->name('videos.store');
    Route::post('/videos/{id}', [VideoController::class, 'update'])->name('videos.update');
    Route::get('/videos/edit/{id}', [VideoController::class, 'edit'])->name('videos.edit');
    Route::delete('/videos/{id}', [VideoController::class, 'destroy'])->name('videos.destroy');
    Route::get('/videos/index', [VideoController::class, 'list'])->name('videos.list');
    Route::put('/videos/{video}/view', [VideoController::class, 'view'])->name('videos.view');

    Route::get('/user_channel',[HomeController::class,'channel'])->name('channel');
    Route::get('/channels', [HomeController::class, 'index'])->name('channels.index');
    Route::get('/channels/create', [HomeController::class, 'create'])->name('channels.create');
    Route::post('/channels', [HomeController::class, 'store'])->name('channels.store');
    Route::get('/channels/edit/{id}', [HomeController::class, 'edit'])->name('channels.edit');
    Route::post('/channels/{id}',[HomeController::class, 'update'])->name('channels.update');
    Route::delete('/channels/{id}', [HomeController::class, 'destroy'])->name('channels.destroy');

    Route::get('/chart', [ChartController::class, 'index'])->name('chart.index');

    Route::get('/admin/control',[AdminDashboardController::class, 'control'])->name('admin.control');
    Route::get('/admin/edit/{id}',[AdminDashboardController::class, 'edit'])->name('admin.edit');
    Route::put('/admin/{id}',[AdminDashboardController::class, 'update'])->name('admin.update');
    Route::delete('/admin/{id}',[AdminDashboardController::class,'destroy'])->name('admin.destroy');
    Route::put('/admin/control/{user}/change-status', [AdminDashboardController::class, 'changeStatus'])->name('admin.control.change-status');

    Route::get('/admin/channel/control',[AdminDashboardController::class, 'channel_control'])->name('admin.channel.control');
    Route::get('/admin/channel/{id}',[AdminDashboardController::class, 'channel_edit'])->name('admin.channel.edit');
    Route::put('/admin/channel/{id}',[AdminDashboardController::class, 'channel_update'])->name('admin.channel.update');
    Route::delete('/admin/channel/{id}',[AdminDashboardController::class,  'channel_destroy'])->name('admin.channel.destroy');
    Route::put('/admin/channel/{channel}/change-status', [AdminDashboardController::class, 'channel_changeStatus'])->name('admin.channel.change-status');

    Route::get('/admin/video/control',[AdminDashboardController::class, 'video_control'])->name('admin.video.control');
    Route::get('/admin/video/{id}',[AdminDashboardController::class, 'video_edit'])->name('admin.video.edit');
    Route::put('/admin/video/{id}',[AdminDashboardController::class, 'video_update'])->name('admin.video.update');
    Route::delete('/admin/video/{$id}',[AdminDashboardController::class,  'video_destroy'])->name('admin.video.destroy');
    Route::put('admin/videos/{video}/change-status', [AdminDashboardController::class,'video_changeStatus'])->name('admin.videos.change-status');
});
