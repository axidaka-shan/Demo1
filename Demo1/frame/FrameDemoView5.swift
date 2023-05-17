//
//  FrameDemoView5.swift
//  Demo1
//
//  Created by visit on 2023/5/14.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FrameDemoView5: View {
  @State private var alignment: HorizontalAlignment = .leading

  var body: some View {
      VStack {
          Spacer()

           VStack(alignment: alignment) {
             Text("Athos")
               .background(Color.red)
              .alignmentGuide(.leading, computeValue: { _ in 30 } )
              .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
              .alignmentGuide(.trailing, computeValue: { _ in 90 } )
              .background(Color.blue)

             Text("Porthos")
               .background(Color.blue)
                 .alignmentGuide(.leading, computeValue: { _ in 90 } )
                 .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 200 } )
                 .alignmentGuide(.trailing, computeValue: { _ in 30 } )
                 .background(Color.orange)

             Text("Aramis") // use implicit guide
               .background(Color.yellow)

           }
           .frame(width: 300,height: 100)
           .background(Color.gray)


          Spacer()
          HStack {
              Button("leading") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .leading }}
              Button("center") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .center }}
              Button("trailing") { withAnimation(.easeInOut(duration: 2)) { self.alignment = .trailing }}
          }
      }
  }
}

struct FrameDemoView5_Previews: PreviewProvider {
    static var previews: some View {
        FrameDemoView5()
    }
}
