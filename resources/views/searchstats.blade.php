@php
    use Illuminate\Support\Facades\Auth;
    use Illuminate\Pagination\LengthAwarePaginator;
    if($stats_g_selector != 0)
    {
      $selectedGroup = \App\Models\incident_groups::find($stats_g_selector)->name;
    }
    //dd($stats_u_selector);
    if(($stats_u_selector != 0)&&($stats_u_selector != null))
    {
      $selectedUser = \App\Models\User::find($stats_u_selector)->name;
    }
@endphp
@extends('header')

@section('main-content')

<form class="mb-3" method="GET" action="{{ route('statsearch') }}">
    
  <div class="container">
      <div class="mt-4 row">
          <div class="col-6 text-center">
              Начало периода <input required type="datetime-local" class="form-control" id="s" name="s" value="<? echo isset($s) ? $s: "";?>">
          </div>
          <div class="col-6 text-center">
              Конец периода <input required type="datetime-local" class="form-control" id="e" name="e" value="<? echo isset($e) ? $e: "";?>">
          </div>
      </div>   
  </div>
  
  <div class="container">
      <div class="mt-4 row">
          <div class="col-4 text-center">
              <select class="form-select" id="p" name="p">
                          
              <option value="0" <? echo ($p=="0" ? "selected": "");?>>Созданные инциденты</option>
              <option value="1" <? echo ($p=="1" ? "selected": "");?>>Решенные инциденты</option>
              <option value="2" <? echo ($p=="2" ? "selected": "");?>>Закрытые инциденты</option>
              <option value="3" <? echo ($p=="3" ? "selected": "");?>>Просроченные инциденты</option>

              
              </select>
          </div>
          <div class="col-4 text-center">

              <select class="form-select" id="stats_g_selector" name="stats_g_selector" required>
                    
              <option value="0">Все команды</option> 
              
              @foreach(\App\Models\incident_groups::all() as $cat_stats_g) 
                  <option value="{{$cat_stats_g->id}}" <? echo (($stats_g_selector)==($cat_stats_g->id) ? "selected": "");?>>{{$cat_stats_g->name}}</option> 
              @endforeach
                
              </select>

          </div>
          <div class="col-4 text-center">
                
              @foreach(\App\Models\incident_groups::all() as $cat_stats_u)
              
              @if(@count(DB::table('incident_groups_users')->select('user_id', 'incident_group_id')->where('incident_group_id','=',$cat_stats_u->id)->get()) > 0)
                  <select style='display: none;' class="form-select myselectclassstats" id="stats_u_selector" name="stats_u_selector" data-group-stats="{{$cat_stats_u->id}}" disabled>
                  
                  <option value="0">Все сотрудники</option> 
                  
                  @foreach(DB::table('incident_groups_users')->select('user_id', 'incident_group_id')->where('incident_group_id','=',$cat_stats_u->id)->get(); as $useridstats) 
                      <option value="{{$useridstats->user_id}}">{{\App\Models\User::find($useridstats->user_id)->name}}</option> 
                  @endforeach
                  
                  </select>
              @endif
              @endforeach

          </div>
      </div>
  </div>

  <div class="container">
      <div class="row justify-content-center mt-3">
          <button class="btn btn-outline-success" type="submit">Искать</button>
      </div>
  </div>

</form>

<div class="container">
  <div class="mb-3 row justify-content-center">
    <label for="count" class="col-sm-3 col-form-label myHeaderClass">Количество таких записей:</label>
    <div class="col-sm-9">
      <input type="text" readonly class="form-control-plaintext" id="count" value="{{$count}}">
    </div>
  </div>

  <div class="mb-3 row justify-content-center">
    <label for="selectedGroup" class="col-sm-3 col-form-label myHeaderClass">Выбранная команда:</label>
    <div class="col-sm-9">
      <input type="text" readonly class="form-control-plaintext" id="selectedGroup" value="<? echo ($stats_g_selector=="0" ? "Все команды": "{$selectedGroup}");?>">
    </div>
  </div>

  <div class="mb-3 row justify-content-center">
    <label for="selectedUser" class="col-sm-3 col-form-label myHeaderClass">Выбранный сотрудник:</label>
    <div class="col-sm-9">
      <input type="text" readonly class="form-control-plaintext" id="selectedUser" value="<? echo ((($stats_u_selector=="0")||($stats_u_selector == null)) ? "Все сотрудники": "{$selectedUser}");?>">
    </div>
  </div>
</div>


@if(Auth::check())
     
    <div class="container-fluid">
        <div class="row">
          <div class="col text-center mt-6">
            <h3 style="margin-top: 15px; color: green">Для перехода на карточку инцидента кликните на номер инцидента.</h3>
          </div>
        </div>
        <br>
        <br>
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
                  <th scope="col">Инициатор</th>
                  <th scope="col">Решен</th>
                  <th scope="col">Крайний срок решения</th>
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
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{\App\Models\User::find($d->created_by)->name}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->resolved_at}}</span>
                  </td>
                  <td>
                    <span class="text_{{$d->id}}" style="display: block">{{$d->deadline}}</span>
                  </td>
                </tr> 
                @endforeach
              </tbody>
            </table>
          </div>
          
          {{ $data->appends(['s'=>request()->s, 'e'=>request()->e, 'p'=>request()->p, 'stats_g_selector'=>request()->stats_g_selector, 'stats_u_selector'=>request()->stats_u_selector])->links() }}
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

<script>
  $(document).ready(function(){
    $('select[name=stats_g_selector]').on("change", function(){
      let val = $(this).find("option:selected").val();

      //Скрываем все селекты
      $('select.myselectclassstats[data-group-stats]').prop("disabled", true).hide();
      
      //Ищем только нужный
      let s = $(`select.myselectclassstats[data-group-stats=${val}]`);

      //Показываем
      s.prop("disabled", false).show();
    });
  });
</script>

@endsection()
