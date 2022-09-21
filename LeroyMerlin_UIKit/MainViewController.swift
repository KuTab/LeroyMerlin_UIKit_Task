//
//  MainViewController.swift
//  LeroyMerlin_UIKit
//
//  Created by Egor Dadugin on 20.09.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var topView: UIView!
    var topLabel: UILabel!
    var searchBar: UITextView!
    var searchIcon: UIImageView!
    var horizontalCollectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 200))
        topView.backgroundColor = UIColor(red: 82, green: 195, blue: 65)
        view.addSubview(topView)
        
        topLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 100, height: 100))
        topLabel.text = "Поиск товаров"
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.boldSystemFont(ofSize: 30)
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        
        searchBar = UITextView(frame: CGRect(x: 20, y: 130, width: 300, height: 50))
        searchBar.backgroundColor = UIColor.white
        searchBar.layer.cornerRadius = 5
        searchBar.textContainer.maximumNumberOfLines = 0
        searchBar.attributedText = NSAttributedString(string: "Поиск")
        view.addSubview(searchBar)
        
        searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.frame = CGRect(x: 265, y: 135, width: 50, height: 40)
        searchIcon.backgroundColor = UIColor(red: 82, green: 195, blue: 65)
        searchIcon.layer.cornerRadius = 5
        searchIcon.tintColor = UIColor.white
        searchIcon.contentMode = .center
        view.addSubview(searchIcon)
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        horizontalCollectionView = UICollectionView(frame: CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 110), collectionViewLayout: layout)
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        self.horizontalCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        view.addSubview(horizontalCollectionView)
        
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = horizontalCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath)
        cell.backgroundColor = UIColor(red: 82, green: 195, blue: 65)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        let indexOfMajorCell = self.indexOfMajorCell()
        print(indexOfMajorCell)
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        print(indexPath)
        layout.collectionView!.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    public func indexOfMajorCell() -> Int {
        let itemWidth = layout.itemSize.width
        let proportionalOffset = layout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min(10 - 1, index)) //datasource.count
        return safeIndex
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
