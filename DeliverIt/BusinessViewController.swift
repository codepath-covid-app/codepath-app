//
//  BusinessViewController.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class BusinessViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var businessTableVIew: UITableView!
    
    var businesses = [PFObject]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = PFQuery(className:"Businesses")
        query.includeKey("Products")
        query.findObjectsInBackground { (data, error) in
            if data != nil {
                self.businesses = data!
                self.businessTableVIew.reloadData()
            }
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        businessTableVIew.dataSource = self
        businessTableVIew.delegate = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTableVIew.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessViewCell
        let business = self.businesses[indexPath.row]
        let string = business["Name"] as! String
        cell.nameLabel.text = string
        return cell
    }
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    self.performSegue(withIdentifier: "businessSegue", sender: self)
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = businessTableVIew.indexPath(for: cell)!
        let business = businesses[indexPath.row]
        let products = business["Products"]
        let productView = segue.destination as! ProductViewController
        productView.products = products as! [PFObject]
        businessTableVIew.deselectRow(at: indexPath, animated: true)
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
