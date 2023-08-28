//
//  CommunityView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        VStack () {
            Text("社区")
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                MenuButtonView()
            }
            ToolbarItem(placement: .principal) {
                HStack () {
                    Text("广场")
                    Text("视频")
                    Text("歌房")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "pencil.and.outline")
                    .onTapGesture {
                        print("plus clicked")
                    }
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
