//
//  Config.swift
//  parsemasterdetail
//
//  Created by Alex Beattie on 10/31/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import Foundation
import Parse

let APP_NAME = "Li Read Group"

var hudView = UIView()
var animImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))

let URL_BASE = "https://trailapi-trailapi.p.mashape.com/"
//let URL_POKEMON = "/api/v1/pokemon/"

typealias DownloadComplete = () -> ()

let PARSE_APP_KEY = "Vipj9Y6OjWXj3vuw2zjcoUMzEDDiqEi1DCXekiQ1"
let PARSE_CLIENT_KEY = "Z9I3ZudkmGXciSR4hslA6SvQgi6XA6W1mQE8cnIu"



let PROP_CLASS_NAME = "Recipe"
let PROP_TITLE = "name"
let PROP_IMAGE = "imageFile"
let PROP_IMAGE2 = "imageFile_2"
let PROP_IMAGE3 = "imageFile_3"
let PROP_IMAGE4 = "imageFile_4"

let PROP_DESCRIPTION = "listingDescription"
let PROP_PRICE = "listingPrice"
let NEW_PROP_PRICE = "currentCost"

//let PROP_TYPE = "type"
//let PROP_ACTION = "action"

let PROP_ADDRESS = "address"
let PROP_ADDRESS_LOWERCASE = "addressLowercase"
let PROP_DETAILS = "details"
let PROP_SELLER_POINTER = "sellerPointer"




























extension UIView {
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
