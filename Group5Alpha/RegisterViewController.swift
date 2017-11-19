//
//  RegisterViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/30/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    // @IBOutlet weak var firstNameField: UITextField!
    
    // @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    // @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var confirmedPasswordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        emailField.delegate = self
        passwordField.delegate = self
        confirmedPasswordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dismiss keyboard when hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Dismess keyboard by touching outside of it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func createButton(_ sender: AnyObject) {
        if emailField.text == "" || passwordField.text == "" {
            
            errorLabel.text = "Enter a value for all of the fields."
            
        } else {
            
            if passwordField.text != confirmedPasswordField.text {
    
                errorLabel.text = "Passwords do not match."
                
            } else {
                
                Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    
                    if error == nil {
                        
                        print("You have successfully signed up")

                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                        self.navigationController!.pushViewController(vc, animated: true)
                        
                    } else {
                        
                        self.errorLabel.text = "Error: " + (error?.localizedDescription)!
                        
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    

