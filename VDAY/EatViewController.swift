//
//  EatViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class EatViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {
   
   // Buttons, labels, and pick view from view controll
   @IBOutlet weak var food: UIPickerView!
   @IBOutlet weak var place: UILabel!
   @IBOutlet weak var eat: UILabel!
   @IBOutlet weak var getPlace: UIButton!
   @IBOutlet weak var removePlace: UIButton!

   
   var type = 0;
   //var select = 0;
   var randNum = 0;
   
   
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
   
   let foodData = ["American", "Asian", "Breakfast", "Mexican", "Indian", "Dessert", "Fast Food", "Mediterranean"]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        food.delegate = self
        food.dataSource = self
      
        removePlace.isHidden = true
        place.isHidden = true
      
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
      
      /*
       print(american)
       print(asian)
       print(breakfast)
       print(mexican)
       print(indian)
       print(dessert)
       print(fast)
       print(mediterranean)
       */
      
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

   @IBAction func gen_restaurant(_ sender: UIButton) {
      // Show label and remove button
      removePlace.isHidden = false
      place.isHidden = false
      
      // Generate a place to eat
      place.backgroundColor = eat.backgroundColor
      getPlace.setTitle("Get a different place?", for: UIControlState.normal )
      if (type == 0) {
         randNum = Int(arc4random_uniform(UInt32(american.count)))
         place.text = american[randNum]
      } else if (type == 1) {
         randNum = Int(arc4random_uniform(UInt32(asian.count)))
         place.text = asian[randNum]
      } else if (type == 2) {
         randNum = Int(arc4random_uniform(UInt32(breakfast.count)))
         place.text = breakfast[randNum]
      } else if (type == 3) {
         randNum = Int(arc4random_uniform(UInt32(mexican.count)))
         place.text = mexican[randNum]
      } else if (type == 4) {
         randNum = Int(arc4random_uniform(UInt32(indian.count)))
         place.text = indian[randNum]
      } else if (type == 5) {
         randNum = Int(arc4random_uniform(UInt32(dessert.count)))
         place.text = dessert[randNum]
      } else if ( type == 6) {
         randNum = Int(arc4random_uniform(UInt32(fast.count)))
         place.text = fast[randNum]
      } else {
         randNum = Int(arc4random_uniform(UInt32(mediterranean.count)))
         place.text = mediterranean[randNum]
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
      
   }
   
   @IBAction func delete_place(_ sender: UIButton) {
      let select = randNum
      
      // create the alert
      let alert = UIAlertController(title: "Notice", message: "Are you sure you want to remove this restaraunt?", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
         switch(self.type) {
         case 0: self.american.remove(at: select)
         case 1: self.asian.remove(at: select)
         case 2: self.breakfast.remove(at: select)
         case 3: self.mexican.remove(at: select)
         case 4: self.indian.remove(at: select)
         case 5: self.dessert.remove(at: select)
         case 6: self.fast.remove(at: select)
         case 7: self.mediterranean.remove(at: select)
         default: break
         }
         
         //Hide buttons again
         self.removePlace.isHidden = true
         self.place.isHidden = true
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
      
      // show the alert
      self.present(alert, animated: true, completion: nil)
      
      // Save data
      UserDefaults.standard.set(self.american, forKey: "american")
      UserDefaults.standard.set(self.asian, forKey: "asian")
      UserDefaults.standard.set(self.breakfast, forKey: "breakfast")
      UserDefaults.standard.set(self.mexican, forKey: "mexican")
      UserDefaults.standard.set(self.indian, forKey: "indian")
      UserDefaults.standard.set(self.dessert, forKey: "dessert")
      UserDefaults.standard.set(self.fast, forKey: "fast")
      UserDefaults.standard.set(self.mediterranean, forKey: "mediterranean")
   }
   
   
   
}
