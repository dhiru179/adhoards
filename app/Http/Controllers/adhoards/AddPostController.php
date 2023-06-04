<?php

namespace App\Http\Controllers\adhoards;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AddPostController extends Controller
{

    public function adposts()
    {
        $category = DB::table('category')->get();
        $sub_category = DB::table('sub_category')->orderBy('category_id', 'ASC')->get();
        return view('adhoards.adposts', compact('category', 'sub_category'));
    }
    public function proceed(Request $request)
    {
        $category_id = $request->post('main_catid');
        $sub_category_id = $request->post('sub_catid');
        return ['url' => "/adposts/$category_id/$sub_category_id"];
    }
    public function formGenerate($cat_id, $sub_cat_id)
    {
        $results = DB::table('rel_form_tag_cat_subcat')
            ->join('form_tag', 'rel_form_tag_cat_subcat.form_tag_id', '=', 'form_tag.id')
            ->select('form_tag.*')
            ->where(['rel_form_tag_cat_subcat.category_id'=>$cat_id,'rel_form_tag_cat_subcat.sub_category_id'=>$sub_cat_id])
            ->get();
        // return $result;
        return view('adhoards.adpost_form',compact('results'));
    }
}
