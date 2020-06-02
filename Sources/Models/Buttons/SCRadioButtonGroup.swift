//
//  SCRadioButtonGroup.swift
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

open class SCRadioButtonGroup: UIControl {
    
    // MARK: - Public properties
    
    public private(set) var selectedIndex = -1
    
    public var spacing: CGFloat {
        get { container.spacing }
        set { container.spacing = newValue }
    }
    
    public var distribution: UIStackView.Distribution {
        get { container.distribution }
        set { container.distribution = newValue }
    }
    
    public var buttons: [UIButton] {
        container.arrangedSubviews.compactMap { $0 as? UIButton }
    }
    
    // MARK: - User interface
    
    public let container = SCStack()
    
    // MARK: - Initialization
    
    public init(
        buttons: [UIButton] = [],
        spacing: CGFloat = 0.0,
        distribution: UIStackView.Distribution = .fillEqually) {
        
        super.init(frame: .zero)
        
        self.spacing = spacing
        self.distribution = distribution
        
        addAndLayoutSubviews()
        setButtons(buttons)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    public func setButtons(_ buttons: [UIButton]) {
        
        // Remove previous buttons
        
        buttons.forEach {
            container.removeArrangedSubview($0)
            $0.removeTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        }
        
        // Set new buttons
        
        for button in buttons {
            container.addArrangedSubview(button)
            button.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        }
    }
    
    public func selectIndex(_ index: Int) {
        guard buttons.indices.contains(index) else { return }
        buttons[index].isSelected = true
        selectedIndex = index
    }
    
    // MARK: - Action
    
    @objc private func onButtonPressed(_ sender: UIButton) {
        buttons.forEach { $0.isSelected = false }
        
        sender.isSelected = true
        selectedIndex = buttons.firstIndex(of: sender)!
        sendActions(for: .valueChanged)
    }
}

// MARK: - Layout

private extension SCRadioButtonGroup {
    
    func addAndLayoutSubviews() {
        
        // Container
        
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
