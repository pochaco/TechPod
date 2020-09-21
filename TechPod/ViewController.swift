//
//  ViewController.swift
//  TechPod
//
//  Created by Yamamoto Miu on 2020/09/16.
//  Copyright © 2020 Yamamoto Miu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //StoryBoardで使うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列を用意
    var songNameArray = [String]()
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        //テーブルビューのデリゲートメソッドはViewControllerクラスに書くよ、という設定
        table.delegate = self
        
        //songNameに曲名を入れていく
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray  = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
    }

    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示させる
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルにimageNameArrayの画像を表示させる
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルのファイル名を指定して、「パス」を取得する
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //AVaudioPlayerに音楽ファイルのパスを渡す
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //audioPlayerインスタンスに対してplay()メソッドを呼び出す
        audioPlayer.play()
    }

}


