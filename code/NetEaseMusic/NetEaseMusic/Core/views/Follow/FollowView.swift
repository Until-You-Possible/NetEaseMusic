//
//  FollowView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct FollowView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack () {
            Text("关注")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // 在此处添加按钮的操作
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("关注")
                }
            }
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView()
    }
}
