//
//  HotSongsView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/4.
//

import SwiftUI

struct HotSongsView: View {
    var body: some View {
        NavigationView() {
            VStack {
                ScrollView {
                    LazyVStack {
                        Text("dd")
                        Text("ddfffffff")
                    }
                }
            }
            .navigationTitle("热歌榜")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HotSongsView_Previews: PreviewProvider {
    static var previews: some View {
        HotSongsView()
    }
}
