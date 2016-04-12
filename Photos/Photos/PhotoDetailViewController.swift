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
    
    @IBOutlet weak var heartButton: UIButton!
    
    // MARK - Types
    var dataBundle : [String : Any]!
    let filled: UIImage = UIImage(named: "HeartFilled")!
    let empty: UIImage = UIImage(named: "Heart")!
    var state: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(false, animated: true)
        postImage.image = UIImage(data: dataBundle["imageData"] as! NSData)
        let date = NSDate(timeIntervalSince1970: Double("\(dataBundle["date"]!)")!)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        dateLabel.text = "\(dateFormatter.stringFromDate(date))"
        
        userLabel.text = "\(dataBundle["username"]!)"
        likeLabel.text = "Likes: " + Utils.commaStrFormat("\(dataBundle["likes"]!)")
        
        heartButton.setImage(empty, forState:.Normal);
        heartButton.setImage(filled, forState:.Highlighted);
    }
    
    func toggleHeart() {
        if (state == 0) {
             heartButton.setImage(filled, forState: UIControlState.Normal)
             heartButton.setImage(empty, forState: UIControlState.Highlighted)
        }
        else {
            heartButton.setImage(empty, forState: UIControlState.Normal)
            heartButton.setImage(filled, forState: UIControlState.Highlighted)
        }
        state = 1 - state
    }
    @IBAction func heartPressed(sender: AnyObject) {
        print("Heart pressed")
        toggleHeart()
    }
    
}