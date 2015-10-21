//
//  PublishersCVC.swift
//  DTCVNews
//
//  Created by Langley, Dwayne on 10/20/15.
//  Copyright © 2015 Langley, Dwayne. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SMPListCVC: UICollectionViewController {
    
    let sidePaddings : CGFloat = 1.0
    let itemsPerRow : CGFloat = 1.0
    let heightAdjustment : CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (CGRectGetWidth(collectionView!.frame) - (sidePaddings * (itemsPerRow + 1))) / itemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSizeMake(width, 44)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Puzzle.list.all.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SMPCell
    
        // Configure the cell
        cell.text = Puzzle.list.all[indexPath.item].desc
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        puzzle.current = Puzzle.list(rawValue: indexPath.row)
        performSegueWithIdentifier("pSegue", sender: self)
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

class SMPCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    
    var text : String = "WORD!!!" {
        willSet {
            label.text = newValue
        }
        didSet {
            setNeedsDisplay()
        }
    }
    
    var subtext : String = "WORD!!!" {
        willSet {
            label.text = newValue
        }
        didSet {
            setNeedsDisplay()
        }
    }
    
}