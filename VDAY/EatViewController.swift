//
//  EatViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class EatViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {

   @IBOutlet weak var food: UIPickerView!
   @IBOutlet weak var place: UILabel!
   @IBOutlet weak var eat: UILabel!
   @IBOutlet weak var getPlace: UIButton!

   
   var type = 0;
   var randNum = 0;
   
   let american = ["Chili's", "Steak'n'Shake", "Domino's", "Freshii", "Stacked Pickle", "Spageddies", "308 on State", "Lotsa", "Triple XXX", "Dairy Queen", "Scotty's Brewhouse", "Buffalo Wild Wings", "Noodles and Company", "Red Seven"]
   let asian = ["Rice Cafe", "Peppercorns Kitchen", "Panda Express", "Ichiban", "Thai Essence"]
   let breakfast = ["Ihop", "Denny's", "Bob Evans", "Waffle House", "Einsteins Bagles", "Triple XXX", "Another Broken Egg", "Panera Bread", "Route 66 Diner"]
   let mexican = ["Moe's", "Qdoba", "Chipotle", "Fiesta", "La Hacienda", "Agave Azul", "La Salsa", "Mi Cabanita", "Lindo Mexico"]
   let indian = ["Khana Khazana", "Sharma's Kitchen"]
   let dessert = ["Red Mango", "Cold Stone", "Insomnia Cookies", "Dairy Queen", "Gigi's Cupcakes"]
   let mediterranean = ["Blue Nile", "Captain Gyro's", "Egyptian Cafe"]
   let fast = ["McDonalds", "Subway", "Potbelly", "Chick-fil-A", "Dairy Queen", "Wendy's"]
   
   let foodData = ["American", "Asian", "Breakfast", "Mexican", "Indian", "Dessert", "Fast Food", "Mediterranean"]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        food.delegate = self
        food.dataSource = self
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
   }
}
