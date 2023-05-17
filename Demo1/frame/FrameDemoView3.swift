//
//  FrameDemoView3.swift
//  Demo1
//
//  Created by visit on 2023/5/14.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

/**
 Container Alignment: 容器的对齐方式主要有2个目的，首先它定义了其内部views的隐式对齐方式，没有使用alignmentGuides()modifier的view都使用隐式对齐，然后定义了内部views中使用了alignmentGuides()的view，只有参数与容器对齐参数相同，容器才会根据返回值计算布局.
 
 Alignment Guide：如果该值和Container Alignment的参数不匹配，则不会生效.
 
 Implicit Alignment Value：通常来说，隐式对齐采用的值都是默认的值，系统通常会使用和对齐参数相匹配的值.
 
 Explicit Alignment Value：显式对齐跟隐式对齐相反，是我们自己用程序明确给出的返回值.
 
 Frame Alignment：表示容器中views的对齐方式，把views看作一个整体，整体偏左，居中，或居右.
 
 Text Alignment：控制多行文本的对齐方式.
 */

struct FrameDemoView3: View {
  var body: some View {
    
    List {
      VStack {
          Text("床前明月光，疑是地上霜")
              .background(Color.green)
          Text("举头望明月，低头思故乡")
              .background(Color.blue)
      }
      .frame(width: 100, height: 100)
      
      // 加布局优先级，默认0
      VStack {
            Text("床前明月光，疑是地上霜")
                .background(Color.green)
            Text("举头望明月，低头思故乡")
                .background(Color.blue)
                .layoutPriority(1)
        }
      .frame(width: 100, height: 100)
      
      VStack(alignment: .leading, content: {
        Text("hello world...\n...here i am!")
          .alignmentGuide(.leading) { d in
            d[explicit: .leading] ?? 10
          }
          .alignmentGuide(.leading) { d in
            d[.leading]
          }
          .multilineTextAlignment(.leading)
      })
      .frame(alignment: .leading)
      
      ZStack(alignment: .topLeading) {
          Text("Hello")
              .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 0 })
              .alignmentGuide(.top, computeValue: { d in return 0 })
              .background(Color.green)

          Text("World")
              .alignmentGuide(.top, computeValue: { d in return 100 })
              .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 0 })
              .background(Color.purple)

      }
      .background(Color.orange)
      
      ZStack(alignment: .topLeading) {
          Text("Hello")
              .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return 0 })
              .alignmentGuide(.top, computeValue: { d in return 0 })
              .background(Color.green)

          Text("World")
              .alignmentGuide(.top, computeValue: { d in return 100 })
              .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in return d[.top] })
              .background(Color.purple)

      }
      .background(Color.orange)
      
      HStack {
          Text("床前明月光")
              .font(.caption)
              .frame(width: 50)
              .background(Color.orange)

          Text("疑是地上霜")
              .font(.body)
              .frame(width: 50)
              .background(Color.green)

          Text("举头望明月")
              .font(.largeTitle)
              .frame(width: 50)
              .background(Color.blue)

      }
      
      HStack(alignment: .firstTextBaseline) {
          Text("床前明月光")
              .font(.caption)
              .frame(width: 50)
              .background(Color.orange)

          Text("疑是地上霜")
              .font(.body)
              .frame(width: 50)
              .background(Color.green)

          Text("举头望明月")
              .font(.largeTitle)
              .frame(width: 50)
              .background(Color.blue)

      }
      
      HStack(alignment: .lastTextBaseline) {
          Text("床前明月光")
              .font(.caption)
              .frame(width: 50)
              .background(Color.orange)

          Text("疑是地上霜")
              .font(.body)
              .frame(width: 50)
              .background(Color.green)

          Text("举头望明月")
              .font(.largeTitle)
              .frame(width: 50)
              .background(Color.blue)

      }
      
      HStack(alignment: .lastTextBaseline) {
          Text("床前明月光")
              .font(.caption)
              .frame(width: 50)
              .background(Color.orange)

          Text("疑是地上霜")
              .font(.body)
              .frame(width: 50)
              .background(Color.green)

          Text("举头望明月")
              .font(.largeTitle)
              .alignmentGuide(.lastTextBaseline, computeValue: { (d) -> CGFloat in
                  d[.firstTextBaseline]
              })
              .frame(width: 50)
              .background(Color.blue)

      }
      
      
    }
    
  }
}

struct FrameDemoView3_Previews: PreviewProvider {
    static var previews: some View {
        FrameDemoView3()
    }
}
