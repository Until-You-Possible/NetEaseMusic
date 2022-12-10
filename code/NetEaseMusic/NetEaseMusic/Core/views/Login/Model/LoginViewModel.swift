//
//  LoginViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    //let baseURL = "https://arthur-music-api.vercel.app"
    let loginPath = "https://arthur-music-api.vercel.app/user/binding?uid=3330160994"
    var userBindingData = [UserBindingItemType]()
    
    init() {
        self.getUserBindingInfo()
    }
    
    // 获取用户绑定信息
    func getUserBindingInfo() {
        AF.request(loginPath).response { response in
            if let error = response.error {
                print("DEBUG: got a error with:\(error.localizedDescription)")
            }
            let decoder = JSONDecoder()
            guard let res = response.data else { return }
            if let data = try? decoder.decode(UserBindindType.self, from: res) {
                dump(data)
            }
        }
    }
    
}
