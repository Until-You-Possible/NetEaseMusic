//
//  Test01.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/28.
//

import SwiftUI

struct Test01: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar {
                    ToolbarItem () {
                        Image(systemName: "plus")
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                    }
                }
        }
    }
}

struct Test01_Previews: PreviewProvider {
    static var previews: some View {
        Test01()
    }
}
