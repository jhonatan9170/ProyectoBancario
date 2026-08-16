//
//  ProcedureTableViewCell.swift
//  Dirigida-T2
//
//  Created by Jhonatan Chavez on 2/08/26.
//

import UIKit

class AccountsViewCell: UITableViewCell {
    
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var ammountNameLbl: UILabel!
    @IBOutlet weak var ammountLbl: UILabel!
    @IBOutlet weak var arrowIconImage: UIImageView!
    @IBOutlet weak var containerView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        arrowIconImage.image = UIImage(named: "rightArrowIcon")
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor(named: "shadowColor")?.withAlphaComponent(0.1).cgColor
        containerView.layer.shadowRadius = 6
        accountName.font = .boldSystemFont(ofSize: 16)
        ammountNameLbl.font = .systemFont(ofSize: 14)
        ammountNameLbl.numberOfLines = 0
        ammountNameLbl.text = "Saldo Total"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(product: ProductModel) {
        accountName.text = product.isActive ? product.name : "Abre tu " + product.name
        ammountNameLbl.isHidden = !product.isActive
        ammountLbl.isHidden = !product.isActive
        ammountLbl.text = "S/ " + (product.ammount?.description ?? "0.0")
    }
    
}
