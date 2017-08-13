//
//  JamCollectionViewCell.swift
//  LiReadGroup
//
//  Created by Alex Beattie on 2/21/16.
//  Copyright © 2016 Alex Beattie. All rights reserved.
//

import UIKit
import Alamofire

class JamCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var gradientView: GradientView!
    
    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var postContent: UITextView!
    
    @IBOutlet weak var anImageView: UIImageView!
    var theLink:String?
    
    var request: Request?
    var jam: JambaseModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.backgroundColor = UIColor.blackColor()
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
                self.activityIndicator.stopAnimating()

            }
            
        })
        
        
        
    }
    
}
