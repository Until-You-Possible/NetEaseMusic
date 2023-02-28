//
//  MusicServiceView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/1/1.
//

import SwiftUI
import SwiftUIFontIcon


struct MusicCentral: Identifiable {
    let id = UUID()
    var leadIcon: String
    var title: String
}


struct MusicServiceView: View {
    
    var messageCentralArray = [
         MessageCentral(leadIcon: "ellipsis.message", title: "云村有票"),
         MessageCentral(leadIcon: "backpack", title: "多多西西口袋"),
         MessageCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "商城"),
         MessageCentral(leadIcon: "ellipsis.message", title: "Beat专区"),
         MessageCentral(leadIcon: "backpack", title: "口袋彩铃"),
         MessageCentral(leadIcon: "line.3.horizontal.decrease.circle", title: "游戏专区")
    ]
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("音乐服务")
                    .frame(height: 40)
                    .padding(.leading, 20)
                Divider()
            }
            ForEach(messageCentralArray) { array in
                HStack {
                    Image(systemName: array.leadIcon)
                    Text(array.title)
                    Spacer()
                    FontIcon.text(.materialIcon(code: .chevron_right))
                }
                .frame(height: 40)
                .padding([.leading, .trailing], 13)
            }

        }
        .background(Color.white)
        .cornerRadius(12)
        .padding(.top, 10)
    }
}

struct MusicServiceView_Previews: PreviewProvider {
    static var previews: some View {
        MusicServiceView()
    }
}
