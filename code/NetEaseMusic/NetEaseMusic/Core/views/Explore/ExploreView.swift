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
            HStack() {
                HStack(alignment: .center) {
                    Spacer()
                }
                // MARK: search wrapper
                HStack () {
                    // spoltlight
                    Image(systemName: "magnifyingglass")
                    Text("dynamic message.....")
                    FontIcon.text(.materialIcon(code: .flip))
                }
                .background(Color(hex: "#f2f2f2"))
                .frame(width: 260, height: 40)
                .padding(.bottom, 10)
                Spacer()
                HStack {
                    FontIcon.text(.materialIcon(code: .mic_none))
                }
            }
            .background(Color.red)
            
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
            .background(Color.blue)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
