//
//  ContextDemoVC.swift
//  HelloDrak
//
//  Created by 尚软科技 on 2020/7/17.
//  Copyright © 2020 小马科技. All rights reserved.
//

import UIKit

class ContextDemoVC: UIViewController , UIContextMenuInteractionDelegate {
    
    @IBOutlet weak var imageV:UIImageView!
    @available(iOS 13.0, *)
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: "meues" as NSCopying, previewProvider: {
            let vc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ImagePreviewVC") as! ImagePreviewVC
            vc.image = self.imageV.image
            return vc
        }) { (element) -> UIMenu? in
            let action1 =  UIAction(title: "存储", image: UIImage.init(systemName: "square.and.arrow.down"), identifier: nil, discoverabilityTitle: "", attributes: [], state: .off) { (_) in
                self.saveImage()
            }
            let editMeue = UIMenu(title: "", image: nil, identifier: .help, options: .displayInline, children: [action1])
            return editMeue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let context = UIContextMenuInteraction(delegate: self)
            self.imageV.addInteraction(context)
        }
    }
    
    private func saveImage(){
        UIImageWriteToSavedPhotosAlbum(self.imageV.image ?? UIImage(), self, nil, nil)
    }
}
