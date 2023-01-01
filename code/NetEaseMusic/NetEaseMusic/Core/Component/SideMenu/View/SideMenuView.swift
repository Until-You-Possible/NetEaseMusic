//
//  SideMenuView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/30.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            HStack(alignment: .center) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("小南-Arthur")
                    Image(systemName: "chevron.right")
                }
                Spacer()
                Image(systemName: "qrcode.viewfinder")
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            
            ScrollView() {
                VStack(alignment: .leading) {
                    HStack {
                        Text("续费黑胶VIP")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Text("progress")
                        Text("V4")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("会员中心")
                            .foregroundColor(Color(hex: "#bbadaa"))
                            .font(.system(size: 10))
//                            .padding(8)
                            .overlay(Capsule().stroke(Color(hex: "#bbadaa"), lineWidth: 0.75))
                    }
                    HStack {
                        Text("限时福利 ｜ 免费VIP")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                    .padding(.bottom)
                    HStack {
                        Text("黑胶抵至0.24元/天，抽夸年好礼")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
                .padding()
                .background(Color(hex: "#574c4c"))
                .cornerRadius(20)
                
                //MARK: message central
                MessageCentralView()
                
                //MARK: music service
                MusicServiceView()
                
                //MARK: others
                OtherView()
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
        .background(Color(hex: "f3f3f3"))
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
