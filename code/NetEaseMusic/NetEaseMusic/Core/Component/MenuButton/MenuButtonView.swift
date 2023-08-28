//
//  MenuButton.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/28.
//

import SwiftUI
import SwiftUIFontIcon


struct MenuButtonView: View {
    
    @State var messageCount: Int = 0
    
    var body: some View {
        VStack () {
            Button {
                print("show the left menu")
                withAnimation(.easeInOut) {
                    print("xxx")
//                    self.isShowSideMenu.toggle()
                }
            } label: {
                ZStack {
                    FontIcon.text(.materialIcon(code: .menu), fontsize: 26)
                    // Replace "xxx" with the actual badge value you want to display
                    if messageCount > 0 {
                        Text("\(messageCount)")
                            .font(.system(size: 8))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -6) // Adjust the offset to position the badge as per your requirement
                    }
                }
                
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.black)
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView()
    }
}
