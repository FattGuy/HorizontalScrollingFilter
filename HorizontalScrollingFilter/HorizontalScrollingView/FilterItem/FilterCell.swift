//
//  FilterCell.swift
//  HorizontalScrollingFilter
//
//  Created by Feng Chang on 3/7/21.
//

import UIKit

class FilterCell: UICollectionViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(title: String, selected: Bool) {
        self.titleLabel.text = title
        self.containerView.backgroundColor = selected ? .red : .white
        self.containerView.layer.cornerRadius = 25
        self.containerView.backgroundColor = .darkGray
    }
}
