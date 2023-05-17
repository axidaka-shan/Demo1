//
//  MapDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct MapDemoView: View {
  var body: some View {
      MapView()
          .edgesIgnoringSafeArea(.all)
  }
}

struct MapDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MapDemoView()
    }
}
