//
//  ViewController.swift
//  HorizontalScrollingFilter
//
//  Created by Feng Chang on 3/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var horizontalFiltersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let items = self.items()
        let collectionContainerView = HorizontalScrollingFilterView.instanceFromNib()
        collectionContainerView.frame = horizontalFiltersView.bounds
        collectionContainerView.initView(items: items)
        horizontalFiltersView.addSubview(collectionContainerView)
    }
    
    func items() -> [HorizontalScrollingFilterItem] {
        var items = [HorizontalScrollingFilterItem]()
        let one = HorizontalScrollingFilterItem(title: "Sun")
        let two = HorizontalScrollingFilterItem(title: "A")
        let three = HorizontalScrollingFilterItem(title: "Dinosaur")
        let four = HorizontalScrollingFilterItem(title: "Hellow world!")
        let five = HorizontalScrollingFilterItem(title: "all right, all right, all right")
        let six = HorizontalScrollingFilterItem(title: "Bushel")
        items.append(one)
        items.append(two)
        items.append(three)
        items.append(four)
        items.append(five)
        items.append(six)
        
        return items
    }
}

