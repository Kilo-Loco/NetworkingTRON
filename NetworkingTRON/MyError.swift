//
//  MyError.swift
//  NetworkingTRON
//
//  Created by Kyle Lee on 5/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct MyError: JSONDecodable {
    
    let isEmpty: Bool
    
    init(json: JSON) throws {
        print("JSON: \(json)")
        print("JSON parsing error")
        isEmpty = json.isEmpty
    }
    
}
