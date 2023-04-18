//
//  FoodItemTableViewCell.swift
//  TableViewcontroller
//
//  Created by undhad kaushik on 06/01/23.
//



import UIKit

class FoodItemTableViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        minusButton.layer.masksToBounds = true
        plusButton.layer.masksToBounds = true
       // selectionStyle = .none
        
    }
    
}
