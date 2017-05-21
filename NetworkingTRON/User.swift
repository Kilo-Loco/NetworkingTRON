//
//  User.swift
//  NetworkingTRON
//
//  Created by Kyle Lee on 5/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct User: JSONDecodable {
    
    let name: String
    let companyName: String
    
    init(json: JSON) {
        name = json["name"].stringValue
        companyName = json["company"]["name"].stringValue
        
    }
    
}
