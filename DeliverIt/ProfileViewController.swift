//
//  ProfileViewController.swift
//  DeliverIt
//
//  Created by Sudiksha Sarvepalli on 4/25/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
   
    
  
    
    // sign up fields
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newUser = PFUser.current()
        firstNameTextField.text = newUser?["firstname"] as! String
        lastNameTextField.text = newUser?["lastname"] as! String
        birthdayTextField.text = newUser?["birthday"] as! String
        streetAddressTextField.text = newUser?["address"] as! String
        cityTextField.text = newUser?["city"] as! String
        stateTextField.text = newUser?["state"] as! String
        zipCodeTextField.text = newUser?["zip"] as! String
        emailTextField.text = newUser?["username"] as! String
        phoneNumberTextField.text = newUser?["number"] as! String

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func changeProfilePic(_ sender: Any) {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)

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
