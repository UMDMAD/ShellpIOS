//
//  BusesViewController.swift
//  Shellp
//
//  Created by Kieran Raftery on 5/28/15.
//  Copyright (c) 2015 Kieran Raftery. All rights reserved.
//

import UIKit

class BusesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let drawerButton = UIBarButtonItem(title: "Drawer", style: UIBarButtonItemStyle.Plain, target: self, action: "drawerButtonTapped")
        self.navigationItem.leftBarButtonItem = drawerButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawerButtonTapped() {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
}
