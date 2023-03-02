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
        VStack {
            // MARK: top search/scan/voice recognition fuctions
            HStack() {
                // MARK: search wrapper
                HStack () {
                    // spoltlight
                    Image(systemName: "magnifyingglass")
                    Text("dynamic message.....")
                    FontIcon.text(.materialIcon(code: .flip))
                }
                .background(Color(hex: "#f2f2f2"))
                .padding(.leading, 80)
                Spacer()
                
                FontIcon.text(.materialIcon(code: .mic_none))
            }
            .background(Color.red)
            
            
            ScrollView {
                VStack {
                    HStack { Spacer() }
                    Text("content")
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
