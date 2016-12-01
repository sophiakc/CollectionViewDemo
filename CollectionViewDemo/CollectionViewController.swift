//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Sophia KC on 30/11/2016.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let totalColors: Int = 100
    
    func colorForIndexPath(indexPath: NSIndexPath) -> UIColor {
        if indexPath.row >= totalColors {
            return UIColor.black	// return black if we get an unexpected row index
        }
        
        var hueValue: CGFloat = CGFloat(indexPath.row) / CGFloat(totalColors)
        return UIColor(hue: hueValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self

        
    }
    
    
    // UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalColors
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "com.codepath.ColorCell", for: indexPath) as! ColorCell

//        let cellColor = colorForIndexPath(indexPath)
        let cellColor = colorForIndexPath(indexPath: indexPath -> UIColor)
//        let cellColor = colorForIndexPath(indexPath: [NSIndexPath] -> UIColor)
//        let cellColor = colorForIndexPath(indexPath: NSIndexPath) as! UIColor
//        let cellColor = colorForIndexPath(indexPath: indexPath)
//         let cellColor = colorForIndexPath(indexPath: [indexPath])
        
        

        
        cell.backgroundColor = cellColor
        
        if CGColorGetNumberOfComponents(cellColor.CGColor) == 4 {
            let redComponent = CGColorGetComponents(cellColor.CGColor)[0] * 255
            let greenComponent = CGColorGetComponents(cellColor.CGColor)[1] * 255
            let blueComponent = CGColorGetComponents(cellColor.CGColor)[2] * 255
            cell.colorLabel.text = String(format: "%.0f, %.0f, %.0f", redComponent, greenComponent, blueComponent)
        }
        
        return cell
    }
    
}
