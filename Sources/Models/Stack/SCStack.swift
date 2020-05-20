//
//  SCStack.swift
//  https://github.com/denandreychuk/ScuffedUI
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Den Andreychuk
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

open class SCStack: UIStackView {
    
    // MARK: - Properties
    
    private(set) public lazy var backgroundView = UIView(frame: bounds)
    
    open override var backgroundColor: UIColor? {
        get { backgroundView.backgroundColor }
        set { backgroundView.backgroundColor = newValue }
    }
    
    // MARK: - Initialization
    
    init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {

        super.init(frame: .zero)
        
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        
        commonInit()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        insertSubview(backgroundView, at: 0)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        isLayoutMarginsRelativeArrangement = true
    }
    
    // MARK: - Methods
    
    public func margins(_ margins: UIEdgeInsets) {
        layoutMargins = margins
    }
    
    public func margin(_ margin: CGFloat, edge: SCEdge) {
        switch edge {
        case .left:
            layoutMargins.left = margin
        case .right:
            layoutMargins.right = margin
        case .top:
            layoutMargins.top = margin
        case .bottom:
            layoutMargins.bottom = margin
        }
    }
    
    public func margin(_ margin: CGFloat, edges: [SCEdge] = SCEdge.allCases) {
        for edge in edges {
            self.margin(margin, edge: edge)
        }
    }
    
    public func horizontalMargin(_ margin: CGFloat) {
        self.margin(margin, edges: [.left, .right])
    }
    
    public func verticalMargin(_ margin: CGFloat) {
        self.margin(margin, edges: [.top, .bottom])
    }
}
