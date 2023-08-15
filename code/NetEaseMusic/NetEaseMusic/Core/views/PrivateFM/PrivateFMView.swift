import SwiftUI

struct ScrollOffsetPreferenceKey2: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct PrivateFMView: View {
    @State private var scrollOffset: CGFloat = 0
    
    init () {
        print("xx")
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        Text("Item \(index)")
                            .frame(width: 200, height: 100)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                scrollOffset = geo.frame(in: .global).minY
                            }
                            .onChange(of: geo.frame(in: .global).minY) { newValue in
                                scrollOffset = newValue
                                // Do something with the scroll offset
                                print("Scroll Offset: \(scrollOffset)")
                            }
                    }
                )
            
                
                .onAppear {
                    proxy.scrollTo(10, anchor: .top) // Scroll to a specific item
                }
                .overlay(
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey2.self, value: geo.frame(in: .global).minY)
                    }
                )
            }
            .background(
                Color.clear
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { newOffset in
                        scrollOffset = newOffset
                    }
            )
        }
    }
}

struct PrivateFMView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateFMView()
    }
}

