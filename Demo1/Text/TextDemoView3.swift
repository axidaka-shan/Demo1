//
//  TextDemoView3.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct TextDemoView3: View {
  @State private var myDate = Date()

    var body: some View {
      let count = 10

      VStack(spacing: 10, content: {
        Text("Hello, \nWorld!")
        Text(verbatim: "Hello, \nWorld!")
        
        //这个属性用于设置Text的字距。
        Text("Hello, World!")
            .kerning(2)
        
        //tracking(CGFloat?) 这个属性用于设置Text的跟踪（字母之间的间距）。
        Text("Hello, World!")
            .tracking(2)
        
        Text("Hello, World!\nad\nad")
            .lineLimit(2)
        
        VStack {
                Text("These two text views have the same font")
                Text("applied to their parent view.")
        }
         .font(.system(size: 16, weight: .light, design: .default))
        
        Text("Hello, World!")
          .textCase(.uppercase)
        
        if #available(iOS 16.0, *) {
          Text(
            timerInterval: myDate...Date(timeInterval: 12 * 60, since: myDate),
            pauseTime: myDate + (10 * 60))
        }
        
        Text(myDate, style: Text.DateStyle.time)
        if #available(iOS 15.0, *) {
          Text(myDate, format: Date.FormatStyle(date: .numeric, time: .omitted))
          Text(myDate, format: Date.FormatStyle(date: .complete, time: .complete))
          Text(myDate, format: Date.FormatStyle().hour(.defaultDigitsNoAMPM).minute())
        }
                
      })
    }
}

struct TextDemoView3_Previews: PreviewProvider {
    static var previews: some View {
        TextDemoView3()
    }
}
