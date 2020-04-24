//
//  ProductTableViewCell.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    @IBAction func onStepperAction(_ sender: UIStepper) {
        countLabel.text = Int(sender.value).description
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
