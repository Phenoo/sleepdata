import SwiftUI

struct AnchorsKey: PreferenceKey {
    // Each key is a row index. The corresponding value is the
    // .center anchor of that row.
    typealias Value = [Int: Anchor<CGPoint>]

    static var defaultValue: Value { [:] }

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue()) { $1 }
    }
}

struct NumberCarouselView: View {
    let myArray: [Int] = [Int](14...100)
    @State private var myRowNumber: Int = 18

    private func topRow(of anchors: AnchorsKey.Value, in proxy: GeometryProxy) -> Int? {
        var xBest = CGFloat.infinity
        var answer: Int? = nil
        for (row, anchor) in anchors {
            let x = proxy[anchor].x
            guard x >= 0, x < xBest else { continue }
            answer = row
            xBest = x
        }
        return answer
    }

    var body: some View {
        
                GeometryReader { proxy in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ScrollViewReader { proxy in
                                HStack(spacing: 30){
                                    ForEach(myArray, id: \.self) { index in
                                        Text("\(index)").id(index).font(.title)
                                            .foregroundStyle(myRowNumber == index ? Color.lightPurple : .white)
                                            .padding()
                                            .background {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(myRowNumber == index ? Color.lightPurple : .clear, lineWidth: myRowNumber == index ? 2 : 0)
                                            }
                                            .anchorPreference(
                                                key: AnchorsKey.self,
                                                value: .center
                                            ) { [index: $0] }
                                            .onTapGesture {
                                                withAnimation {
                                                    myRowNumber = index

                                                }
                                            }
                                    }

                                }
                                .onAppear {
                                    proxy.scrollTo(18, anchor: .leading)
                                }
                            }
                        }
                    }
                }

            
        
    }
}

#Preview {
    NumberCarouselView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

