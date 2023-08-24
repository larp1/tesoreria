<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @if (Auth::guest())
        <meta name="user" content="0">              
    @else
        <meta name="user" content="{{ Auth::user()->rol->key }}">
    @endif
    
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Tesorería</title>
</head>

<body>
    @include('web.partials.nav-header-main')
    
    <main role="main" class="col-12 pt-3 px-4">
        <div class="p-0">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb p-0">
                    
                  
              </ol>  
            </nav>
        </div>    
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <div class="container-fluid pr-0 pl-0 container-post" id="app">
                @yield('content')
            </div>
        </div>
    </main>
    </div>
    </div>
   
    <script src="{{ asset('js/app.js') }}"></script>
    @stack('scripts')
</body>

</html>
