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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                MenuButtonView()
            }
            ToolbarItem(placement: .principal) {
                Text("动态")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "plus")
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .onTapGesture {
                        print("plus clicked")
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
