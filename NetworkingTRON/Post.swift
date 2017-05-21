//
//  Post.swift
//  NetworkingTRON
//
//  Created by Kyle Lee on 5/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Post: JSONDecodable {
    
    let username: String
    let message: String
    
    init(json: JSON) {
        print(json)
        username = json["username"].stringValue
        message = json["message"].stringValue
    }
}
