@extends('admin.dashboard')

@section('content')
    <div class="container mt-5 d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="col-md-6">
            <h1 class="text-center mb-4">Edit User</h1>
            <form action="{{ route('admin.update', $user->id) }}" method="POST">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{ $user->name }}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="{{ $user->email }}" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
@endsection

