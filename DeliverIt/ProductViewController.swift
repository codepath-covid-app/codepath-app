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

    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var onSubmit: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //@IBOutlet weak var totalPriceOutput: UITextField!
    
    @IBOutlet weak var totalPriceOutput: UITextField!
    @IBOutlet weak var priceOutput: UILabel!
    @IBOutlet weak var totalPriceView: UIView!
    
    @IBAction func onControlSwitched(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                //Calendar is shown
                productTableView.isHidden = false
                scheduleView.isHidden = true
                totalPriceView.isHidden = false
                
            case 1:
                productTableView.isHidden = true
                scheduleView.isHidden = false
                totalPriceView.isHidden = true
                //Calendar is hidden
            default:
                break
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            productTableView.delegate = self
            productTableView.dataSource = self
            PFUser.current()!["cart"] = []

            // Do any additional setup after loading the view.
            
            //super.viewDidLoad()
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = productTableView.dequeueReusableCell(withIdentifier: "Product") as! ProductTableViewCell
            let product = products[indexPath.row]
            cell.product = product
            cell.nameLabel.text = product["Name"] as! String
            cell.priceLabel.text = String(format: "$%.2f", (product["Price"] as AnyObject).floatValue)
            cell.countLabel.text = "0"
            return cell
        }
        
        
        @IBAction func selectDate(_ sender: Any) {
            performSegue(withIdentifier: "nextView", sender: self)
        }
        
        //func
        
        
        @IBAction func calculateTotalPrice(_ sender: Any) {
            let user = PFUser.current()
            let cart = (user?["cart"] as? [PFObject])!
            
            //ordersList = cart[0]
            var totalPrice = 0.0
            //var orders = [String]()
            for item in cart{
                //print(item)
                //orders.append(item["Name"] as! String) as! String
                totalPrice += item["Price"] as! Double
                //print(type(of: item["Price"]))
            }
            priceOutput.text = String(format: "%.2f", totalPrice)
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
