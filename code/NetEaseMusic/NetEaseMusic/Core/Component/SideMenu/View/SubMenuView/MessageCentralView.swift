//
//  MessageCentralView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/1/1.
//

import SwiftUI
import SwiftUIFontIcon

struct MessageCentral: Identifiable {
    let id = UUID()
    var leadIcon: String
    var title: String
}

struct MessageCentralView: View {
    // data
   var messageCentralArray = [
        MessageCentral(leadIcon: "ellipsis.message", title: "消息中心"),
        MessageCentral(leadIcon: "camera.metering.center.weighted", title: "云贝中心"),
        MessageCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "创作者中心")
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

struct MessageCentralView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCentralView()
    }
}
