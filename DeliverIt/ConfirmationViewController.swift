//
//  ConfirmationViewController.swift
//  DeliverIt
//
//  Created by Sudiksha Sarvepalli on 5/2/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class ConfirmationViewController: UIViewController {
    

    
    
    @IBOutlet weak var priceOutput: UILabel!
    
    @IBOutlet weak var ordersList: UITextView!

    
    @IBOutlet weak var submitOrderButton: UIButton!
    
    //var i = 0
    var strng: String = ""
    //var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()
        let cart = (user?["cart"] as? [PFObject])!
        print(cart[0])
        //ordersList = cart[0]
        
        var totalPrice = 0.0
        var orders = [String]()
        for item in cart{
            //print(item)
            orders.append(item["Name"] as! String)
            totalPrice += item["Price"] as! Double
        //   print(type(of: item["Price"]))
        }

        for o in orders{
            strng += "\(o)\n"
        }
        //strng += "\(orders[i])\n"
        //print(strng)
        priceOutput.text = String(format: "$%.2f", totalPrice)
        ordersList.text = strng
        

//        let user = PFUser.current()
//        let cart = (user?["cart"] as? [PFObject])!
//        print(cart[0])
//        //ordersList = cart[0]
//        var totalPrice = 0.0
//        var orders = [String]()
//        for item in cart{
//            //print(item)
//            orders.append(item["Name"] as! String)
////            totalPrice += item["Price"] as! Double
////            //print(type(of: item["Price"]))
//        }
//        totalPriceOutput.text = String(format: "%.2f", totalPrice)
            
        //ordersList.text = orders

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitOrder(_ sender: Any) {
        performSegue(withIdentifier: "finishedOrder", sender: self)
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
