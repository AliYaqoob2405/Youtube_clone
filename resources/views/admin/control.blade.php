@extends('admin.dashboard')

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">
                        <h1 class="mb-0 text-center">All Users</h1>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($users as $user)
                                            <tr class="text-center">
                                                <td>{{ $user->id }}</td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>
                                                    <span class="badge {{ $user->status ? 'badge-success' : 'badge-secondary' }}">
                                                        {{ $user->status ? 'Active' : 'Inactive' }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        @can('user-edit')
                                                        <a href="{{ route('admin.edit', $user->id) }}" class="btn btn-sm btn-primary mr-2">
                                                            <i class="fas fa-edit"></i> Edit
                                                        </a>
                                                        @endcan
                                                        @can('user-delete')
                                                        <form action="{{ route('admin.destroy', $user->id) }}" method="POST" class="d-inline"
                                                            onsubmit="return confirm('Are you sure you want to delete this user?');">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-sm btn-danger">
                                                                <i class="fas fa-trash"></i> Delete
                                                            </button>
                                                        </form>
                                                        @endcan
                                                        <button class="btn btn-sm {{ $user->status ? 'btn-secondary' : 'btn-success' }}"
                                                                onclick="changeStatus({{ $user->id }}, {{ $user->status ? 0 : 1 }})">
                                                            {{ $user->status ? 'Deactivate' : 'Activate' }}
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center">No users found.</td>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
<script>
    function changeStatus(userId, newStatus) {
        fetch(`/admin/control/${userId}/change-status`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ status: newStatus })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.reload(); // Refresh page to reflect changes
            }
        })
        .catch(error => console.error('Error:', error));
    }
</script>
@endsection
