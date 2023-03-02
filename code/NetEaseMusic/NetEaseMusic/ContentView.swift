//
//  ContentView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/4.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    
    // the sidebar should be displayed here
    
    @State private var isLogin = true
    @State private var isShowSideMenu = false
    
    var body: some View {
        
        Group {
            
            ZStack(alignment: .topLeading) {
                
                if isLogin {
                     MainTabView()
                } else {
                    LoginView()
                }
                
                //MARK: shadow for the sideMenu
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
                
                //MARK: to show the sideMenu by button
                SideMenuView()
                    .frame(width: 300)
                    .background(isShowSideMenu ? Color.white : Color.clear)
                    .offset(x: isShowSideMenu ? 0: -300, y: 0)
                
                if isShowSideMenu == false {
                    Button {
                        // to show the sidebar
                        withAnimation(.easeInOut) {
                            self.isShowSideMenu = true
                        }
                    } label: {
                        Image(systemName: "sidebar.left")
                            .foregroundColor(.black)
                            .font(.system(size: 24))

                    }
                    .padding(.leading, 16)
                }
            }
            .frame(width: .infinity)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        // to show the sidebar
//                        withAnimation(.easeInOut) {
//                            self.isShowSideMenu = true
//                        }
//                    } label: {
//                        Image(systemName: "sidebar.left")
//                            .foregroundColor(.black)
//                            .font(.system(size: 24))
//
//                    }
//                }
//            }
//            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
