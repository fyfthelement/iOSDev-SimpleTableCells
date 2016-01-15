//
//  ViewController.swift
//  Table Cells
//
//  Created by Fenel Aldajuste on 1/15/16.
//  Copyright © 2016 FyfthElement Innovation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    @IBOutlet var tableView:UITableView!
    
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"],
        ["Name" : "Mac Mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(NameAndColorCell.self,
            forCellReuseIdentifier: cellTableIdentifier)
        
        let nib = UINib(nibName: "NameAndColorCell", bundle: nil)
        
        tableView.registerNib(nib,
            forCellReuseIdentifier: cellTableIdentifier)
        
        tableView.rowHeight = 65
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
            return computers.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
                -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(
                cellTableIdentifier, forIndexPath: indexPath) as! NameAndColorCell
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
            
        return cell
    }
}

