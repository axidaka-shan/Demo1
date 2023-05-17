//
//  ListDemoView5.swift
//  Demo1
//
//  Created by axidaka on 2023/4/3.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ListDemoView5: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        RefreshableList(onRefresh: refresh) {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
    
    func refresh() {
        // 模拟刷新操作
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.items = ["Item 4", "Item 5", "Item 6"]
//            self.isRefreshing = false
        }
    }
}
