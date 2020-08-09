<?php
    $raw_actor1 = array('name' => '易烊千玺', 'subname' => '1111', 'photo' => 'https://tvax4.sinaimg.cn/large/007JuAjBgy1ghia55yuf5j303y03y0t7.jpg');
    $raw_actor2 = array('name' => '周冬雨', 'subname' => '222', 'photo' => 'https://tvax4.sinaimg.cn/large/007JuAjBgy1ghibh5p5jnj30420423zf.jpg');
    $actor1 = array($raw_actor1, $raw_actor2);
    $movie1 = array('movieName' => '少年的你', 'movieTime' => '2020-11-01', 'moviePic' =>  'https://tvax3.sinaimg.cn/large/007JuAjBgy1ghibla48iwj30ew0ku40d.jpg', 'actorData' => $actor1);
    
    $raw_actor3 = array('name' => '施瓦辛格', 'subname' => '3333', 'photo' => 'https://tva3.sinaimg.cn/large/007JuAjBgy1ghibhjnjndj302r03n3ye.jpg');
    $raw_actor4 = array('name' => '沙拉', 'subname' => '4444', 'photo' => 'https://tvax2.sinaimg.cn/large/007JuAjBgy1ghibhy7nqhj302t03ldfq.jpg');
    $actor2 = array($raw_actor3, $raw_actor4);
    $movie2 = array('movieName' => '终结者', 'movieTime' => '2020-12-12', 'moviePic' =>  'https://tva1.sinaimg.cn/large/007JuAjBgy1ghiblu3au6j30dd0kuab7.jpg', 'actorData' => $actor2);
    
    $movie = array($movie1, $movie2);
    
    $res_success = json_encode($movie);
    header('Content-Type:application/json');//这个类型声明非常关键
    
    echo $res_success;
?>
