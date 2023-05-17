//
//  ListDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListDemoView: View {
  let imageNames = ["circle.fill", "circle"]
  
  var body: some View {
      List {
          ForEach(0..<5) { _ in
              HStack {
                  ForEach(self.imageNames, id: \.self) { imageName in
                      Image(systemName: imageName)
                          .resizable()
                          .frame(width: 50, height: 50)
                          .foregroundColor(.blue)
                  }
              }
          }
      }
  }
}


struct ListDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoView()
    }
}

/**
 在上面的例子中，我们创建了一个包含两个圆形图片的数组imageNames，然后在List中使用ForEach来创建多个行。在每一行中，我们使用HStack来包含两个圆形图片。使用ForEach来遍历imageNames数组，创建两个圆形图片。我们在Image中使用systemName来指定图片的名称，使用resizable来让图片可以调整大小，使用frame来设置图片的大小，使用foregroundColor来设置图片的颜色。
 注意，在上面的例子中，我们使用了两个ForEach，第一个用于创建多个行，第二个用于在每一行中创建两个圆形图片。在第二个ForEach中，我们使用了id参数来标识每个元素。这个参数是必须的，它告诉SwiftUI如何比较两个元素是否相等。在上面的例子中，我们使用了.self来比较元素的值是否相等。
 
 */
