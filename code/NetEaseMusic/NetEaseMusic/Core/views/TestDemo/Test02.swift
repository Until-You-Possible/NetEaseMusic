//
//  Test02.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/29.
//

import SwiftUI

struct Test02: View {
    
    @State var selection: Int = 2
    
    var body: some View {
        Picker(selection: $selection) {
            Text("xxx111").tag(1)
            Text("xxx22dd2").tag(2)
        } label: {
            Text("picker")
        }

    }
}

struct Test02_Previews: PreviewProvider {
    static var previews: some View {
        Test02()
    }
}
