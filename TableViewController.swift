//
//  TableViewController.swift
//  Exchange
//
//  Created by Valentin Sporin on 21.11.16.
//  Copyright © 2016 mors team. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    var rate_name_list: [String] = []
    var rate_value_list: [String] = []
    var rate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = rate
        let url = "https://api.fixer.io/latest?base=\(rate)"
        
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                for (value, key) in json["rates"] {
                    self.rate_name_list.append(value)
                    self.rate_value_list.append(String(describing: key))
                    
                    
                    
                    
                    
                    
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rate_value_list.count
    }
    

    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier2", for: indexPath)
            cell.textLabel?.text = rate_name_list[indexPath.row]
            cell.detailTextLabel?.text = rate_value_list[indexPath.row]
            
        
        return cell
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
