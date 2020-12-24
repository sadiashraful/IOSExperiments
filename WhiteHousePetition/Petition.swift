//
//  Petition.swift
//  WhiteHousePetition
//
//  Created by Mohammad Ashraful Islam Sadi on 6/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

