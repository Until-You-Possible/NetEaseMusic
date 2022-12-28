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
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            if isLogin {
                 MainTabView()
            } else {
                LoginView()
            }
            
            Button {
                // to show the sidebar
                print("sidebar")
            } label: {
                Image(systemName: "sidebar.left")
                    .foregroundColor(.black)
                    .font(.system(size: 24))
            }
            .padding(.leading, 16)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        
    }
}
