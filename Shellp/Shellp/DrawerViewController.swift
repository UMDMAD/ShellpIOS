//
//  DrawerViewController.swift
//  Shellp
//
//  Created by Kieran Raftery on 5/27/15.
//  Copyright (c) 2015 Kieran Raftery. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var pages: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        pages = ["Schedule", "Buses", "Navigation"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        if(indexPath.row == 0) {
            
            let scheduleViewController = ScheduleViewController(nibName: "ScheduleViewController", bundle: nil)
            let scheduleNavController = UINavigationController(rootViewController: scheduleViewController)
            
            appDelegate.centerContainer!.centerViewController = scheduleNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        }
        else if(indexPath.row == 1) {
            
            let busesViewController = BusesViewController(nibName: "BusesViewController", bundle: nil)
            let busesNavController = UINavigationController(rootViewController: busesViewController)
            
            appDelegate.centerContainer!.centerViewController = busesNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        }
        else if(indexPath.row == 2) {
            
            let navigationViewController = NavigationViewController(nibName: "NavigationViewController", bundle: nil)
            let navigationNavController = UINavigationController(rootViewController: navigationViewController)
            
            appDelegate.centerContainer!.centerViewController = navigationNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.pages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.pages.count;
    }
    

}
