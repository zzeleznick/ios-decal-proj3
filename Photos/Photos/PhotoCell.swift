//
//  PhotoCell.swift
//  Photos
//
//  Created by Zach Zeleznick on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        // let tileFont = UIFont.systemFontOfSize(14, weight: UIFontWeightMedium).fontName
        // let labelFont = UIFont.systemFontOfSize(11, weight: UIFontWeightLight).fontName
        
        
        userLabel?.textColor = UIColor.blackColor()
        userLabel?.font = UIFont(name: Theme.fontName, size: Theme.titleSize)
        
        likeLabel?.textColor = UIColor(white: 0.45, alpha: 1.0)
        likeLabel?.font = UIFont(name: Theme.fontName, size: Theme.subtitleSize)

        
        myImage?.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        myImage?.layer.borderWidth = 0.5
    }
}