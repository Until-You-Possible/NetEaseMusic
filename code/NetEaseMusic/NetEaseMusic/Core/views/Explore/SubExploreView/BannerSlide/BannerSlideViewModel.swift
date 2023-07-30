//
//  BannerSlideViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/7/30.
//

import Foundation
import SwiftUI

struct bannerItem: Decodable {
    let pic: String
    let targetId: Int?
    let adid: String?
    let targetType: Int
    let titleColor: String
    let typeTitle: String
    let url: String?
    let adurlV2: String?
    let exclusive: Bool
    let monitorImpress: String?
    let monitorClick: String?
    let monitorType: String?
    let monitorImpressList: [String]
    let monitorClickList: [String]
    let monitorBlackList: String?
    let extMonitor: String?
    let extMonitorInfo: String?
    let adSource: String?
    let adLocation: String?
    let encodeId: String?
    let program: String?
    let event: String?
    let video: String?
    let dynamicVideoData: String?
    let song: String?
    let bannerId: String?
    let alg: String?
    let scm: String?
    let requestId: String?
    let showAdTag: Bool
    let pid: String?
    let showContext: String?
    let adDispatchJson: String?
    let s_ctrp: String?
    let logContext: String?
    let bannerBizType: String?
}

struct BannerResponseType<T: Decodable>: Decodable {
    let banners: [T]
    let code: Int
}




class BannerSlideViewModle: ObservableObject {
    
    var dataRequestModel = DataRequestViewModel<BannerResponseType<bannerItem>>()
    @Published var isLoading      : Bool = true
    @Published var error          : Error?
    @Published var bannerAllData  : BannerResponseType<[bannerItem]>?
    
    init() {
        self.getBannerData()
    }
    
    func getBannerData() {
        let url = "https://arthur-music-api.vercel.app/banner?type=2"
        dataRequestModel.fetchData(url: url) { ( data, error, isLoading) in
            print("Error:\(String(describing: error?.localizedDescription))")
            self.isLoading = isLoading 
//            self.error = error
//            print(type(of: data))
//            self.bannerAllData = data
        }
    }
}
