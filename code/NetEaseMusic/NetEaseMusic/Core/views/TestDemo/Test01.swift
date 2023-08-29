//
//  Test01.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/28.
//

import SwiftUI

struct Test01: View {
    
    @State private var rotation: Double = 0.0
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging = false

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                let angle = atan2(value.location.y - 150, value.location.x - 150)
                let rotation = angle * 180 / .pi
                let damping: Double = 0.5 // Adjust the damping factor
                let normalizedRotation = self.rotation + rotation
                self.rotation = self.isDragging ? normalizedRotation * damping : normalizedRotation
                self.isDragging = true
            }
            .onEnded { _ in
                self.isDragging = false
                // Add code for haptic feedback here
            }

        return VStack {
            Text("Dial Value: \(Int(rotation))")
                .padding()
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 20)
                    .frame(width: 300, height: 300)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.blue, lineWidth: 20)
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(rotation), anchor: .center)
            }
            .gesture(dragGesture)
        }
    }
}


struct Test01_Previews: PreviewProvider {
    static var previews: some View {
        Test01()
    }
}
