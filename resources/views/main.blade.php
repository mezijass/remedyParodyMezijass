@php
    use Illuminate\Support\Facades\Auth;
    use Illuminate\Pagination\LengthAwarePaginator;
    $types = new \App\Models\incident_groups();
    $data_types = $types->all();
@endphp
@extends('header')
@section('main-content')

    @if(Auth::check())
     
    <div class="container-fluid">
        <div class="row">
          <div class="col text-center mt-6">
            <h3 style="margin-top: 15px; color: green">Для перехода на карточку инцидента кликните на номер инцидента.</h3>
          </div>
        </div>
        <br>
        <br>
        <div>
          <form class="d-flex mb-3" method="GET" action="{{ route('search') }}">
            <select class="form-select" aria-label="Искать только среди..." id="choice" name="choice">
              <option <? echo ($choice=="0" ? "selected": "");?> value="0">Назначенные моим командам</option>
              <option <? echo ($choice=="1" ? "selected": "");?> value="1">Назначенные мне</option>
              <option <? echo ($choice=="2" ? "selected": "");?> value="2">Все инциденты</option>
            </select>
            <input value="<? echo isset($s) ? $s: "";?>" class="form-control me-2" type="search" placeholder="Введите номер инцидента..." aria-label="Search" id="s" name="s">
            <button class="btn btn-outline-success" type="submit">Искать</button>
          </form>
        </div>
        <div class="row">
          <div class="col">
            <table class="table table-striped table-success table-border text-center">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Заголовок</th>
                  <th scope="col">Описание</th>
                  <th scope="col">Тип</th>
                  <th scope="col">Назначенная команда</th>
                  <th scope="col">Статус</th>
                  <th scope="col">Текущий исполнитель</th>
                  <th scope="col">Создан</th>
                  <th scope="col">Обновлён</th>
                </tr>
              </thead>
              <tbody> @foreach($data as $d) <tr>
                  <input type="hidden" value="{{$d->id}}" name="record_id">
                  <th scope="row">
                    <a style="text-decoration: none" href="/card?id={{$d->id}}">{{$d->id}}</a>
                  </th>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->header}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->description}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->type}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block" span>{{\App\Models\incident_groups::find($d->group_view)->name}}</span>
                  </td>
                  <td>{{\App\Models\statuses::find($d->status)->name}}</td>
                  <td>{{\App\Models\User::find($d->user)->name}}</td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->created_at}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->updated_at}}</span>
                  </td>
                </tr> 
                @endforeach
              </tbody>
            </table>
          </div>
          {{ $data->appends(['s'=>request()->s])->links() }}
        </div>
      </div> @else <div class="container-fluid">
        <div class="row">
          <div class="col text-center">
            <h3 style="margin-top: 120px;">Для просмотра записей в таблице необходимо <a href="/login">авторизоваться в системе</a>
            </h3>
          </div>
        </div>
      </div> 

@endif




@endsection
