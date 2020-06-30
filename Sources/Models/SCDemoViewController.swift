//
//  SCDemoViewController.swift
//  https://github.com/Pimine/ScuffedUI
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit
import EasySwiftLayout

open class SCDemoViewController: UIViewController {

    // MARK: - User Interface

    private lazy var titleLabel = configure(UILabel()) {
        let typeName = String(describing: self)
        $0.text = "Demo: \(typeName)\nScreen in development."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    // MARK: - View controller lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        addAndLayoutSubviews()
    }
}

// MARK: - Layout and appearance configuration

private extension SCDemoViewController {
    
    func configureAppearance() {
        view.backgroundColor = #colorLiteral(red: 0.9593952298, green: 0.9594177604, blue: 0.959405601, alpha: 1)
    }
    
    func addAndLayoutSubviews() {
        titleLabel
            .add(toSuperview: view)
            .centerInSuperview()
    }
}
