@extends('layouts.master_template')

@section('links')
	<link rel="stylesheet" href="css/welcome.css">
@endsection

@section('nav-section')
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- Brand/logo -->
	  
	  <div style=" 
	   				width: 100%; 
	   				height: 100%;
	   				padding: 0 48.9%;
	   	">
		  <a class="navbar-brand" href="#">
			 <img src="{{Storage::url('pictures/website/logo.png')}}" alt="logo" style="width:40px;">
		  </a>
	  </div>
	  <!-- Links -->
	  <ul class="navbar-nav">
	  </ul>
	</nav>
@endsection

@section('container-two-section-one')
@endsection