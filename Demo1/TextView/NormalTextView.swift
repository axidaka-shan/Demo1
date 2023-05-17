//
//  NormalTextView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/27.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI
import UIKit
struct NormalTextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator // 设置代理
        textView.font = UIFont.preferredFont(forTextStyle: .body) // 设置默认字体样式
        textView.isScrollEnabled = true // 允许滚动
        textView.isEditable = false // 允许编辑
        textView.isUserInteractionEnabled = false // 允许用户交互
      textView.backgroundColor = UIColor.gray
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text // 设置文本内容
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: NormalTextView
        
        init(_ parent: NormalTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text // 更新文本内容
        }
    }
}

