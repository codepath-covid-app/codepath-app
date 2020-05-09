//
//  CategoryViewController.swift
//  DeliverIt
//
//  Created by Lovpreet Hansra on 4/23/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var collectionView: UICollectionView!
    var businesses = [PFObject]()
    var categories = [String] ()
    
    var estimateWidth = 150.0
    var cellMarginSize = 16.0
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            
            let query = PFQuery(className:"Businesses")
            query.findObjectsInBackground { (data, error) in
                if data != nil {
                    for d in data! {
                        if !self.categories.contains(d["Category"] as! String)  {
                            self.businesses.append(d)
                            self.categories.append(d["Category"] as! String)
                            self.collectionView.reloadData()
                        
                        }
                    }
                }
            }
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.dataSource = self
            collectionView.delegate = self
            //Register cells
            self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
            //Setup grid view
            self.setUpGridView()

            // Do any additional setup after loading the view.
        }
        
        func setUpGridView() {
            let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
            flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath)
            self.performSegue(withIdentifier: "categorySegue", sender: cell as! UICollectionViewCell)
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count;
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let businesses = self.categories[indexPath.row]
            cell.setText(text: businesses)
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = self.calculateWidth()
            return CGSize(width: width, height: width)
        }
        
        func calculateWidth() -> CGFloat {
            let estimatedWidth = CGFloat(estimateWidth)
            let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
            
            let margin = CGFloat(cellMarginSize * 2)
            let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
            return width
        }

        // MARK: - Navigation
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            let businessView = segue.destination as! BusinessViewController
            businessView.category = categories[indexPath!.row]
            collectionView.deselectItem(at: indexPath!, animated: true)
        }

    }
