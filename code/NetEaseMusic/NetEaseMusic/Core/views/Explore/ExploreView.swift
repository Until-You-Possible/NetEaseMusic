//
//  ExploreView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct ExploreView: View {
    
    @Binding var isShowSideMenu: Bool
    
    var body: some View {
            // MARK: scroll view
        ScrollView (.vertical) {
                    // MARK: Banner view
                    BannerSlideView()
                    // MARK: Entry slide view
                    EntrySlideView()
                    // MARK: Recommendation view
                    RecommendationView()
                    // MARK: why Listen view
                    AllListenView()
            }
            .background(Color(hex: "#f5f7fb"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("show the left menu")
                        withAnimation(.easeInOut) {
                            self.isShowSideMenu.toggle()
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
                    .badge(20)
                }
                
                ToolbarItem(placement: .principal) {
                    VStack () {
                        NavigationLink {
                            SearchCenterView()
                        } label: {
                            // MARK: search wrapper
                            HStack (spacing: 0) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(hex: "#8783a2"))
                                Text("until-you-possible-arthur")
                                    .frame(width: 196)
                                    .foregroundColor(Color(hex: "#8783a2"))
                                FontIcon.text(.materialIcon(code: .flip))
                                    .foregroundColor(Color(hex: "#8783a2"))
                            }
                            .foregroundColor(Color(hex: "#dfd4f6"))
                            .frame(width: 260, height: 36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                     .stroke(.gray, lineWidth: 1)
    
                            )
                        }
                    }
                    .frame(height: 30)

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack (alignment: .center) {
                        FontIcon.text(.materialIcon(code: .mic_none), fontsize: 26)
                    }
                }
                
            }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(isShowSideMenu: .constant(false))
    }
}
