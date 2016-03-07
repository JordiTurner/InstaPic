//
//  InstaCell.swift
//  InstaPic
//
//  Created by Jordi Turner on 3/1/16.
//  Copyright © 2016 Jordi Turner. All rights reserved.
//

import UIKit
import Parse

class InstaCell: UITableViewCell {
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var instaImageView: UIImageView!
    
    var media = PFObject(className: "UserMedia"){
        didSet {
            print(media)
            captionLabel.text = media["caption"] as? String
            
            
            //instaImageView.image 
            let imageAsPF = media["media"] as! PFFile
            imageAsPF.getDataInBackgroundWithBlock { (imageData: NSData?, error:NSError?) -> Void in
                if error == nil {
                    let image = UIImage(data: imageData!)
                    self.instaImageView.image = image
                }
            }
            
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
