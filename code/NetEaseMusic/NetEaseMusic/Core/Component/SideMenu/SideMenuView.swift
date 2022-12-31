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
                Text("ddd")
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
