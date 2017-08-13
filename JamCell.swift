//
//  JamCell.swift
//  jambase
//
//  Created by Alex Beattie on 2/16/16.
//  Copyright © 2016 Alex Beattie. All rights reserved.
//

import UIKit
import Alamofire

class JamCell: UITableViewCell {

    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var postContent: UITextView!

    @IBOutlet weak var anImageView: UIImageView!

    var theLink:String?
    var request: Request?

    
    var jam: JambaseModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func drawRect(rect: CGRect) {

    }
    
 
    func urlToImageView(imageString: String){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            dispatch_async(dispatch_get_main_queue(), {
               
                let url = NSURL(string: imageString)
                let imageData = NSData(contentsOfURL: url!)
              
                if(imageData != nil){

                    self.imageView!.image = UIImage(data: imageData!)
                    
                } else {
                    self.urlToImageView(imageString)
            }
            
        });
    });
    
}
    
    func configureCell(jam: JambaseModel) {
        self.jam = jam
        self.anImageView.image = nil
        self.theLink = jam.theLink
        self.theTitle.text = jam.theTitle?.stringByReplacingOccurrencesOfString("<.*?>", withString: "", options: .RegularExpressionSearch, range: nil)
        
        //  self.postContent.text = jam.thePost!.stringByReplacingOccurrencesOfString("<.*?>", withString: "", options: .RegularExpressionSearch, range: nil)
        
        Alamofire.request(.GET, jam.imageUrl!).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, err in
            if err == nil {
                let img = UIImage(data: data!)!
                self.anImageView.image = img
            }
        
        })
        

        
    }
    
}
