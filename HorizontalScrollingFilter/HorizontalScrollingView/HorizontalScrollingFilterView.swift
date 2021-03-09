//
//  HorizontalScrollingFilterView.swift
//  HorizontalScrollingFilter
//
//  Created by Feng Chang on 3/7/21.
//

import UIKit

struct HorizontalScrollingFilterItem {
    var title: String
}

class HorizontalScrollingFilterView: UIView {

    @IBOutlet var collectionView: UICollectionView!
    
    private var collectionItems: [HorizontalScrollingFilterItem]?
    private let nibName = "FilterCell"
    private let identifier = "FilterCell"
    
    class func instanceFromNib() -> HorizontalScrollingFilterView {
        return UINib(nibName: "HorizontalScrollingFilterView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HorizontalScrollingFilterView
    }
    
    func initView(items: [HorizontalScrollingFilterItem]) {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: identifier)
        self.collectionItems = items

    }
}

extension HorizontalScrollingFilterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FilterCell
        let item = self.collectionItems?[indexPath.row]
        cell.updateUI(title: item?.title ?? "", selected: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO:
    }
    
    func itemSize(_ index: Int) -> CGSize {
        let font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        let fontAtt = [NSAttributedString.Key.font: font]
        let text = self.collectionItems?[index].title ?? ""
        let size = (text as NSString).size(withAttributes: fontAtt)
        let width = size.width
        
        return CGSize(width: width + 40, height: 50)
    }
}
