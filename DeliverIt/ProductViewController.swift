//
//  ProductViewController.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //let products = ["Product 1", "Product 2", "Product 3"]
    
    var products: [PFObject] = []
    
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func onControlSwitched(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                //Calendar is shown
                productTableView.isHidden = false
            case 1:
                productTableView.isHidden = true
                //Calendar is hidden
            default:
                break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "Product") as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.nameLabel.text = product["Name"] as! String
        cell.priceLabel.text = String(format: "$%.2f", (product["Price"] as AnyObject).floatValue)
        cell.countLabel.text = "0"
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
