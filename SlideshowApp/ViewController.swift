//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 0003 QBS on 2020/04/23.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    // タイマーにの設定
    var timer: Timer!
    
    // 最初に表示されている画像の設定
    var imageIndex = 0
    
    // 表示する画像の配列定義（画像３枚）
    let images: [UIImage] = [UIImage(named:"sakura.jpg")!, UIImage(named:"sunset.jpg")!, UIImage(named:"hanabi.jpg")!]
    
    // 画像表示
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //配列画像の表示
        imageView1.image = images[imageIndex]
    }
    
    // 進むボタンを押した時の処理
    @IBAction func moveButton(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView1.image = images[imageIndex]
    }
    
    // 戻るボタンを押した時の処理
    @IBAction func returnButton(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView1.image = images[imageIndex]
    }
    
    // selector: #selector(onTimer(_:)) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、2.0秒毎に呼び出され続ける
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView1.image = images[imageIndex]
    }
    
    // 再生・停止ボタンを押した時の処理
    @IBAction func startStopButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            //再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            //moveButton.isEnabled = false
            //returnButton.isEnabled = false
            // ボタンの名前を停止とする
            //startStopButton.setTitle("停止", for: .normal)
            // 背景色・ボタン内テキストサイズを変更
            self.view.backgroundColor = UIColor.lightGray
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            //再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            //moveButton.isEnabled = true
            //returnButton.isEnabled = true
            // ボタンの名前を再生とする
            //startStopButton.setTitle("再生", for: .normal)
            self.view.backgroundColor = UIColor.white
        }
    }
}

