//
//  SettingViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/9/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
   
   let american = ["Chili's", "Steak'n'Shake", "Domino's", "Freshii", "Stacked Pickle", "Spageddies", "308 on State", "Lotsa", "Triple XXX", "Dairy Queen", "Scotty's Brewhouse", "Buffalo Wild Wings", "Noodles and Company", "Red Seven"]
   let asian = ["Rice Cafe", "Peppercorns Kitchen", "Panda Express", "Ichiban", "Thai Essence"]
   let breakfast = ["Ihop", "Denny's", "Bob Evans", "Waffle House", "Einsteins Bagles", "Triple XXX", "Another Broken Egg", "Panera Bread", "Route 66 Diner"]
   let mexican = ["Moe's", "Qdoba", "Chipotle", "Fiesta", "La Hacienda", "Agave Azul", "La Salsa", "Mi Cabanita", "Lindo Mexico"]
   let indian = ["Khana Khazana", "Sharma's Kitchen"]
   let dessert = ["Red Mango", "Cold Stone", "Insomnia Cookies", "Dairy Queen", "Gigi's Cupcakes"]
   let mediterranean = ["Blue Nile", "Captain Gyro's", "Egyptian Cafe"]
   let fast = ["McDonalds", "Subway", "Potbelly", "Chick-fil-A", "Dairy Queen", "Wendy's"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   @IBAction func reset_days(_ sender: UIButton) {
      
      // create the alert
      let alert = UIAlertController(title: "Notice", message: "Are you sure you want to reset the number of days without a fight to 0?", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {action in
         days.set(0, forKey: "intKey")
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
      
      // show the alert
      self.present(alert, animated: true, completion: nil)
   }
   
   @IBAction func reset_all(_ sender: UIButton) {
      // create the alert
      let alert = UIAlertController(title: "Notice", message: "Are you sure you want to remove all data for plans, workouts, days without a fight, restaurants, and chores?", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
         
         //Reset number of days without a fight
         days.set(0, forKey: "intKey")
         
         // Reset all restaurants
         UserDefaults.standard.set(self.american, forKey: "american")
         UserDefaults.standard.set(self.asian, forKey: "asian")
         UserDefaults.standard.set(self.breakfast, forKey: "breakfast")
         UserDefaults.standard.set(self.mexican, forKey: "mexican")
         UserDefaults.standard.set(self.indian, forKey: "indian")
         UserDefaults.standard.set(self.dessert, forKey: "dessert")
         UserDefaults.standard.set(self.fast, forKey: "fast")
         UserDefaults.standard.set(self.mediterranean, forKey: "mediterranean")
         
         //Reset all Events
         UserDefaults.standard.set(nil, forKey: "nameKey")
         UserDefaults.standard.set(nil, forKey: "dateKey")
         
         //Reset all chores
         UserDefaults.standard.set(nil, forKey: "todo")
         
         //Reset all workouts
         monday.set(nil, forKey: "mon")
         tuesday.set(nil, forKey: "tues")
         wednesday.set(nil, forKey: "wed")
         thursday.set(nil, forKey: "thurs")
         friday.set(nil, forKey: "fri")
         saturday.set(nil, forKey: "sat")
         sunday.set(nil, forKey: "sun")
         
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
      
      // show the alert
      self.present(alert, animated: true, completion: nil)
   }
   

}
