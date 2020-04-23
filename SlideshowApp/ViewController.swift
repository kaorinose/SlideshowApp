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
    
    //最初に表示されている画像の設定
    var imageIndex = 0
    
    //表示する画像の配列定義（画像３枚）
    let images: [UIImage] = [UIImage(named:"sakura.jpg")!, UIImage(named:"sunset.jpg")!, UIImage(named:"hanabi.jpg")!]
    
    //画像表示
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //配列画像の表示
        imageView1.image = images[imageIndex]
    }
    
    //進むボタンを押した時の処理
    @IBAction func moveButton(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView1.image = images[imageIndex]
    }
    
    //戻るボタンを押した時の処理
    @IBAction func returnButton(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView1.image = images[imageIndex]
    }
    
    //再生・停止ボタンを押した時の処理
    @IBAction func startStopButton(_ sender: Any) {
    }
    

}

