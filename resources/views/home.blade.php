@extends('layouts.app')

@section('content')
    <div class="container">
        @comments(['model' => $post] ) @endcomments
    </div>
@endsection
