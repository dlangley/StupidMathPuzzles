//
//  PuzzleList.swift
//  StupidMathPuzzles
//
//  Created by Langley, Dwayne on 9/2/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

class PuzzleListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
    
    // MARK: - TVC Delegates
    
    // Cells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Puzzle.list.all.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pCell") as UITableViewCell!
        cell.textLabel!.text = Puzzle.list.all[indexPath.row].desc
        
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Puzzle.sharedInstance.current = Puzzle.list(rawValue: indexPath.row)
        performSegueWithIdentifier("pSegue", sender: self)
        
    }
    // Headers
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(section)"
//    }
}

