//
//  DateViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/9/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class DateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   @IBOutlet weak var theme: UIPickerView!
   @IBOutlet weak var date: UILabel!
   @IBOutlet weak var banner: UILabel!
   @IBOutlet weak var genIdea: UIButton!
   
   var type = 0
   var randNum = 0
   
   let themeData = ["Cheap", "Stay at Home", "Outside", "Romantic", "Special Occasion", "Friday Night", "Summer", "Winter", "Double Date"]
   
   let cheapData = ["Roam around the mall", "Go bowling", "Watch a movie at home", "Make dinner together", "Plan a dream vacation", "Play board games", "Drive around"]
   let stayData = ["Movie at home", "Make dinner together", "Play strip poker", "Play cards", "Build a blanket fort"]
   let outData = ["Breakfast date", "Go for a walk", "Walk around the mall"]
   let romData = ["Spa night", "Movie at home", "Dinner at home", "Play strip poker", "Stare at the stars", "Write a song together", "Sit in front of the fireplace", "Drive around town"]
   let specData = ["Visit a city for the day", "Try a new restaurant"]
   let friData = ["Movies", "Go bowling"]
   let summerData = ["Go for a walk", "Get ice cream", "Go to a driving range", "Find a beach"]
   let winterData = ["Roller Skating", "Movies", "Go bowling"]
   let doubleData = ["Go bowling", "Invite friends over"]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
         theme.dataSource = self
         theme.delegate = self
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
   
   internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
      
   }
   internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return themeData.count
   }
   
   // Delegate
   
   internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return themeData[row]
   }
   internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      type = row
   }
   
   
   @IBAction func date_gen(_ sender: UIButton) {
      date.backgroundColor = banner.backgroundColor
      genIdea.setTitle("Get a different idea?", for: UIControlState.normal)
      switch (type) {
      case 0 :
         randNum = Int(arc4random_uniform(UInt32(cheapData.count)))
         date.text = cheapData[randNum]
      case 1 :
         randNum = Int(arc4random_uniform(UInt32(stayData.count)))
         date.text = stayData[randNum]
      case 2 :
         randNum = Int(arc4random_uniform(UInt32(outData.count)))
         date.text = outData[randNum]
      case 3 :
         randNum = Int(arc4random_uniform(UInt32(romData.count)))
         date.text = romData[randNum]
      case 4 :
         randNum = Int(arc4random_uniform(UInt32(specData.count)))
         date.text = specData[randNum]
      case 5 :
         randNum = Int(arc4random_uniform(UInt32(friData.count)))
         date.text = friData[randNum]
      case 6 :
         randNum = Int(arc4random_uniform(UInt32(summerData.count)))
         date.text = summerData[randNum]
      case 7 :
         randNum = Int(arc4random_uniform(UInt32(winterData.count)))
         date.text = winterData[randNum]
      case 8 :
         randNum = Int(arc4random_uniform(UInt32(doubleData.count)))
         date.text = doubleData[randNum]
      default :
         date.text = "Error Pick Again"
      }
   }

}
