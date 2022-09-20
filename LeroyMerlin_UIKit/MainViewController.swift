//
//  MainViewController.swift
//  LeroyMerlin_UIKit
//
//  Created by Egor Dadugin on 20.09.2022.
//

import UIKit

class MainViewController: UIViewController {

    var topView: UIView!
    var topLabel: UILabel!
    var searchBar: UITextView!
    var searchIcon: UIImageView!
    
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
        view.addSubview(searchBar)
        
        searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.frame = CGRect(x: 260, y: 135, width: 50, height: 40)
        searchIcon.backgroundColor = UIColor(red: 82, green: 195, blue: 65)
        searchIcon.layer.cornerRadius = 5
        searchIcon.tintColor = UIColor.white
        searchIcon.contentMode = .center
        view.addSubview(searchIcon)

        // Do any additional setup after loading the view.
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
