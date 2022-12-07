//
//  UserBinding.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/6.
//

import Foundation


//struct UserBindindType: Decodable {
//    let code: String
//    let bindings: Array<Any>
//}

struct UserBindindType: Decodable {
    let code: Int
    var bindings: [UserBindingItemType]?
}


struct UserBindingItemType: Decodable {
    let userId: Int
    let url: String
    let expired: Bool
    let bindingTime: Int
    let refreshTime: Int
    let tokenJsonStr: String
    let expiresIn: Int
    let id: Int
    let type: Int
}
