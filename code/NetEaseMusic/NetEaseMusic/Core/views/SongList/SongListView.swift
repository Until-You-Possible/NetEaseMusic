//
//  SongListView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI

struct ImageName {
    var id = UUID()
    var name: String
}

let imageArray = [
    
    ImageName(name: "test01"),
    ImageName(name: "test02"),
    ImageName(name: "test03"),
    ImageName(name: "test04")

]



struct SongListView: View {
    
    var body: some View {
        
        VStack () {
            
            // parallax
            GeometryReader(content: { geomotry in
                
                let size = geomotry.size
                
                ScrollView (.horizontal) {
                    
                    HStack (spacing: 10) {
                        
                        ForEach(imageArray, id: \.id) { image in
                            
                            GeometryReader { proxy in
                                let cardSize = proxy.size
                                Image(image.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .cornerRadius(15)
                            }
                            .frame(width: size.width)
                            
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
            })
            .frame(height: 500)
            
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
