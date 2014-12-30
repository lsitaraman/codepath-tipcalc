//
//  ViewController.swift
//  tips
//
//  Created by Sitaraman Lakshminarayanan on 12/28/14.
//  Copyright (c) 2014 codepathproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalamountLabel: UILabel!
    @IBOutlet weak var billamountField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
              tipLabel.text="$0.0"
        totalamountLabel.text="$0.0"
        var defaults = NSUserDefaults.standardUserDefaults()
        var defTip = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = defTip
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defTip = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = defTip
        self.OnEditingChanged(animated)
        //var intValue = defaults.integerForKey("another_key_that_you_choose")
        print (defTip)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billamount = (billamountField.text as NSString).doubleValue
        var tip = billamount  * tipPercentage
        var total = billamount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalamountLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func OnTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    
}

