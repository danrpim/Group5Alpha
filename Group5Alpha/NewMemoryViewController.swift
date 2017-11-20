//
//  NewMemoryViewController.swift
//  Group5Alpha
//
//  Created by Daniel Pimentel on 10/29/17.
//  Copyright © 2017 Daniel Pimentel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import MediaPlayer
import CoreLocation

class NewMemoryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var memoryTextField: UITextField!
    
    @IBOutlet weak var emotionTextField: UITextField!
    
    @IBOutlet weak var dropdownList: UIPickerView!
    
    let date : String = ""
    
    var emotion = ["Happy", "Excited", "Nervous", "Anxious", "Angry", "Frustrated", "Tired",  "Annoyed"]
    
    var refMemories: DatabaseReference? = nil
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        memoryTextField.delegate = self
        
        self.dropdownList.dataSource = self
        self.dropdownList.delegate = self
        
        refMemories = Database.database().reference(withPath: "memories")
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
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

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return emotion.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return emotion[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.emotionTextField.text = self.emotion[row]
        // self.dropdownList.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.emotionTextField {
            self.dropdownList.isHidden = false
            // if you dont want the users to se the keyboard type:
            textField.endEditing(true)
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        /*
        var longitude = locationManager.location?.coordinate.longitude
        
        var latitude = locationManager.location?.coordinate.latitude
        
        
        var location = CLLocation(latitude: latitude, longitude: longitude)
        print(location)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            println(location)
            
            if error != nil {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as! CLPlacemark
                println(pm.locality)
            }
            else {
                println("Problem with the data received from geocoder")
            }
        })
 
        let aGMSGeocoder: GMSGeocoder = GMSGeocoder()
        aGMSGeocoder.reverseGeocodeCoordinate(CLLocationCoordinate2DMake(self.latitude, self.longitude)) {
            (let gmsReverseGeocodeResponse: GMSReverseGeocodeResponse!, let error: NSError!) -> Void in
            
            let gmsAddress: GMSAddress = gmsReverseGeocodeResponse.firstResult()
            print("\ncoordinate.latitude=\(gmsAddress.coordinate.latitude)")
            print("coordinate.longitude=\(gmsAddress.coordinate.longitude)")
            print("thoroughfare=\(gmsAddress.thoroughfare)")
            print("locality=\(gmsAddress.locality)")
            print("subLocality=\(gmsAddress.subLocality)")
            print("administrativeArea=\(gmsAddress.administrativeArea)")
            print("postalCode=\(gmsAddress.postalCode)")
            print("country=\(gmsAddress.country)")
            print("lines=\(gmsAddress.lines)")
        }
 
         */
        
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    @IBAction func createMemory(_ sender: Any) {
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .long
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.dateStyle = .none
        
        // get the date string from the date object
        let date = dateFormatter.string(from: currentDateTime) // October 8, 2016
        // get the time string from the date object
        let time = timeFormatter.string(from: currentDateTime) // 10:48 PM
        
        print(date)
        
        print(time)
        
        print(locationManager.location ?? "none")
        
        var music = ""
        
        let songArtist = MPMusicPlayerController().nowPlayingItem?.albumArtist ?? "none"
        let songTitle = MPMusicPlayerController().nowPlayingItem?.title ?? "none"
        
        if songArtist == "none" && songTitle == "none" {
            music = "No Music"
        } else {
            music = songTitle + " by " + songArtist
        }
        
        let key = self.refMemories?.childByAutoId().key
        
        let memory = ["id": key!, "description": self.memoryTextField.text!, "emotion": self.emotionTextField.text!, "music": music, "userEmail": Auth.auth().currentUser?.email, "location": locationManager.location.debugDescription]
        
        self.refMemories?.child(key!).setValue(memory)

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.navigationController!.pushViewController(vc!, animated: true)
        
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
