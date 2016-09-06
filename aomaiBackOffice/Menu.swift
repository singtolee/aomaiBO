//
//  Menu.swift
//  aomaiBackOffice
//
//  Created by li qiang on 8/6/2559 BE.
//  Copyright © 2559 aomai. All rights reserved.
//

import UIKit
import SnapKit

class Menu: UITableViewController {
    let cellID = "cellID"
    let allFunctions = ["Add office Building", "Add Product"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFunctions.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        let cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
        cell.textLabel?.text = allFunctions[indexPath.row]
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = BackOffice()
        let nav = UINavigationController(rootViewController: vc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
}
