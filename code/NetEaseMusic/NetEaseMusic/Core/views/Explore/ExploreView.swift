//
//  ExploreView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct ExploreView: View {
    
    @State var isNavigationActive = false
    @State private var isShowSideMenu = false
    
    var body: some View {
  
        ZStack (alignment: .leading) {
            VStack (spacing: 0) {
                // MARK: top search/scan/voice recognition fuctions
                VStack (alignment: .leading) {
                    HStack(spacing: 24) {
                        Button {
                            print("show the left menu")
                            withAnimation(.easeInOut) {
                                self.isShowSideMenu = true
                            }
                        } label: {
                            ZStack {
                                FontIcon.text(.materialIcon(code: .menu), fontsize: 26)
                                // Replace "xxx" with the actual badge value you want to display
                                Text("20")
                                    .font(.system(size: 8))
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -6) // Adjust the offset to position the badge as per your requirement
                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.black)
                        .badge(10)
                        
                        // MARK: search wrapper
                        Button(action: {
                            self.isNavigationActive = true
                        }) {
                            ZStack () {
                                RoundedRectangle (cornerRadius: 60)
                                    .frame(width: 260, height: 40)
                                    .foregroundColor(Color(hex: "#dfd4f6"))
                                HStack (spacing: 16) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color(hex: "#8783a2"))
                                    Text("until-you-possible")
                                        .frame(width: 160)
                                        .foregroundColor(Color(hex: "#8783a2"))
                                    FontIcon.text(.materialIcon(code: .flip))
                                        .foregroundColor(Color(hex: "#8783a2"))
                                }
                                
                            }
                            .background(NavigationLink("", destination: SearchCenterView(), isActive: $isNavigationActive))
                            .frame(width: 260, height: 40)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        HStack (alignment: .center) {
                            FontIcon.text(.materialIcon(code: .mic_none), fontsize: 26)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: "#dfdef6"), Color(hex: "#f0e0f2")]), startPoint: .leading, endPoint: .trailing)
                )
                
                // MARK: scroll view
                ScrollView {
                    VStack (spacing: 0) {
                        HStack { Spacer() }
                        // MARK: Banner view
                        BannerSlideView()
                        // MARK: Entry slide view
                        EntrySlideView()
                        // MARK: Recommendation view
                        RecommendationView()
                        // MARK: why Listen view
                        AllListenView()
                        
                    }
                    .padding(.top, 6)
                }
                .background(Color(hex: "#f5f7fb"))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("探索")
                }
            }
            
            // MARK: to show the sideMenu by button
            // 这里要注意的一点是 在ZStack中代码越前 层级越低(如果不加zIndex的情况下)
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
