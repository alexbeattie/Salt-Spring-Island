//
//  JamCollectionViewController.swift
//  LiReadGroup
//
//  Created by Alex Beattie on 2/21/16.
//  Copyright © 2016 Alex Beattie. All rights reserved.
//

import UIKit
import Alamofire

//private let reuseIdentifier = "cell"

class JamCollectionViewController: UICollectionViewController {

    @IBOutlet var jamCollectionView: UICollectionView!
    var jamArr = [JambaseModel]()

    var zipCode: Int!
    
    var apiUrl: String!
    
    var theTitle:String?
    var thePost:String?
    var theLink:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Market Analysis"
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        dispatch_async(dispatch_get_main_queue(), {
            self.showHUD(self.view)
        })

        // Register cell classes
        goGetSomeData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func goGetSomeData() {
        let url = NSURL(string: "\(LI_READ_CAT)")!
        print(url)

        Alamofire.request(.GET, url)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                let result = response.result
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    //                self.jamArr = []
                    
                    if let posts = dict["posts"] as? [[String : AnyObject]] where posts.count > 0 {
                        for post in posts {
                            if let theTitle = post["title"] as? String {
                                
                                if let theLink = post["url"] as? String {
                                    
                                    if let thumbNail = post["thumbnail"] as? String {
                                        
                                        if let thePost = post["content"] as? String {
                                            
                                            let apost = JambaseModel.init(thePost: thePost, theTitle:theTitle, imageUrl:thumbNail, theLink: theLink)
                                            
                                            self.jamArr.append(apost)
                                            print("The link is: \(theLink)")
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                self.jamCollectionView!.reloadData()
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.hideHUD()
                })


        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jamArr.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let jam = self.jamArr[indexPath.row]

        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? JamCollectionViewCell {
//        cell.image.image = nil;
    
        cell.configureCell(jam)

        return cell
        } else {
            return JamCollectionViewCell()
        }
        
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "mySegue" {
            if let cell = sender as? JamCollectionViewCell {
                if let index = jamCollectionView.indexPathForCell(cell)?.row {
                    if let destinationVC = segue.destinationViewController as? DetailViewController {
                        destinationVC.webSite = self.jamArr[index].theLink
                    }
                }
            }
        }
    }
    
    var hudView = UIView()
    var animImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))
    
        func showHUD(inView: UIView) {
            hudView.frame = CGRectMake(0, 0, inView.frame.size.width, inView.frame.size.height)
            hudView.backgroundColor = UIColor.whiteColor()
            hudView.alpha = 0.9
            
            let imagesArr = ["h0", "h1", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9"]
            var images : [UIImage] = []
            //NSMutableArray()
            for var i = 0;   i < imagesArr.count;   i++ {
                images.append(UIImage(named: imagesArr[i])! )
                //addObject(UIImage(named: imagesArr[i])!)
            }
            animImage.animationImages = images
            animImage.animationDuration = 0.7
            animImage.center = hudView.center
            hudView.addSubview(animImage)
            animImage.startAnimating()
            
            inView.addSubview(hudView)
        }
        
        func hideHUD() {  hudView.removeFromSuperview()  }
    

 



}
