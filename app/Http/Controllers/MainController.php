<?php
namespace App\Http\Controllers;
use App\Models\comments;
use App\Models\incident;
use App\Models\incident_groups_user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function main() {
        $data = new incident();
        //return view('main',['data' => $data->all()]);
        $choice="0";
        $id = Auth::id();
        //dump($id);
        return view('main',[
            'data' => $data->select('incidents.*')->join('incident_groups_users', 'group_view', '=', 'incident_group_id')->where('user_id', (int)$id)->orderBy('id', 'desc')->paginate(10), 'choice'=>$choice
        ]);
    }
    public function statsearch(Request $request) {
        $s = $request->s;
        $e = $request->e;
        $p = $request->p;
        $stats_g_selector = $request->stats_g_selector;
        $stats_u_selector = $request->stats_u_selector;
        $id = Auth::id();
        $data = new incident();
        //dd($stats_g_selector, $stats_u_selector);
        if ($s != null && $e != null)
        {
            if($p == 0)
            {
                if($stats_g_selector == 0)
                {
                    $count = DB::table('incidents')->select('incidents.*')->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->count();
                    //dd($count);
                    return view('searchstats',[
                        'data' => $data->select('incidents.*')->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                    ]);
                }
                elseif($stats_g_selector != 0)
                {
                    if($stats_u_selector != 0)
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                    else 
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.created_at', '>=', "{$s}")->where('incidents.created_at', '<=', "{$e}")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                }
            }
            elseif($p == 1)
            {
                if($stats_g_selector == 0)
                {
                    $count = DB::table('incidents')->select('incidents.*')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->count();
                    return view('searchstats',[
                        'data' => $data->select('incidents.*')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                    ]);
                }
                elseif($stats_g_selector != 0)
                {
                    if($stats_u_selector != 0)
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                    else
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "3")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                }
            }
            elseif($p == 2)
            {
                if($stats_g_selector == 0)
                {
                    $count = DB::table('incidents')->select('incidents.*')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->count();
                    return view('searchstats',[
                        'data' => $data->select('incidents.*')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                    ]);
                }
                elseif($stats_g_selector != 0)
                {
                    if($stats_u_selector != 0)
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                    else
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '=', "4")->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                }
            }
            elseif($p == 3)
            {
                
                if($stats_g_selector == 0)
                {
                    $count = DB::table('incidents')->select('incidents.*')->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->count();
                    return view('searchstats',[
                        'data' => $data->select('incidents.*')->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                    ]);
                }
                elseif($stats_g_selector != 0)
                {
                    if($stats_u_selector != 0)
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->where('incidents.user', '=', $stats_u_selector)->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                    else
                    {
                        $count = DB::table('incidents')->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->count();
                        return view('searchstats',[
                            'data' => $data->select('incidents.*')->where('incidents.group_view', '=', $stats_g_selector)->whereNotNull('incidents.resolved_at')->where('incidents.resolved_at', '>=', "{$s}")->where('incidents.resolved_at', '<=', "{$e}")->where('incidents.status', '>=', 3)->whereColumn('incidents.resolved_at', '>', 'incidents.deadline')->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector, 'count'=>$count
                        ]);
                    }
                }
            }
        }
        else{
            return view('searchstats',[
                'data' => $data->select('incidents.*')->where('incidents.created_at', '>=', Carbon::now()->subDays(30)->format('Y-m-d H:i:s'))->paginate(10), 's'=>$s, 'e'=>$e, 'p'=>$p, 'stats_g_selector'=>$stats_g_selector, 'stats_u_selector'=>$stats_u_selector
            ]);
        }
    }

    public function search(Request $request) {
        $s = $request->s;
        $choice = $request->choice;
        $id = Auth::id();
        $data = new incident();
        //dd($choice);
        if ($s != null)
        {
            switch($choice) {
                case(0):
                    return view('main',[
                        'data' => $data->select('incidents.*')->join('incident_groups_users', 'group_view', '=', 'incident_group_id')->where('user_id', (int)$id)->where('incidents.id', 'LIKE', "%{$s}%")->orderBy('id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice
                    ]);     
                case(1):
                    return view('main',[
                        'data' => $data->select('incidents.*')
                        ->where('incidents.id', 'LIKE', "%{$s}%")->where ('incidents.user', '=', $id)
                        ->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice
                    ]);     
                    break;
                case(2): return view('main',['data' => $data->select('incidents.*')->where('incidents.id', 'LIKE', "%{$s}%")->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice]); break;
                default: return view('main',['data' => $data->select('incidents.*')->where('incidents.id', 'LIKE', "%{$s}%")->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice]);
            }
        }
        else 
        {
            switch($choice) {
                case(0):
                    return view('main',[
                        'data' => $data->select('incidents.*')->join('incident_groups_users', 'group_view', '=', 'incident_group_id')->where('user_id', (int)$id)->orderBy('id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice
                    ]);
                    break;
                case(1):
                    return view('main',[
                        'data' => $data->select('incidents.*')->where ('incidents.user', '=', $id)
                        ->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice
                    ]);     
                    break;
                case(2): return view('main',['data' => $data->select('incidents.*')->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice]); break;
                default: return view('main',['data' => $data->select('incidents.*')->orderBy('incidents.id', 'desc')->paginate(10), 's'=>$s, 'choice'=>$choice]);
            }     
        }
    }

    public function addIncident(Request $request) {
        $id = Auth::id();
        //dd($id);
        $incident = new incident();
        $incident->header = $request->input('header');
        $incident->type = $request->input('type');
        $incident->group_view = $request->input('group_view_selector_create');
        $incident->description = $request->input('description');
        $incident->user = $request->input('usercreate');
        $incident->status = 1;
        $incident->updated_at = date('d-m-Y, H:i:s',time());
        $incident->created_at = date('d-m-Y, H:i:s',time());
        $incident->created_by = $id;
        $incident->priority_id = $request->input('priority_selector_create');
        if($incident->type == 'Массовый')
        {
            if ($incident->priority_id == 4) //низкий
            {
                $incident->deadline = Carbon::now()->addDays(7)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 3) //средний
            {
                $incident->deadline = Carbon::now()->addDays(3)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 2) //высокий
            {
                $incident->deadline = Carbon::now()->addDays(2)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 1) //наивысший
            {
                $incident->deadline = Carbon::now()->addDays(1)->format('Y-m-d H:i:s');
            }
        }
        elseif($incident->type == 'Единичный')
        {
            if ($incident->priority_id == 4) //низкий
            {
                $incident->deadline = Carbon::now()->addDays(14)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 3) //средний
            {
                $incident->deadline = Carbon::now()->addDays(7)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 2) //высокий
            {
                $incident->deadline = Carbon::now()->addDays(4)->format('Y-m-d H:i:s');
            }
            elseif ($incident->priority_id == 1) //наивысший
            {
                $incident->deadline = Carbon::now()->addDays(3)->format('Y-m-d H:i:s');
            }
        }
        $incident->save();
        echo "<script>window.location.replace('/');</script>";
    }

    public function editIncident(Request $request) {
        if ($request->status != 4){
            $incident = new incident();
            $upd = [
            'header' => $request->input('header'),
            'type' => $request->input('type'),
            'group_view' => $request->input('group_view'),
            'description' => $request->input('description')
            ];
            $incident->where('id', '=' , $request->input('record_id'))->update($upd);
        }
        
        echo "<script>window.location.replace('/');</script>";
    }

    public function editInCard(Request $request) {
        $incident = new incident();
        $upd = [
            'header' => $request->input('header'),
            'description' => $request->input('description'),
            'solution' => $request->input('solution')
        ];
        $incident->where('id', '=' , $request->input('record_id'))->update(
            $upd
        );
        //return view('card',['incident' => 'Карточка инцидента']);
        echo "<script>window.alert('Успешно сохранено');</script>";
        echo "<script>window.location.replace('/card?id=$request->record_id');</script>";
    }

    public function showCard(Request $request) {
        $data = new incident();
        return view('card',['data' => 'Карточка инцидента']);
    }

    public function addMessage(Request $request) {
        $comment_add = new comments();
        $comment_add->comment_text = $request->input('text_comment');
        $comment_add->card_id = $request->input('card_id');
        $comment_add->user_id = $request->input('uid');
        $comment_add->save();
        echo "<script>window.location.replace('/card?id=$comment_add->card_id');</script>";
    }

    public function change_status(Request $request) {
        $new_status = new incident();
        
        
        if($request->input('change') == 3)
        {
            $upd = [
                'status' => $request->input('change'), 
                'resolved_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];
        }
        else
        {
            $upd = [
                'status' => $request->input('change')   
            ];
        }
        $new_status->where('id', '=' , $request->input('incident_id'))->update(
            $upd);
        $id = $request->input('incident_id');
        echo "<script>window.location.replace('/card?id=$id');</script>";
    }

    public function change_user(Request $request) {
        $new_status = new incident();
        $defaultStatus = "1";
        $upd = [
            'group_view' => $request->input('group_view_selector'),
            'user' => $request->input('user'),
            'status' => $defaultStatus
        ];
        $new_status->where('id', '=' , $request->input('incident_id'))->update(
            $upd);
        $id = $request->input('incident_id');
        echo "<script>window.location.replace('/card?id=$id');</script>";
    }

    public function user_groups(Request $request) {
        return view('groups',['data' => 'Пользовательские группы инцидента']);
    }

    public function users(Request $request) {
        return view('users',['data' => 'Пользовательские группы инцидента']);
    }

    public function stats(Request $request) {
        return view('stats',['data' => 'Пользовательские группы инцидента']);
    }

    public function check_categories(Request $request) {
        // смотрим все категории и пишем их в массив методом toArray()
        $arr = \App\Models\incident_groups::all()->toArray();
        // все имеющиеся категории пишем в массив
        foreach ($arr as $ar) {
            $cats[] = $ar['id'];
        }
        //затем ищем категории, которые были отмечены галочкой при откправке настроек прав
        foreach ($_GET as $key => $value) {
            if ($key != 'uid') {
                $cats_checked[] = explode('_',$key)[1];
            }
        }
        // удаляем все назначенные права, если они были назначены ранее
        $arr = \App\Models\incident_groups_user::where('user_id','=',request('uid'))->delete();

        if (isset($cats_checked)) {
            foreach ($cats_checked as $cat) {
                $insert = new incident_groups_user();
                $insert->user_id = request('uid');
                $insert->incident_group_id = $cat;
                $insert->save();
            }
        }
        $id = request('uid');
        echo "<script>window.location.replace('/user_groups?id=$id');</script>";
    }
}