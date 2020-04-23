//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 0003 QBS on 2020/04/23.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // 画像２の外見
    @IBOutlet weak var imageView2: UIImageView!
    
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像を設定
        imageView2.image = selectedImg
    }
    
    // 戻るボタンを押した時の処理
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
