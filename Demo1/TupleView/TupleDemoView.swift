//
//  TupleDemoView.swift
//  Demo1
//
//  Created by visit146 on 2023/5/17.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct TupleDemoView: View {
    var body: some View {
        TupleView((Text("Hello, World!"), Image(systemName: "swift")))
    }
}

struct TupleDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TupleDemoView()
    }
}
