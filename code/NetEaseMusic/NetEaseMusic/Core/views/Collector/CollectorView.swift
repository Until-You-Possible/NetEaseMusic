//
//  CollectorView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI
import SwiftUIFontIcon
import UIKit

struct CollectorView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                
                       Text("Main Content")
                    .navigationBarTitleDisplayMode(.inline)
                           .toolbar {
                               ToolbarItem(placement: .navigationBarLeading) {
                                   Button(action: {
                                       // Left button action
                                   }) {
                                       Image(systemName: "arrow.left")
                                   }
                               }
                               
                               ToolbarItem(placement: .principal) {
                                   HStack (spacing: 0) {
                                       HStack(spacing: 0) {
                                           FontIcon.text(.materialIcon(code: .add), fontsize: 18)
                                           Spacer()
                                               .frame(width: 4)
                                           Text("添加状态")
                                               .font(.system(size: 14))
                                       }
                                       .frame(width: 100, height: 24)
                                       .background(.white)
                                       .cornerRadius(20)
                                       .overlay() {
                                           RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .stroke(.white, lineWidth: 1)
                                       }
                                       .overlay {
                                           TriangleShape1()
                                               .frame(width: 10, height: 5)
                                               .foregroundColor(.white)
                                               .offset(x:0, y: 14)
                                       }
                                   }
                               }
                               
                               ToolbarItem(placement: .navigationBarTrailing) {
                                   Button(action: {
                                       // Right button action
                                   }) {
                                       Image(systemName: "gear")
                                   }
                               }
                           }
                Text("xxxxxxxxdssssssssssx")
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(.red)
            
    }
       
    }
    
}

struct TriangleShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
          path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
          path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
          path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
          path.closeSubpath()
          return path
        
    }
}

struct CollectorView_Previews: PreviewProvider {
    static var previews: some View {
        CollectorView()
    }
}
