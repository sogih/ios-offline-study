//
//  User.swift
//  Restful
//
//  Created by sogih on 17/07/2019.
//  Copyright © 2019 sogih. All rights reserved.
//

import Foundation

struct User: Codable {
    let body: String?
    let id: Int?
    let title: String?
    let userId: Int?
}

//struct User {
//    let id: Int?
//    let name: String?
//    let username: String?
//    let email: String?
//    let address: Address?
//    let phone: String?
//    let website: String?
//    let company: Company?
//}
//
//                struct Address {
//                    let street: String?
//                    let suite: String?
//                    let city: String?
//                    let zipcode: String?
//                    let geo: Geo?
//                }
//
//                                struct Geo {
//                                    let lat: String?
//                                    let lng: String?
//                                }
//
//                struct Company {
//                    let name: String?
//                    let catchPhrase: String?
//                    let bs: String?
//                }
