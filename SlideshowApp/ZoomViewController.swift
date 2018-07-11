//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 理化学Mac on 2018/07/10.
//  Copyright © 2018年 yuusukesaito. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomUpImage: UIImageView!
    
    var zoomUp: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ///ViewControllerから受け取った画像の表示
        zoomUpImage.image = self.zoomUp
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
