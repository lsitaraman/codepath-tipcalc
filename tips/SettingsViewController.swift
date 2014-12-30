//
//  SettingsViewController.swift
//  tips
//
//  Created by Sitaraman Lakshminarayanan on 12/28/14.
//  Copyright (c) 2014 codepathproject. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate,   UITableViewDataSource {
    
    @IBOutlet weak var tipPercentTableView: UITableView!
    @IBOutlet weak var defaultTipPercentText: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipPercentTableView.dataSource = self
        tipPercentTableView.delegate = self
        tipPercentTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
   
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTip")
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0,y:0,width:2000,height:50))
//        let label = UILabel(CGRect(x:0, y:0, width:200, height:50))
        //label.text = "0.25"
       
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTip")
        
        
        if intValue == indexPath.row {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        
        var defaultTipPercentages = [18, 20, 25]
        cell.textLabel?.text = "\(defaultTipPercentages[indexPath.row])%"

        //cell.addSubview(label)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(indexPath.row, forKey: "defaultTip")
       // defaults.setDouble(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
        
        tipPercentTableView.reloadData()
    }
    
    @IBAction func OnBackBtnDone(sender: AnyObject) {
        
           dismissViewControllerAnimated(true, completion: nil)
    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

