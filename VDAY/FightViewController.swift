//
//  FightViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

let days = UserDefaults.standard
let lastdate = UserDefaults.standard

class FightViewController: UIViewController {
   
   @IBOutlet weak var labelDay: UILabel!
   
   var day = 0
   var today = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelDay.text = String(days.integer(forKey: "intKey"))
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

   @IBAction func pbYes(_ sender: UIButton) {
      day = 0
      days.set(day, forKey: "intKey")
      labelDay.text = String(days.integer(forKey: "intKey"))
   }

   @IBAction func pbNo(_ sender: UIButton) {
      day = days.integer(forKey: "intKey") + 1
      days.set(day, forKey: "intKey")
      labelDay.text = String(days.integer(forKey: "intKey"))
   }
}
