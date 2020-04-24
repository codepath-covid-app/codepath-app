//
//  LoginViewController.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/16/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUpPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
    

    @IBAction func onLogIn(_ sender: Any) {
        guard let username = emailTextField.text,
                let userPassword = passwordTextField.text else {
                    return
            
        }
        PFUser.logInWithUsername(inBackground: username, password: userPassword) { (user, error) in
            if user != nil{
                print("We logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else{
                print("Error:\(error?.localizedDescription ?? "There was a problem logging in")")
            }
            }
        
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
