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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        
        
        self.listingCollectionView.alwaysBounceVertical = true
        
        queryCollection()
        
    }
    //    func handleRefresh(sender: AnyObject?)
    //    {
    //
    //    }
    //
    func queryCollection() {
        recentListings.removeAllObjects()
        view.showHUD(view)
        
        let query = PFQuery(className: "Recipe")
        query.orderByDescending("currentCost")
        query.cachePolicy = .NetworkElseCache
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let objects = objects  {
                    for object in objects {
                        self.recentListings.addObject(object)
                    } }
                // Reload CollView
                self.listingCollectionView.reloadData()
                self.view.hideHUD()
                
            } else {
                print("alex")
                
            } }
        
    }
    
    
    
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
        var listingClass = PFObject(className: "Recipe")
        listingClass = recentListings[indexPath.row] as! PFObject
        
        let pdVC =  storyboard!.instantiateViewControllerWithIdentifier("PropertyDetails") as! DetailViewController
        pdVC.propObj = listingClass
        navigationController?.pushViewController(pdVC, animated: true)
    }

    
    // MARK: UICollectionViewDelegate
    
    //    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    //        if let paper = papersDataSource.paperForItemAtIndexPath(indexPath) {
    //            performSegueWithIdentifier("MasterToDetail", sender: paper)
    //        }
    //    }
    
}
