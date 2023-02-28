//
//  OtherView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/1/1.
//

import SwiftUI
import SwiftUIFontIcon


struct OtherCentral: Identifiable {
    let id = UUID()
    var leadIcon: String
    var title: String
}


struct OtherView: View {
    
    var messageCentralArray = [
        OtherCentral(leadIcon: "ellipsis.message", title: "设置"),
        OtherCentral(leadIcon: "camera.metering.center.weighted", title: "深色模式"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "定时关闭"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "个性装扮"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "边听边存"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "在线听歌免流量"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "添加Siri捷径"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "音乐黑名单"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "青少年模式"),
        OtherCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "音乐模式")
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

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
