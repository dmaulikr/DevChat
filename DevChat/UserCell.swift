//
//  UserCell.swift
//  DevChat
//
//  Created by Gary O Brien on 13/12/2016.
//  Copyright © 2016 Gary O Brien. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }

    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
