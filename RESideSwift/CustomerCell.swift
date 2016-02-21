//
//  CustomerCell.swift
//  demo_ccp05
//
//  Created by FaiFai on 2/17/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit

class CustomerCell: UITableViewCell {
    

    @IBOutlet weak var Pname: UILabel!
    @IBOutlet weak var Plevel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
