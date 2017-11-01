//
//  ResetPasswordViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/31/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAction(_ sender: AnyObject) {
        
        if emailField.text == "" {
            
            errorLabel.text = "Please enter an email."
            
        } else {
            
            Auth.auth().sendPasswordReset(withEmail: emailField.text!, completion: { (error) in
                
                if error != nil {
                    self.errorLabel.text = "Error: " + (error?.localizedDescription)!
                } else {
                    self.errorLabel.text = "Password reset email sent"
                }

            })
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
