//
//  SCRadioButton.swift
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

open class SCRadioButton: SCButton {
    
    // MARK: - Properties
    
    public var offImage: UIImage? {
        didSet {
            setImage(offImage, for: .normal)
        }
    }
    
    public var onImage: UIImage? {
        didSet {
            setImage(onImage, for: .selected)
        }
    }
    
    // MARK: - Initialization
    
    public init(offImage: UIImage? = nil, onImage: UIImage? = nil) {
        self.offImage = offImage
        self.onImage = onImage
        super.init(frame: .zero)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setImage(offImage, for: .normal)
        setImage(onImage, for: .selected)
        
        addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func onButtonPressed() {
        isSelected.toggle()
    }
}
