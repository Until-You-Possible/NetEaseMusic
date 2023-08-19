//
//  HeaderTabView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/19.
//

import SwiftUI

struct HeaderTabView: View {
    
    @State var isChoosed: Bool = true
    
    var body: some View {
        
        HStack(alignment: .center) {
            Spacer()
            Text("创建歌单")
                    .onTapGesture {
                        withAnimation {
                            self.isChoosed = !isChoosed
                        }
                    }
                    .foregroundColor(isChoosed ? .black : .gray)
                    .modifier(TabIndicatorModifier(isSelected: isChoosed))
            
            Spacer()
            
                .frame(width: 60)
            Text("收藏歌单")
                .onTapGesture {
                    withAnimation {
                        self.isChoosed = !isChoosed
                    }
                }
                .foregroundColor(!isChoosed ? .black : .gray)
                .modifier(TabIndicatorModifier(isSelected: !isChoosed))
            Spacer()
        }
    }
}

struct TabIndicatorModifier: ViewModifier {
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content.overlay(
            withAnimation(.spring()) {
                Rectangle()
                    .frame(width: isSelected ? 20 : 0, height: 4)
                    .foregroundColor(.red)
                    .cornerRadius(2)
                    .offset(x: 0, y: 14)
            }
        )
    }
}

struct HeaderTabView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTabView()
    }
}
