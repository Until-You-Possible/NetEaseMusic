//
//  RecommandationView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/4.
//

import SwiftUI

struct RecommandationView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.83, green: 0.24, blue: 0.20, alpha: 1.00)]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(red: 0.83, green: 0.24, blue: 0.20, alpha: 1.00)]
    }
    
    var body: some View {
        NavigationView() {
            VStack {
                ScrollView {
                    LazyVStack {
                        Text("dd")
                    }
                }
            }
            .navigationTitle("推荐")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RecommandationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandationView()
    }
}
