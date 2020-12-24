//
//  MyCell.swift
//  TableViewCode3
//
//  Created by Mohammad Ashraful Islam Sadi on 1/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            self.initialize()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            self.initialize()
        }
        
        func initialize() {

        }
    
        override func prepareForReuse() {
            super.prepareForReuse()
            
        }
}



