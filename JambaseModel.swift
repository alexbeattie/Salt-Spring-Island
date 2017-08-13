//
//  JambaseModel.swift
//  jambase
//
//  Created by Alex Beattie on 11/7/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import Foundation
import Alamofire

class JambaseModel {
    
    var zipCode: Int!
    var apiUrl: String!
    var theTitle:String?
    var thePost:String?
    var imageUrl: String?
    var theLink: String?

    init(zipCode: Int) {
        self.zipCode = zipCode
        //apiUrl = "\(URL_BASE)\(MIDDLE_URL_PARAM)\(RADIUS)\(API_KEY)"
        apiUrl = "\(STRAIGHT_JSON)"
    }

    init(theLink: String){
        self.theLink = theLink
        
    }
    init(thePost:String, theTitle:String, imageUrl:String, theLink:String) {
      
        self.theTitle = theTitle
        self.thePost = thePost
        self.imageUrl = imageUrl
        self.theLink = theLink
        
    }
}