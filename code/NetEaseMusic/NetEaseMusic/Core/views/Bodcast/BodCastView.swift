//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI


struct BodCastView: View {

    let items = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        let url2 = "http://p1.music.126.net//A-uu8_1aJ_mDsNtQhckBmA==//109951168790102094.jpg"
        AsyncImage(url: URL(string: "https://p1.music.126.net/cSAmmAvsKhm3N-zxWg7QcQ==/109951168490195225.jpg?param=62y62")) { image in
            image
                .resizable()
                .frame(width: 370)
                .scaledToFit()
                .cornerRadius(10)
        } placeholder: {
            // Placeholder image while loading
            Color.gray
        }

    }

    
}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
