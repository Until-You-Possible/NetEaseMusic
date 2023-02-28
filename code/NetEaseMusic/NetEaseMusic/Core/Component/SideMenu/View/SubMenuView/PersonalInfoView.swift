//
//  PersonalInfoView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/2/28.
//

import SwiftUI
import SwiftUIFontIcon


struct PersonalInfoCentral: Identifiable {
    let id = UUID()
    var leadIcon: String
    var title: String
}


struct PersonalInfoView: View {
    
    // data
   var messageCentralArray = [
        PersonalInfoCentral(leadIcon: "ellipsis.message", title: "我的客服"),
        PersonalInfoCentral(leadIcon: "camera.metering.center.weighted", title: "我的订单"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "优惠券"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "分享网易云音乐"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "个人信息收集与清单"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "个人信息与第三方共享清单"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "个人信息与隐私保护"),
        PersonalInfoCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "关于")
   ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(messageCentralArray) { item in
                HStack {
                    Image(systemName: item.leadIcon)
                    Text(item.title)
                    Spacer()
                    FontIcon.text(.materialIcon(code: .chevron_right))
                }
                .frame(height: 40)
                .padding([.leading, .trailing], 12)
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding([.top, .bottom], 10)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
