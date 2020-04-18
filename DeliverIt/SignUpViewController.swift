//
//  SignUpViewController.swift
//  DeliverIt
//
//  Created by Pooja Yadav on 4/17/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var checkpasswordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        guard let userEmail = emailTextField.text,
                let userPassword = passwordTextField.text else {
                    return
            }
        
            let newUser = PFUser()
            newUser.username = userEmail
            newUser.password = userPassword
            newUser["firstname"] = firstnameTextField.text
            newUser["lastname"] = lastnameTextField.text
            newUser["checkPassword"] = checkpasswordTextField.text
            newUser["birthday"] = birthdayTextField.text
            newUser["address"] = addressTextField.text
            newUser["city"] = cityTextField.text
            newUser["state"] = stateTextField.text
            newUser["zip"] = zipcodeTextField.text
            newUser["number"] = numberTextField.text
        
            newUser.signUpInBackground { (success, error) in
                if(success){
                    print("We signed up!")
                }else{
                    print("Error:\(error?.localizedDescription ?? "There was a problem signing up")")
                }
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


