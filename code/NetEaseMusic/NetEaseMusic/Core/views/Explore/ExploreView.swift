//
//  ExploreView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct ExploreView: View {
    var body: some View {
        
        
        VStack (spacing: 0) {
            // MARK: top search/scan/voice recognition fuctions
            VStack (alignment: .leading) {
                HStack(spacing: 24) {
                    Button {
                        print("show the left menu")
                    } label: {
                        FontIcon.text(.materialIcon(code: .menu), fontsize: 26)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.black)
                    
                    // MARK: search wrapper
                    Button(action: {
                        print("action button")
                        
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
                VStack {
                    HStack { Spacer() }
                    // MARK: Banner view
                    BannerSlideView()
                    Divider()
                        .background(Color.black)
                    // MARK: Entry slide view
                    EntrySlideView()
                    
                    Divider()
                        .background(Color.black)
                    // MARK: Recommendation view
                    RecommendationView()

                    Divider()
                        .background(Color.black)
                    // MARK: why recommendation
                    WhyRecommendataionView()
                    Divider()
                        .background(Color.black)
                    
                    Divider()
                        .background(Color.black)
                }
            }
            .background(Color(hex: "#f5f7fb"))
        }

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
