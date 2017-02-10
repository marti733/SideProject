//
//  ChoreViewController.swift
//  VDAY
//
//  Created by Cheyenne Martinez on 2/9/17.
//  Copyright © 2017 Cheyenne Martinez. All rights reserved.
//

import UIKit

class ChoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   
   @IBOutlet weak var tableView: UITableView!

   
   var todo = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      if (UserDefaults.standard.array(forKey: "todo") == nil) {
         todo = [String]()
      } else {
         todo = UserDefaults.standard.array(forKey: "todo") as! [String]
      }
      
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   internal func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }

   internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return todo.count
   }
   
   internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      cell.textLabel?.text = todo[indexPath.row]
      return cell
   }
   
   internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         todo.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .fade)
         UserDefaults.standard.set(todo, forKey: "todo")
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


}
