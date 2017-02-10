//
//  AddPlanViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/9/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class AddPlanViewController: UIViewController  {
   

   @IBOutlet weak var name: UITextField!
   @IBOutlet weak var date: UIDatePicker!
   
   var dateData = [String]()
   var nameData = [String]()
   var currenttime : String!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
   
      
      if (UserDefaults.standard.array(forKey: "dateKey") == nil) {
         dateData = [String]()
      } else {
         dateData = UserDefaults.standard.array(forKey: "dateKey") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "nameKey") == nil) {
         nameData = [String]()
      } else {
         nameData = UserDefaults.standard.array(forKey: "nameKey") as! [String]
      }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
      // Dispose of any resources that can be recreated.
    }
   
   func datePickerChanged(sender: UIDatePicker) {
      

   }
   

    /*
    // MARK: - Navigatio

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   @IBAction func add_event(
      _ sender: UIButton) {
         let currentname = name.text!
         nameData.append(currentname)
         name.text = ""
      
      
         let dateFormatter = DateFormatter()
         dateFormatter.dateStyle = DateFormatter.Style.short
         dateFormatter.timeStyle = DateFormatter.Style.short
         currenttime = dateFormatter.string(from: date.date)
         dateData.append(currenttime)
      
         UserDefaults.standard.set(nameData, forKey: "nameKey")
         UserDefaults.standard.set(dateData, forKey: "dateKey")


   }
}
