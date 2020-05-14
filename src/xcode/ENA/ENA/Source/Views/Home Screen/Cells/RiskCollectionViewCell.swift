//
//  RiskCollectionViewCell.swift
//  ENA
//
//  Created by Tikhonov, Aleksandr on 03.05.20.
//  Copyright © 2020 SAP SE. All rights reserved.
//

import UIKit

protocol RiskCollectionViewCellDelegate: AnyObject {
    func contactButtonTapped(cell: RiskCollectionViewCell)
}

/// A cell that visualizes the current risk and allows the user to calculate he/his current risk.
final class RiskCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    weak var delegate: RiskCollectionViewCellDelegate?

    // MARK: Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var chevronImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var contactButton: UIButton!
    @IBOutlet var viewContainer: UIView!
    
    // MARK: Nib Loading
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
    // MARK: Actions
    @IBAction func contactButtonTapped(_ sender: UIButton) {
        delegate?.contactButtonTapped(cell: self)
    }
    
    // MARK: Configuring the UI
    func configure(with propertyHolder: HomeRiskCellPropertyHolder, delegate: RiskCollectionViewCellDelegate) {
        self.delegate = delegate
        
        titleLabel.text = propertyHolder.title
        titleLabel.textColor = propertyHolder.titleColor
        // bodyLabel.text = propertyHolder.body
        // dateLabel.text = propertyHolder.date
        // dateLabel.isHidden = propertyHolder.date == nil
        viewContainer.backgroundColor = propertyHolder.color
        chevronImageView.tintColor = propertyHolder.chevronTintColor
        chevronImageView.image = propertyHolder.chevronImage
        // iconImageView.image = propertyHolder.iconImage
        contactButton.setTitle(AppStrings.Home.riskCardButton, for: .normal)
    }
}
