//
//  NetworkImage.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct NetworkImage: View {
  let url: URL
  var body: some View {
    if #available(iOS 15.0, *) {
      AsyncImage(url: url) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
    } else {
      // Fallback on earlier versions
    }
  }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
      NetworkImage(url: URL(string: "")!)
    }
}
