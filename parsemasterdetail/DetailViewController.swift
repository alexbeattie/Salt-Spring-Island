//
//  DetailViewController.swift
//  nickiandkarenapp
//
//  Created by Alex Beattie on 10/31/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MapKit
import MessageUI


class DetailViewController: UIViewController, UIScrollViewDelegate, MKMapViewDelegate, MFMailComposeViewControllerDelegate {
    
    var propObj = PFObject(className: PROP_CLASS_NAME)

    let WIDTH: CGFloat = 600
    let HEIGHT: CGFloat = 128
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    

    @IBOutlet weak var scrollView:UIScrollView!
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        dispatch_async(dispatch_get_main_queue(), {
//            let imageFile = self.propObj[PROP_IMAGE] as? PFFile
//            imageFile?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//                if error == nil {
//                    if let imageData = imageData {
//                        self.image1.image = UIImage(data: imageData)
////                        self.image1.frame.origin.x = self.view.frame.size.width
//                    } } }
//            
//            let imageFile2 = self.propObj[PROP_IMAGE2] as? PFFile
//            imageFile2?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//                if error == nil {
//                    if let imageData = imageData {
//                        self.image2.image = UIImage(data:imageData)
////                        self.image2.frame.origin.x = self.view.frame.size.width*2
//                    } } }
//            
//            let imageFile3 = self.propObj[PROP_IMAGE3] as? PFFile
//            imageFile3?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//                if error == nil {
//                    if let imageData = imageData {
//                        self.image3.image = UIImage(data:imageData)
////                        self.image3.frame.origin.x = self.view.frame.size.width*3
//                    } } }
//            
//            // Set previewScrollView content size
//            self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3.0, self.scrollView.frame.size.height)
//            self.scrollView.clipsToBounds = true 
//        })
//        
//
//    }
//    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

        let imageFile = self.propObj[PROP_IMAGE2] as? PFFile
            imageFile?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            if error == nil {
                if let imageData = imageData {

                    self.image1.image = UIImage(data: imageData)
                    
        } } }
    
        let imageFile2 = self.propObj[PROP_IMAGE3] as? PFFile
            imageFile2?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            if error == nil {
                if let imageData = imageData {
                    self.image2.image = UIImage(data:imageData)
    //                        self.scrollView.addSubview(self.image2)
    //
//                            self.image2.frame.origin.x = self.view.frame.size.width
                        } } }
    ////
                let imageFile3 = self.propObj[PROP_IMAGE4] as? PFFile
                imageFile3?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
                    if error == nil {
                        if let imageData = imageData {
                            self.image3.image = UIImage(data:imageData)
    //                        self.scrollView.addSubview(self.image3)
    //
                            self.image3.frame.origin.x = self.view.frame.size.width*2+20
                        } } }
    
    // Set previewScrollView content size
    
    scrollView.contentSize = CGSizeMake(1800, HEIGHT)
    }
    
//    override func viewDidLoad() {
//        let numOfViews = 3
//        for (i = 1; i < numOfViews; i++) {
       
//            let imageFile = self.propObj[PROP_IMAGE2] as? PFFile
//            imageFile?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//                if error == nil {
//                    if let imageData = imageData {
//                        
//                        self.image1.image = UIImage(data: imageData)
//                        
////                        self.image1.frame = CGRectMake(600, 0, self.WIDTH, 200)
//                        
////                        self.scrollView.addSubview(self.image1)
//                    } } }
//            
////            let imageFile2 = self.propObj[PROP_IMAGE3] as? PFFile
////            imageFile2?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
////                if error == nil {
////                    if let imageData = imageData {
////                        self.image2.image = UIImage(data:imageData)
////                        self.scrollView.addSubview(self.image2)
////
//////                        self.image2.frame.origin.x = self.view.frame.size.width
////                    } } }
//////
////            let imageFile3 = self.propObj[PROP_IMAGE4] as? PFFile
////            imageFile3?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
////                if error == nil {
////                    if let imageData = imageData {
////                        self.image3.image = UIImage(data:imageData)
////                        self.scrollView.addSubview(self.image3)
////
//////                        self.image3.frame.origin.x = self.view.frame.size.width*2
////                    } } }
//        
//            // Set previewScrollView content size
//        
//        scrollView.contentSize = CGSizeMake(WIDTH * 3, scrollView.frame.size.height)

//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
