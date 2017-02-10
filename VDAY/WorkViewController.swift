//
//  WorkViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

   let monday = UserDefaults.standard
   let tuesday = UserDefaults.standard
   let wednesday = UserDefaults.standard
   let thursday = UserDefaults.standard
   let friday = UserDefaults.standard
   let saturday = UserDefaults.standard
   let sunday = UserDefaults.standard

class WorkViewController: UIViewController {

   @IBOutlet weak var mon: UILabel!
   @IBOutlet weak var tues: UILabel!
   @IBOutlet weak var wed: UILabel!
   @IBOutlet weak var thurs: UILabel!
   @IBOutlet weak var fri: UILabel!
   @IBOutlet weak var sat: UILabel!
   @IBOutlet weak var sun: UILabel!
   
   var muscle_group = String()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

      // Do any additional setup after loading the view.
      mon.text = (monday.string(forKey: "mon"))
      tues.text = (tuesday.string(forKey: "tues"))
      wed.text = (wednesday.string(forKey: "wed"))
      thurs.text = (thursday.string(forKey: "thurs"))
      fri.text = (friday.string(forKey: "fri"))
      sat.text = (saturday.string(forKey: "sat"))
      sun.text = (sunday.string(forKey: "sun"))
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
   @IBAction func erase(_ sender: UIButton) {
      
      let alert = UIAlertController(title: "Notice", message: "Are you sure you want to clear all workouts?", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {action in
         self.mon.text = nil
         self.tues.text = nil
         self.wed.text = nil
         self.thurs.text = nil
         self.fri.text = nil
         self.sat.text = nil
         self.sun.text = nil
         monday.set(self.muscle_group, forKey: "mon")
         tuesday.set(self.muscle_group, forKey: "tues")
         wednesday.set(self.muscle_group, forKey: "wed")
         thursday.set(self.muscle_group, forKey: "thurs")
         friday.set(self.muscle_group, forKey: "fri")
         saturday.set(self.muscle_group, forKey: "sat")
         sunday.set(self.muscle_group, forKey: "sun")
         
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
      
      // show the alert
      self.present(alert, animated: true, completion: nil)
      
   }

}
