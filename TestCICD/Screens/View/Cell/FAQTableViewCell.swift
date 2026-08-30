//
//  FAQTableViewCell.swift
//  CoupleTherapy
//
//  Created by Vivek_Ios on 25/03/26.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var lbl_Desc: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var boderView: UIView!
    
    
    var arrowButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.boderView.layer.cornerRadius = 13.0
        self.boderView.clipsToBounds = true
        
        self.boderView.layer.borderColor = UIColor.gray.cgColor
        self.boderView.layer.borderWidth = 2.0
    }
    
    func configure(with item: FAQItem) {
        lbl_Title.text = item.question
        lbl_Desc.text = item.isExpanded ? item.answer : ""
        
        // Change image depending on expanded state
        let arrowImage = item.isExpanded ? UIImage(named: "bootomSelect") : UIImage(named: "topSelect")
        btnArrow.setImage(arrowImage, for: .normal)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func actionselect(_ sender: UIButton) {
        arrowButtonAction?()
        
    }
    
}
