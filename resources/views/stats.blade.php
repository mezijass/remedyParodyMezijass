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
                            
                <option value="0">Созданные инциденты</option>
                <option value="1">Решенные инциденты</option>
                <option value="2">Закрытые инциденты</option>
                <option value="3">Просроченные инциденты</option>

                
                </select>
            </div>
            <div class="col-4 text-center">

                <select class="form-select" id="stats_g_selector" name="stats_g_selector" required>
                      
                <option value="0">Все команды</option> 
                
                @foreach(\App\Models\incident_groups::all() as $cat_stats_g) 
                    <option value="{{$cat_stats_g->id}}">{{$cat_stats_g->name}}</option> 
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
