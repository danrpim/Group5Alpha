//
//  RegisterViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/30/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var passwordConfirmField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var users = [NSManagedObject]()

    // var alertController: UIAlertController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        birthdayField.delegate = self
        passwordField.delegate = self
        */
 
        // Do any additional setup after loading the view.
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
    
    @IBAction func createButton(_ sender: Any) {
        if firstNameField.text == "" || lastNameField.text == "" || emailField.text == "" || birthdayField.text == "" || passwordField.text == "" || passwordConfirmField.text == "" {
            
            // Decided to use error label instead of alert
            
            /*
            self.alertController = UIAlertController(title: "Error", message: "Enter a value for all of the fields.", preferredStyle: UIAlertControllerStyle.alert)
            
            // Create "OK" button action
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in }
            
            self.alertController!.addAction(OKAction)
                
            present(self.alertController!, animated: true, completion:nil)
            */
            
            errorLabel.text = "Enter a value for all of the fields."
            
        } else {
            if passwordField.text != passwordConfirmField.text {
                
                errorLabel.text = "The passwords do not match."
                
            } else {
                
                createUser(firstName: firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, birthday: birthdayField.text!, password: passwordField.text!)
                
            }
        }
    }
    
    fileprivate func createUser(firstName: String, lastName: String, email: String, birthday: String, password: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        user.setValue(email, forKey: "email")
        user.setValue(birthday, forKey: "birthday")
        user.setValue(password, forKey: "password")

        
        // Commit the changes
        do {
            try managedContext.save()
        }
        catch {
            // Error handler
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        users.append(user)
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
