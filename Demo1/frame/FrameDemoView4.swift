//
//  FrameDemoView4.swift
//  Demo1
//
//  Created by visit on 2023/5/14.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FrameDemoView4: View {
  var w: CGFloat = 200
  var texts: [String] = ["aas1", "aas2","aas3","aas4","aas5","aas6","aas7","aas8","aas9","aas10","aas11","aas12asd"]

  var body: some View {
      self.generateContent(in: w)
  }

  private func generateContent(in w: CGFloat) -> some View {
      var width = CGFloat.zero
      var height = CGFloat.zero

      return ZStack(alignment: .topLeading) {
          ForEach(self.texts, id: \.self) { t in
              self.item(for: t)
                  .padding([.trailing, .bottom], 4)
                  .alignmentGuide(.leading, computeValue: { d in

                      if (abs(width - d.width) > w)
                      {
                          width = 0
                          height -= d.height
                      }
                      let result = width
                      if t == self.texts.last! {
                          width = 0 //last item
                      } else {
                          width -= d.width
                      }
                      return result
                  })
                  .alignmentGuide(.top, computeValue: {d in
                      let result = height
                      if t == self.texts.last! {
                          height = 0 // last item
                      }
                      return result
                  })
          }
      }
      .background(Color.gray)
  }

  func item(for text: String) -> some View {
      Text(text)
          .padding([.leading, .trailing], 8)
          .frame(height: 30)
          .font(.subheadline)
          .background(Color.orange)
          .foregroundColor(.white)
          .cornerRadius(15)
          .onTapGesture {
              print("你好啊")
      }
  }
}

struct FrameDemoView4_Previews: PreviewProvider {
    static var previews: some View {
      FrameDemoView4(w: 200, texts: ["aas1", "aas2","aas3","aas4","aas5","aas6","aas7","aas8","aas9","aas10","aas11","aas12asd"])
    }
}
