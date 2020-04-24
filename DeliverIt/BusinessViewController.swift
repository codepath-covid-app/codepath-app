//
//  BusinessViewController.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var businessTableVIew: UITableView!
    
    let businesses = ["Buisness 1", "Business 2", "Business 3", "Business 4"]
    
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
        cell.nameLabel.text = businesses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "businessSegue", sender: self)
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
