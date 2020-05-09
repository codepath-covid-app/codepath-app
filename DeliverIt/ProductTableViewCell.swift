//
//  ProductTableViewCell.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    //@IBOutlet weak var totalPriceOutput: UITextField!
    
    var product: PFObject? = nil

    @IBAction func onStepperAction(_ sender: UIStepper) {
        let oldValue = Double(countLabel.text!)
        var user:PFObject? = nil
        countLabel.text = Int(sender.value).description
        user = PFUser.current()
        var cart = [PFObject]()
        cart = (user?["cart"] as? [PFObject])!
        if (sender.value > oldValue!) {
            cart.append(product!)
            user!["cart"] = cart
            user?.saveInBackground { (success, error) in
                if (success) {
                    print("Saved")
                } else {
                    print(error)
                }
            }
        } else {
            if let index = cart.firstIndex(of: product!) {
                cart.remove(at: index)
                user!["cart"] = cart
                user?.saveInBackground { (success, error) in
                    if (success) {
                        print("Saved")
                    } else {
                        print(error)
                    }
                }
            }
        }
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
