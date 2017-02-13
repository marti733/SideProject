//
//  PlanViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/8/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


   @IBOutlet weak var tableView: UITableView!
   
   var dateData = [String]()
   var nameData = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
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
      
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cells")
      
      tableView.reloadSectionIndexTitles()
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   internal func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return nameData.count
   }
   
   internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cells = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
      
      cells.textLabel?.text = nameData[indexPath.row]
      cells.detailTextLabel?.text = dateData[indexPath.row]
      return cells
   }
   
   internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
   }
   
   internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         nameData.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .fade)
         UserDefaults.standard.set(nameData, forKey: "nameKey")
         UserDefaults.standard.set(dateData, forKey: "dateKey")
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

   @IBAction func delete_plan(_ sender: UIButton) {
      // Show the alert
      let alert = UIAlertController(title: "Notice", message: "Are you sure you want to remove all listed chores?", preferredStyle: UIAlertControllerStyle.alert)
      
      // add the actions (buttons)
      alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
         self.nameData = [String]()
         self.dateData = [String]()
         UserDefaults.standard.set(nil, forKey: "nameKey")
         UserDefaults.standard.set(nil, forKey: "dateKey")
         self.tableView.reloadData()
         
      }))
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
      
      // show the alert
      self.present(alert, animated: true, completion: nil)
   }


}
