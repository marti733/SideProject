//
//  AddChoreViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/9/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

//Calls this function when the tap is recognized.
extension UIViewController {
   func hideKeyboardWhenTappedAround() {
      let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
   }
   
   func dismissKeyboard() {
      view.endEditing(true)
   }
}

class AddChoreViewController: UIViewController {

   @IBOutlet weak var name: UITextField!
   
   var todo = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      if (UserDefaults.standard.array(forKey: "todo") == nil) {
         todo = [String]()
      } else {
         todo = UserDefaults.standard.array(forKey: "todo") as! [String]
      }
      
       self.hideKeyboardWhenTappedAround()
      
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
   @IBAction func add_event(_ sender: UIButton) {
      let statictodo = name.text!
      todo.append(statictodo)
      name.text = ""
      UserDefaults.standard.set(todo, forKey: "todo")
      
   }

}
