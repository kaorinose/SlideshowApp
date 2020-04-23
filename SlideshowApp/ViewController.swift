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
    
    var imageIndex = 0
    
    let images: [UIImage] = [UIImage(named:"sakura.jpg")!, UIImage(named:"sunset.jpg")!, UIImage(named:"hanabi.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView1.image = images[imageIndex]
    }
    
    @IBAction func moveButton(_ sender: Any) {
    }
    
    @IBAction func returnButton(_ sender: Any) {
    }
    
    @IBAction func startStopButton(_ sender: Any) {
    }
    

}

