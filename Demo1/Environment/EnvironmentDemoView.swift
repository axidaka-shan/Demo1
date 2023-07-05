//
//  EnvironmentDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

/**
 SwiftUI 中的 environment 函数用于修改视图层次结构的环境值。它接受两个参数：要修改的环境值的键路径和要设置的新值。
 
 在这个例子中，我们使用 @Environment 属性包装器来访问 colorScheme 环境值。然后，我们使用这个值来设置 Text 视图的前景色和背景色。最后，我们使用 environment 函数将 colorScheme 环境值设置为 .light。

 这将导致 Text 视图更新其颜色以匹配新的 colorScheme 值。
 该修饰符影响给定的视图，以及该视图的后代视图。它在您调用它的视图层次结构之外没有任何影响。
 */

struct EnvironmentDemoView: View {
    var body: some View {
      
      VStack {
        MyView()
        .colorScheme(.dark)
      
        MyView()
      
      }
      
    }
}

struct EnvironmentDemoView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentDemoView()
    }
}

struct MyView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello, world!")
            .foregroundColor(colorScheme == .dark ? .red : .blue)
            .environment(\.colorScheme, .light)
    }
}
