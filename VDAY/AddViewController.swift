//
//  AddViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

   @IBOutlet weak var picker: UIPickerView!
   @IBOutlet weak var day_picker: UIPickerView!
   
   
   // Data for muscle group
   let pickerData = ["Chest", "Arms", "Shoulders", "Back", "Legs", "Abs", "Off Day"]
   
   //Data for days
   let day_pickerData = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
   
   var day = 0
   var group = 0
   var muscle_group = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()

      // Do any additional setup after loading the view.
      
      // Connect data:
      picker.delegate = self
      picker.dataSource = self
      
      //Connect days data
      day_picker.delegate = self
      day_picker.dataSource = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
   // Muscle group picker
   internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
      
   }
   
   internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      if (pickerView == picker) {
         return pickerData.count
      } else {
         return day_pickerData.count
      }
   }
   
   // Delegate
   
   internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      if (pickerView == picker) {
         return pickerData[row]
      } else {
         return day_pickerData[row]
      }
   }
   
   internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      if (pickerView == picker) {
         group = row
      } else {
         day = row
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
   @IBAction func add_event(_ sender: UIButton) {
      switch (group) {
      case 0 :
         muscle_group = "Chest"
      case 1 :
         muscle_group = "Arms"
      case 2 :
         muscle_group = "Shoulders"
      case 3 :
         muscle_group = "Back"
      case 4 :
         muscle_group = "Legs"
      case 5 :
         muscle_group = "Abs"
      case 6 :
         muscle_group = "Off Day"
      default :
         muscle_group = "Error"
      }
      switch (day) {
      case 0 :
         monday.set(muscle_group, forKey: "mon")
      case 1 :
         tuesday.set(muscle_group, forKey: "tues")
      case 2 :
         wednesday.set(muscle_group, forKey: "wed")
      case 3 :
         thursday.set(muscle_group, forKey: "thurs")
      case 4 :
         friday.set(muscle_group, forKey: "fri")
      case 5 :
         saturday.set(muscle_group, forKey: "sat")
      case 6 :
         sunday.set(muscle_group, forKey: "sun")
      default :
         sunday.set("HELP", forKey:"sun")
      }
   }

}
