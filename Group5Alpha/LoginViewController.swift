//
//  LoginViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/30/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
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
    
    var users = [NSManagedObject]()

    @IBAction func loginButton(_ sender: Any) {
        if emailField.text == "" || passwordField.text == "" {
            
        } else {
            for item in users{
                if item.value(forKey: "email")! ==  emailField.text {
                    print(item.value(forKey: "birthday")!)
                    print(item.value(forKey: "email")!)
                    print(item.value(forKey: "firstName")!)
                    print(item.value(forKey: "password")!)
                }
            }
            //if checkUsernamePasswordMatch(email: emailField.text!, password: passwordField.text!) == true {
            /*
            for user in users {
                data = user.data*/
        }
    }
    }
    
    /*
    func checkUsernamePasswordMatch(email : String, password : String) ->Bool
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        }
        catch {
            // Error handler
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            users = results
        }
        else {
            print("Could not fetch")
        }
        
        print("FIRST")
        print(users)
        
        print("SECOND")
        for user in users {
            print(user)
        }
 
        return true
    }
    */

    func loadData() -> [NSManagedObject] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // Error handler
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            return results
        } else {
            print("Could not fetch")
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


