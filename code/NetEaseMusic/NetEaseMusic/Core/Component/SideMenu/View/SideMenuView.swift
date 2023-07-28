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
                    HStack(alignment: .center) {
                        Text("续费黑胶VIP")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        ProgressView("", value: 50, total: 100)
                            .frame(width: 50)
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
                
                Button {
                    // 登陆和退出按钮
                    print("退出登陆")
                } label: {
                    Text("退出登陆")
                        .foregroundColor(Color.red)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(5)

            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
        .background(Color(hex: "f3f3f3"))
    }
}


struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
