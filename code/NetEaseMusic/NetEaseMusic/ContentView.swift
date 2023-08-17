//
//  ContentView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/4.
//

import SwiftUI 

struct ContentView: View {
    
    // the sidebar should be displayed here
    
    @State private var isLogin = true
    
    var body: some View {
        Group {
            isLogin ? AnyView(MainTabView()) : AnyView(LoginView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
