//
//  MainTabView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct MainTabView: View {
    
    @State private var isShowSideMenu = false
    
    var body: some View {
        
        ZStack (alignment: .leading) {
                TabView () {
                    NavigationView {
                        ExploreView(isShowSideMenu: $isShowSideMenu)
                    }
                    .tabItem() {
                        Text("发现")
                          // font代码貌似没起作用
                          // (这里要使用UIkit实现, 暂时不考虑)
                          // .font(.system(size: 30, weight: .bold, design: .rounded))
                        Image(systemName: "viewfinder.circle")
                    }
                    NavigationView {
                        BodCastView()
                    }
                    .tabItem() {
                        Text("播客")
                        Image(systemName: "list.star")
                    }
                    NavigationView {
                        MyInfoView()
                    }
                    .tabItem() {
                        Label("我的", systemImage: "music.note.list")
                    }
                    NavigationView {
                        FollowView()
                    }
                    .tabItem() {
                        Label("关注", systemImage: "magnifyingglass.circle")
                    }
                    NavigationView {
                        CommunityView()
                    }
                    .tabItem() {
                        Label("社区", systemImage: "house.circle.fill")
                    }
                }
                // Before iOS 16, you can use .accentColor color modifier on TabView.
                .accentColor(Color(hex: "#d43c33"))
            
            SideMenuView()
                .frame(width: 300)
                .background(isShowSideMenu ? Color.white : Color.clear)
                .offset(x: isShowSideMenu ? 0: -300, y: 0)
                .zIndex(2)
            
            // MARK: shadow for the sideMenu
            if isShowSideMenu {
                ZStack {
                    Color(.black)
                        .animation(.easeInOut(duration: 0.5))
                        .opacity(isShowSideMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.isShowSideMenu = false
                    }
                }
                .ignoresSafeArea()
                
            }
        }
        }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
