//
//  User.swift
//  DevChat
//
//  Created by Gary O Brien on 13/12/2016.
//  Copyright © 2016 Gary O Brien. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String!
    private var _uid: String!
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
}
