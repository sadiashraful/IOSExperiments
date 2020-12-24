//
//  DetailCell.swift
//  TableViewCode3
//
//  Created by Mohammad Ashraful Islam Sadi on 1/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        // nothing to do here :)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
        self.imageView?.image = nil
    }
}
