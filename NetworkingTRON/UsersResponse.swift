//
//  UsersResponse.swift
//  NetworkingTRON
//
//  Created by Kyle Lee on 5/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct UsersResponse: JSONDecodable {
    
    let users: [User]
    
    init(json: JSON) throws {
        print("JSON from UsersResponse: \(json)")
        let usersArray = json.arrayValue
        users = usersArray.map({ User(json: $0) })
    }
}
