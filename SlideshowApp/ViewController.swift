//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 理化学Mac on 2018/07/10.
//  Copyright © 2018年 yuusukesaito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var count = 1
    
    var timer: Timer!
    
    var dispImageNo = 0

    @IBOutlet weak var rePlayButton: UIButton!
    
    
    func displayImage() {
        
        ///画像の配列とループの作成
        let imageNameArrey = ["food_full_english_breakfast", "onigiri_yukari", "food_ma-bo-nasu"]
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        ///イメージをImageViewに表示
        let name = imageNameArrey[dispImageNo]
        
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    ///スライドショーのページ送り設定
    @objc func updateTimer(_ timer: Timer) {
        dispImageNo += 1
        displayImage()
    }
    
    
    @IBAction func rePlay(_ sender: Any) {
        
        count += 1
        
        if count%2 == 0, self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            ///ボタンの表示切り替え
            rePlayButton.setTitle("停止", for: .normal)
            rePlayButton.setTitleColor(UIColor.black, for: .normal)
        }
            
            ///タイマーの破棄
        else if count%2 == 1, self.timer != nil {
            
            self.timer.invalidate()
            self.timer = nil
            
            ///ボタンの表示切り替え
            rePlayButton.setTitle("再生", for: .normal)
            rePlayButton.setTitleColor(UIColor.black, for: .normal)
        }
        else {
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if self.timer == nil {
            
            dispImageNo -= 1
            displayImage()
        }
        
    
    }
    @IBAction func nex(_ sender: Any) {
        if self.timer == nil {
            
            dispImageNo += 1
            displayImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ///停止と再生ボタンの動作設定
        rePlayButton.addTarget(self, action: #selector(ViewController.rePlay(_:)), for: UIControlEvents.touchUpInside)
        
        
        ///初期画像設定
        let image = UIImage(named: "food_full_english_breakfast")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///ZoomViewControllerへのデータ引き渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let zoomImage:ZoomViewController = segue.destination as! ZoomViewController
        zoomImage.zoomUp = self.imageView.image
    }
    
    
    
    
    ///画像をタップしてZoomViewControllerへ遷移
    
    @IBAction func onTapimage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    ///ZoomViewControllerから戻ってきたときに呼び出される
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        if count%2 == 0, self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        
    }
    
    


}
}
