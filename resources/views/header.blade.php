@php
    use Illuminate\Support\Facades\Auth;
    $types = new \App\Models\incident_groups();
    $data_types = $types->all();
@endphp
<!doctype html>
<html lang="ru">
<head>
    <!-- Обязательные метатеги -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>АИС "Управление инцидентами"</title>
</head>

<script>
    function edit_mode(id) {
        let show = document.getElementsByClassName('editform_' + id.toString());
        let hidden = document.getElementsByClassName('text_' + id.toString());

        let arr_style = {
            'none' : 'block',
            'block' : 'none'
        }
        let arr_type = {
            'text' : 'hidden',
            'hidden' : 'text',
        }



        // -2 в цикле, т.к. в учётных системах не принято редактировать даты создания чего-либо. Поэтому формы для дат создания и обновления не выводим
        for (i = 0; i < show.length-2; i++) {
            console.log(show[i].type = arr_type[show[i].type])
            console.log(hidden[i].style.display = arr_style[hidden[i].style.display])
        }

        let hidden_selector = document.getElementById('selector_for_hidden' + id.toString())
        hidden_selector.style.display = 'block'

    }
</script>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="{{ route('main') }}">АИС "Управление инцидентами"</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">

                @if(Auth::check())
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="{{ route('main') }}">Главная</a>
                    </li>
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                            Создать новый инцидент
                        </button>
                    </li>
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <a  class="btn btn-primary" style="margin-left: 7px;" href="/user_groups">
                            Пользовательские группы
                        </a>
                    </li>

            </ul>
            <li class="nav-item dropdown d-flex">
                <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    {{Auth::user()->name}}
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item" href="#">Просмотр профиля</a></li>
                    <li><a class="dropdown-item" href="#">Мои действия</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="{{ url('/logout') }}"
                           onclick="event.preventDefault();
      document.getElementById('logout-form').submit();">
                            Выйти из системы
                        </a></li>
                </ul>
            </li>
                @endif

            <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>

            @if(!Auth::check())
            <div class="d-flex">
                <a class="btn btn-success" href="/login">Вход</a>
                <a class="btn btn-warning" style="margin-left: 15px;" href="/register">Регистрация</a>
            </div>
            @endif


        </div>
    </div>
</nav>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Новый инцидент</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addf" method="get" action="/add">
                    @csrf
                    <label class="form-label" for="header">Заголовок</label>
                    <input id="header" class="form-control" type="text" name="header">
                    <br>
                    <label class="form-label" for="type">Тип</label>
                    <select id="type" name="type" class="form-control" required>
                        <option value="Массовый">Массовый</option>
                        <option value="Единичный">Единичный</option>
                    </select>
                    <br>
                    <label class="form-label" for="type">Укрупнённая группа инцидента</label>
                    <select id="group_view" name="group_view" class="form-control" required>
                        @foreach($data_types as $d)
                            <option value="{{$d->id}}">{{$d->name}}</option>
                        @endforeach

                    </select>
                    <br>
                    <label class="form-label" for="type">Назначить пользователю</label>
                    <select id="group_view" name="user_inc" class="form-control" required>
                    @foreach(\App\Models\User::all() as $user)
                            <option value="{{$user->id}}">{{$user->name}}</option>
                        @endforeach

                    </select>
                    <br>
                    <label class="form-label" for="group_view">Описание инцидента</label>
                    <textarea id="description" class="form-control" name="description"></textarea>
{{--                    <button class="">Сохранить</button>--}}
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-warning" form="addf">Сохранить изменения</button>
            </div>
        </div>
    </div>
</div>


@yield('main-content')


<!-- Дополнительный JavaScript; выберите один из двух! -->

<!-- Вариант 1: Bootstrap в связке с Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- Вариант 2: Bootstrap JS отдельно от Popper
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
-->


