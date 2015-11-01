//
//  CollectionViewCell.swift
//  parsemasterdetail
//
//  Created by Alex Beattie on 10/31/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class CollectionViewCell: PFCollectionViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tName: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tPrice: UILabel!
    @IBOutlet weak var gradientView: GradientView!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
