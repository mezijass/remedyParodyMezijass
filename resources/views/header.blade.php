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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="../../css/style.css" rel="stylesheet">
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
                        <!-- Button переход на Главную -->
                        <div class="container">
                        <a style="width: 150px; height: 60px;" class="btn btn-primary " href="{{ route('main') }}">Главная страница</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <div class="container">
                        <button style="width: 150px; height: 60px;" type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Создать новый инцидент</button>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- Button переход на user_groups -->
                        <div class="container">
                        <a style="width: 150px; height: 60px;" class="btn btn-success" href="/user_groups">Редактировать команды</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- Button переход на users -->
                        <div class="container">
                        <a style="width: 150px; height: 60px;" class="btn btn-danger" href="/users">Справочник сотрудников</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- Button переход на stats -->
                        <div class="container">
                        <a style="width: 150px; height: 60px;" class="btn btn-info" href="/stats">Отчеты и статистика</a>
                        </div>
                    </li>
                    
            </ul>


            <li class="nav-item dropdown d-flex">
                <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    {{Auth::user()->name}}
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                    <li>
                        <a class="dropdown-item" href="{{ url('/logout') }}"
                            onclick="event.preventDefault();
                            document.getElementById('logout-form').submit();">
                            Выйти из системы
                        </a>
                    </li>
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
                    <input id="header" class="form-control" type="text" name="header" required>
                    <br>
                    <label class="form-label" for="type">Тип</label>
                    <select id="type" name="type" class="form-control" required>
                        <option value="Единичный">Единичный</option>
                        <option value="Массовый">Массовый</option>
                    </select>
                    <br>
                    <label class="form-label" for="type">Назначить команде</label>

                    <select class="form-select" name="group_view_selector_create" required>
                      
                        <option hidden>Назначить команде</option> 
                        
                        @foreach(\App\Models\incident_groups::all() as $catcreate) 
                        <option value="{{$catcreate->id}}">{{$catcreate->name}}</option> 
                        @endforeach
                      
                      </select>
                      <br>
                      
                      @foreach(\App\Models\incident_groups::all() as $cat2create)
                       
                        @if(@count(DB::table('incident_groups_users')->select('user_id', 'incident_group_id')->where('incident_group_id','=',$cat2create->id)->get()) > 0)
                        <!--<p style="text-align: center">Список сотрудников, которые входят в команду {{$cat2create->name}}:</p>-->
                          <select style='display: none;' class="form-select myselectclasscreate" name="usercreate" data-group-create="{{$cat2create->id}}" required>
                            
                            <option hidden>Назначить пользователю</option> 
                            
                            @foreach(DB::table('incident_groups_users')->select('user_id', 'incident_group_id')->where('incident_group_id','=',$cat2create->id)->get(); as $useridcreate) 
                            <option value="{{$useridcreate->user_id}}">{{\App\Models\User::find($useridcreate->user_id)->name}}</option> 
                            @endforeach
                          
                          </select>
                        @endif
                      @endforeach
                    <br>
                    
                    <label class="form-label" for="group_view">Описание инцидента</label>
                    <textarea id="description" class="form-control" name="description" required></textarea>
                    <br>
                    <select class="form-select" name="priority_selector_create" required>
                      
                        <option hidden>Приоритет инцидента</option> 
                        
                        @foreach(\App\Models\priority::all() as $priorityall) 
                        <option value="{{$priorityall->id}}">{{$priorityall->name}}</option> 
                        @endforeach
                      
                      </select>
                      

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-warning" form="addf">Сохранить изменения</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
      $('select[name=group_view_selector_create]').on("change", function(){
        let val = $(this).find("option:selected").val();

        //Скрываем все селекты
        $('select.myselectclasscreate[data-group-create]').prop("disabled", true).hide();
        
        //Ищем только нужный
        let s = $(`select.myselectclasscreate[data-group-create=${val}]`);

        //Показываем
        s.prop("disabled", false).show();
      });
    });
</script>

@yield('main-content')


<!-- Дополнительный JavaScript -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

