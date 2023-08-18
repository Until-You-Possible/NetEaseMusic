//
//  MainTabView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct MainTabView: View {
    var body: some View {
            TabView {
                ExploreView()
                    .tabItem() {
                        Text("发现")
//                        // font代码貌似没起作用
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        Image(systemName: "viewfinder.circle")
//                         Label("发现", systemImage: "music.note.list")
//                            .font(.system(size: 50))
                    }
                BodCastView()
                    .tabItem() {
                        Text("播客")
                        Image(systemName: "list.star")
                    }
                MyInfoView()
                    .tabItem() {
                        Label("我的", systemImage: "music.note.list")
                    }
                FollowView()
                    .tabItem() {
                        Label("关注", systemImage: "magnifyingglass.circle")
                    }
                CommunityView()
                    .tabItem() {
                        Label("社区", systemImage: "house.circle.fill")
                    }
            }
            // Before iOS 16, you can use .accentColor color modifier on TabView.
            .accentColor(Color(hex: "#d43c33"))
            .background(.red)
        }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
