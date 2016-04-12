//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {


    // MARK - Storyboard Outlets
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!

    // MARK - Types
    var photos: [Photo]!
    var cellHeight: CGFloat = 240

    override func viewDidLoad() {
        super.viewDidLoad()


        // collection.delegate = self // N/A since CVController

        self.title = "Posts"
        collection.backgroundColor = UIColor.clearColor()

        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let cellWidth = self.view.frame.width / 2
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)

        photos = [Photo]()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)

    }

    /*
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collection.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell


        let pic = photos[indexPath.row]

        cell.userLabel.text = pic.username
        cell.likeLabel.text = "\(pic.likes)"
        loadImageForCell(pic, imageView: cell.myImage)

        return cell
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }


    /* Creates a session from a photo's url to download data to instantiate a UIImage.
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {

        /*
        let url = NSURL(string: photo.photoURL)!

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                let img = UIImage(data: data!)
                imageView.image = img
            }
        }
        task.resume()
        */
        let downloadQueue = dispatch_queue_create("com.zeleznick.processdowload", nil)

        dispatch_async(downloadQueue) {

            let data = NSData(contentsOfURL: NSURL(string: photo.photoURL)!)
            var image: UIImage?

            if data != nil {
                photo.imageData = data
                image = UIImage(data: data!)
            }
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }

    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        // self.collectionView!.reloadData()
        self.collection!.reloadData()
    }

}

