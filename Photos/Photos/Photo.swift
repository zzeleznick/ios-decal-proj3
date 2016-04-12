//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
<<<<<<< HEAD
    var photoURL : String!
    /* The username of the photographer. */
    var username : String!
    /* The raw data of the image. */
    var imageData : NSData!
    /* The url to the post */
    var postURL : String!
    
=======
    var url : String!
    /* The username of the photographer. */
    var username : String!

>>>>>>> c707703f85ce9887168fabb0a3e02bfe637035ee
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
<<<<<<< HEAD
        print("Init called from Photo with data \(data)")
        self.postURL = data["link"] as! String
        let imgObj = data["images"] as! [String:AnyObject]
        let resObj = imgObj["standard_resolution"] as! [String:AnyObject]
        self.photoURL = resObj["url"] as! String
        
        let likeObj = data["likes"] as! [String:AnyObject]
        self.likes = likeObj["count"] as! Int
        let userObj = data["user"] as! [String:AnyObject]
        self.username = userObj["username"] as! String
=======
>>>>>>> c707703f85ce9887168fabb0a3e02bfe637035ee
    }

}