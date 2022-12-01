<?php

namespace App\Http\Controllers;

use App\Models\comments;
use App\Models\incident;
use App\Models\incident_groups_user;
use App\Models\incidentModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MainController extends Controller
{
    public function main() {

        $data = new incident();
        //return view('main',['data' => $data->all()]);
        $id = Auth::id();
        //dump($id);
        return view('main',[
            'data' => $data->select('incidents.*')->join('incident_groups_users', 'group_view', '=', 'incident_group_id')->where('user_id', (int)$id)->get()
        ]);
    }

    public function addIncident(Request $request) {
        $incident = new incident();
        $incident->header = $request->input('header');
        $incident->type = $request->input('type');
        $incident->group_view = $request->input('group_view');
        $incident->description = $request->input('description');
        $incident->user = $request->input('user_inc');
        $incident->status = 1;
        $incident->updated_at = date('d-m-Y, H:i:s',time());
        $incident->created_at = date('d-m-Y, H:i:s',time());
        $incident->save();
        echo "<script>window.location.replace('/');</script>";
    }


    public function editIncident(Request $request) {
        $incident = new incident();
        $upd = [
            'header' => $request->input('header'),
            'type' => $request->input('type'),
            'group_view' => $request->input('group_view'),
            'description' => $request->input('description')
        ];
        $incident->where('id', '=' , $request->input('record_id'))->update(
            $upd
        );
        echo "<script>window.location.replace('/');</script>";
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
        
        $upd = [
            'status' => $request->input('change')       
        ];
        $new_status->where('id', '=' , $request->input('incident_id'))->update(
            $upd);
        $id = $request->input('incident_id');
        echo "<script>window.location.replace('/card?id=$id');</script>";
    }


    public function change_user(Request $request) {
        $new_status = new incident();
        $defaultStatus = "1";
        $upd = [
            'group_view' => $request->input('group_view'),
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
