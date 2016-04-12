//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Zach Zeleznick on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController : UIViewController {
 
    // MARK - Storyboard Outlets
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    // MARK - Types
    var dataBundle : [String : Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(false, animated: true)
        postImage.image = UIImage(data: dataBundle["imageData"] as! NSData)
        dateLabel.text = "\(dataBundle["date"]!)"
        userLabel.text = "\(dataBundle["username"]!)"
        likeLabel.text = "\(dataBundle["likes"]!)"
    }
}