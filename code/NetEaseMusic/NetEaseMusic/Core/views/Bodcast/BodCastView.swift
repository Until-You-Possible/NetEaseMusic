//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI

struct BodCastView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .frame(width: 200, height: 100)
        
        }
    }
}



// Extension to set corner radii individually
//extension View {
//    func cornerRadius(topLeft: CGFloat, bottomRight: CGFloat) -> some View {
//        clipShape(ShapeWithCorners(topLeft: topLeft, bottomRight: bottomRight))
//    }
//}

// Custom Shape to apply corner radii individually
struct CustomRectangle: Shape {
    let cornerRadius: CGFloat = 20

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let topRight = CGPoint(x: rect.maxX, y: 0)
        _ = CGPoint(x: 0, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)

        path.move(to: topRight)
        path.addLine(to: CGPoint(x: rect.midX + cornerRadius, y: rect.maxY))
        path.addLine(to: bottomRight)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY + cornerRadius))

        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)

        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)

        return path
    }
}



struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
