@guest
<nav class="navbar navbar-expand-md navbar-light bg-primary w-100">
    <div class="container-fluid w-100">
      <a class="navbar-brand text-white" href="{{route('index')}}">Tesorería</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active text-white" aria-current="page" href="{{route('index')}}">Alumnos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link  text-white" href="{{route('resumen')}}">Resumen</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
@endguest
