//
//  MessageCentralView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/1/1.
//

import SwiftUI

struct MessageCentralView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "ellipsis.message")
                Text("消息中心")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .frame(height: 40, alignment: .center)
            .padding([.leading, .trailing], 20)
            Divider()
                .padding([.leading, .trailing], 20)
            HStack {
                Image(systemName: "ellipsis.message")
                Text("云贝中心")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .frame(height: 40)
            .padding([.leading, .trailing], 20)
            Divider()
                .padding([.leading, .trailing], 20)
            HStack {
                Image(systemName: "ellipsis.message")
                Text("创作者中心")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .frame(height: 40)
            .padding([.leading, .trailing], 20)
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding(.top, 10)

        

    }
}

struct MessageCentralView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCentralView()
    }
}
