//
//  MasterViewController.swift
//  nickiandkarenapp
//
//  Created by Alex Beattie on 10/31/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MasterViewController: UICollectionViewController {
    
    @IBOutlet weak var listingCollectionView: UICollectionView!
    
    //    let refreshControl = UIRefreshControl()
    var recentListings = NSMutableArray()
    
    @IBOutlet weak var oneMbtn: UIBarButtonItem!
    @IBAction func oneMbtnPressed(sender: AnyObject) {
        oneMillionQuery()
    }
    @IBOutlet weak var allListings: UIBarButtonItem!
    @IBAction func allListingsBtnPressed(sender: AnyObject) {
        queryAllListings()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        
        
        self.listingCollectionView.alwaysBounceVertical = true
        
        queryAllListings()
        
    }
  
    //MARK: Collection View Delegate Methods
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath ) {
        _ = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentListings.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        var cell = nil!
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ListingCell", forIndexPath: indexPath) as! CollectionViewCell
         cell.image.image = nil;
       
        var listingClass = PFObject(className: "Recipe")
        listingClass = recentListings[indexPath.row] as! PFObject
        
        //        cell.activityIndicator.startAnimating()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            let imageFile = listingClass[PROP_IMAGE] as? PFFile
            imageFile?.getDataInBackgroundWithBlock { (imageData, error) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        cell.image.image = UIImage(data: imageData)
                    }else {
                        //                    cell.activityIndicator.stopAnimating()
                        //                    cell.activityIndicator.removeFromSuperview()
                    }
                    cell.activityIndicator.stopAnimating()
                    //                cell.activityIndicator.removeFromSuperview()
                    
                }
            }
            
        })
        
        
        
        if let listingName = listingClass["name"] as? String {
            cell.tName.text = listingName
            //            print(listingName)
        }
        
        //        if let listingPrice = listingClass["listingPrice"] as? String {
        //            cell.tPrice.text = listingPrice
        //            //            print(listingPrice)
        //        }
        let formatter = NSNumberFormatter()
        //        formatter.allowsFloats = false
        formatter.usesSignificantDigits = false
        formatter.minimumSignificantDigits = 1
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        if let listingPrice = listingClass[NEW_PROP_PRICE] as? NSNumber {
            cell.tPrice.text =  formatter.stringFromNumber (listingPrice)
        }
        
        
        return cell
        
        
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var listingClass = PFObject(className: "Listings")
        listingClass = recentListings[indexPath.row] as! PFObject
        
        let pdVC =  storyboard!.instantiateViewControllerWithIdentifier("PropertyDetails") as! DetailViewController
        pdVC.propObj = listingClass
        navigationController?.pushViewController(pdVC, animated: true)
        print(listingClass)
    }

    
    // MARK: UICollectionViewDelegate
    
    //    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    //        if let paper = papersDataSource.paperForItemAtIndexPath(indexPath) {
    //            performSegueWithIdentifier("MasterToDetail", sender: paper)
    //        }
    //    }
    
}
