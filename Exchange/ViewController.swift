//
//  ViewController.swift
//  Exchange
//
//  Created by Valentin Sporin on 21.11.16.
//  Copyright © 2016 mors team. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var rate_list: [String] = ["RUB", "USD", "GBP", "EUR"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rate_list.count
    }
    
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier1", for: indexPath)
            
            
            cell.textLabel?.text = rate_list[indexPath.row]
            
            return cell
            
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                var destVC: TableViewController = segue.destination as! TableViewController
                destVC.rate = rate_list[indexPath.row]
            }
        }
        
        
    }
    

    
    
    
    
}
