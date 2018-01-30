@extends('layouts.master_template')

@section('links')
	<link rel="stylesheet" href="css/welcome.css">
@endsection

@section('nav-section')
	
	<nav class="navbar navbar-expand-sm">
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
	
	<div class="row">
		<div style="width: 40%; margin: 17% auto 1% auto; padding: 1%;">

				<div class="welcome-logo">
					<center><img src="{{Storage::url('pictures/website/clozet.png')}}" /></center>
				</div>

				<div class="welcome-btn">
					<center><a href="" class="btn"><strong>BROWSE OUTFITS</strong></a></center>
				</div>

				<div class="welcome-message">
					<center><h3 class="">Find out where your community <br>clothes</h3></center>
				</div>
		</div>
	</div>
@endsection