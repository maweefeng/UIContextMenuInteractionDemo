//
//  ImagePreviewVC.swift
//  HelloDrak
//
//  Created by 尚软科技 on 2020/7/17.
//  Copyright © 2020 小马科技. All rights reserved.
//

import UIKit

class ImagePreviewVC: UIViewController {
    @IBOutlet weak var imageV:UIImageView!
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
            imageV.image = image
        }
    }
    
}
