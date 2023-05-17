//
//  TextDemoView2.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct TextDemoView2: View {
  let text = "这是一行很长的中文文本，将自动滚动到末尾。这是一行很长的中文文本，将自动滚动到末尾。"
  
  var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
          Text(text)
              .padding()
      }
      .onAppear {
          let scrollWidth = UIScreen.main.bounds.width - 32 // subtract padding
          let textWidth = text.widthOfString(usingFont: .systemFont(ofSize: 17)) // calculate text width
          let offset = textWidth - scrollWidth // calculate offset
          if offset > 0 {
              DispatchQueue.main.async {
                  withAnimation {
//                      scrollView.contentOffset.x = offset // scroll to end
                  }
              }
          }
      }
  }
}

struct TextDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        TextDemoView2()
    }
}


extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
