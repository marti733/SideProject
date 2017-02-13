//
//  NewEatViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/10/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class NewEatViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

   @IBOutlet weak var newRest: UITextField!
   @IBOutlet weak var category: UIPickerView!
   
   var type = 0
   
   let foodData = ["American", "Asian", "Breakfast", "Mexican", "Indian", "Dessert", "Fast Food", "Mediterranean"]
   
   // Default Restaurants
   let americand = ["Chili's", "Steak'n'Shake", "Domino's", "Freshii", "Stacked Pickle", "Spageddies", "308 on State", "Lotsa", "Triple XXX", "Dairy Queen", "Scotty's Brewhouse", "Buffalo Wild Wings", "Noodles and Company", "Red Seven"]
   let asiand = ["Rice Cafe", "Peppercorns Kitchen", "Panda Express", "Ichiban", "Thai Essence"]
   let breakfastd = ["Ihop", "Denny's", "Bob Evans", "Waffle House", "Einsteins Bagles", "Triple XXX", "Another Broken Egg", "Panera Bread", "Route 66 Diner"]
   let mexicand = ["Moe's", "Qdoba", "Chipotle", "Fiesta", "La Hacienda", "Agave Azul", "La Salsa", "Mi Cabanita", "Lindo Mexico"]
   let indiand = ["Khana Khazana", "Sharma's Kitchen"]
   let dessertd = ["Red Mango", "Cold Stone", "Insomnia Cookies", "Dairy Queen", "Gigi's Cupcakes"]
   let mediterraneand = ["Blue Nile", "Captain Gyro's", "Egyptian Cafe"]
   let fastd = ["McDonalds", "Subway", "Potbelly", "Chick-fil-A", "Dairy Queen", "Wendy's"]
   
   // User preferences
   var american = [String]()
   var asian = [String]()
   var breakfast = [String]()
   var mexican = [String]()
   var indian = [String]()
   var dessert = [String]()
   var fast = [String]()
   var mediterranean = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      //
      category.delegate = self
      category.dataSource = self
      
      newRest.text = ""
      
      
      // Choose which string to load
      if (UserDefaults.standard.array(forKey: "american") == nil) {
         american = americand
      } else {
         american = UserDefaults.standard.array(forKey: "american") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "asian") == nil) {
         asian = asiand
      } else {
         asian = UserDefaults.standard.array(forKey: "asian") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "breakfast") == nil) {
         breakfast = breakfastd
      } else {
         breakfast = UserDefaults.standard.array(forKey: "breakfast") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "mexican") == nil) {
         mexican = mexicand
      } else {
         mexican = UserDefaults.standard.array(forKey: "mexican") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "indian") == nil) {
         indian = indiand
      } else {
         indian = UserDefaults.standard.array(forKey: "indian") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "dessert") == nil) {
         dessert = dessertd
      } else {
         dessert = UserDefaults.standard.array(forKey: "dessert") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "fast") == nil) {
         fast = fastd
      } else {
         fast = UserDefaults.standard.array(forKey: "fast") as! [String]
      }
      
      if (UserDefaults.standard.array(forKey: "mediterranean") == nil) {
         mediterranean = mediterraneand
      } else {
         mediterranean = UserDefaults.standard.array(forKey: "mediterranean") as! [String]
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
      
   }
   internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return foodData.count
   }
   
   // Delegate
   
   internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return foodData[row]
   }
   internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      type = row
   }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   @IBAction func saveRest(_ sender: UIButton) {
      let new = newRest.text!
      
      switch(type) {
      case 0:
         american.append(new)
      case 1:
         asian.append(new)
      case 2:
         breakfast.append(new)
      case 3:
         mexican.append(new)
      case 4:
         indian.append(new)
      case 5:
         dessert.append(new)
      case 6:
         fast.append(new)
      case 7:
         mediterranean.append(new)
      default : break
      }
      
      // Save data
      UserDefaults.standard.set(self.american, forKey: "american")
      UserDefaults.standard.set(self.asian, forKey: "asian")
      UserDefaults.standard.set(self.breakfast, forKey: "breakfast")
      UserDefaults.standard.set(self.mexican, forKey: "mexican")
      UserDefaults.standard.set(self.indian, forKey: "indian")
      UserDefaults.standard.set(self.dessert, forKey: "dessert")
      UserDefaults.standard.set(self.fast, forKey: "fast")
      UserDefaults.standard.set(self.mediterranean, forKey: "mediterranean")
      
      // create the alert
      let alert = UIAlertController(title: "Notice", message: "Restaurant Saved", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { action in
         
      }))

      // show the alert
      self.present(alert, animated: true, completion: nil)

      
   }

}
