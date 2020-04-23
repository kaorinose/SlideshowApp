//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 0003 QBS on 2020/04/23.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 進むボタンの外見
    @IBOutlet weak var moveViewButton: UIButton!
    
    // 戻るボタンの外見
    @IBOutlet weak var returnViewButton: UIButton!
    
    // 再生・停止ボタンの外見
    @IBOutlet weak var startStopViewButton: UIButton!
    
    // 画像の外見
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
            moveViewButton.isEnabled = false
            returnViewButton.isEnabled = false
            // ボタンの名前を停止とする
            startStopViewButton.setTitle("停止", for: .normal)
            // 背景色・ボタン内テキストサイズを変更（さくら色設定）
            self.view.backgroundColor = UIColor.init(red: 1.0, green: 0.9, blue: 0.93, alpha: 1.0)
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            //再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            moveViewButton.isEnabled = true
            returnViewButton.isEnabled = true
            // ボタンの名前を再生とする
            startStopViewButton.setTitle("再生", for: .normal)
            self.view.backgroundColor = UIColor.white
        }
    }
    
    // 画像押下時の処理
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerのインスタンスを取得する
        let ResultViewController:ResultViewController = segue.destination as! ResultViewController
        // 画像を読み込み
        imageView1.image = images[imageIndex]
    // 遷移先のZoomInViewControllerで宣言しているselectedImgに値を代入して渡す
        ResultViewController.selectedImg = imageView1.image
        
        // 
        if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            //再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            moveViewButton.isEnabled = true
            returnViewButton.isEnabled = true
            // ボタンの名前を再生とする
            startStopViewButton.setTitle("再生", for: .normal)
            self.view.backgroundColor = UIColor.white
        } else{
        }
    }
}

