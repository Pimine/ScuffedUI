//
//  AdaptiveUI.swift
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

final public class ScuffedLayoutManager: ObservableObject {
    
    // MARK: - Properties
    
    static private let screenSize = UIScreen.main.bounds.size
    
    static var scaledFactorWidth: CGFloat {
        validatePrimaryDesignResolution()
        return min(screenSize.height, screenSize.width) / primaryDesignResolution.width
    }
    
    static var scaledFactorHeight: CGFloat {
        validatePrimaryDesignResolution()
        return max(screenSize.height, screenSize.width) / primaryDesignResolution.height
    }
    
    static public var primaryDesignResolution: CGSize = .zero
    
    static public var brandMargins: [UIInterfaceOrientation: CGFloat] = [:]
    
    @available(iOSApplicationExtension, unavailable)
    static public var brandMargin: CGFloat {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return 15.scaledByWidth
        }
        let interfaceOrientation = scene.interfaceOrientation
        return brandMargins[interfaceOrientation] ?? 15.scaledByWidth
    }
    
    // MARK: - Initialization
    
    private init() { }
    
    // MARK: - Methods
    
    private static func validatePrimaryDesignResolution() {
        guard primaryDesignResolution == .zero else { return }
        log.error("Cannot calculate scale factor. You should set primary design resolution first. Use ScuffedLayoutManager.primaryDesignResolution for it.")
        fatalError("primaryDesignResolution not set")
    }
}

extension BinaryInteger {
    public var scaledByWidth:  CGFloat { CGFloat(self) * ScuffedLayoutManager.scaledFactorWidth }
    public var scaledByHeight: CGFloat { CGFloat(self) * ScuffedLayoutManager.scaledFactorHeight }
    
    public static var brandMargin: CGFloat { ScuffedLayoutManager.brandMargin }
}

extension BinaryFloatingPoint {
    public var scaledByWidth:  CGFloat { CGFloat(self) * ScuffedLayoutManager.scaledFactorWidth }
    public var scaledByHeight: CGFloat { CGFloat(self) * ScuffedLayoutManager.scaledFactorHeight }
    
    public static var brandMargin: CGFloat { ScuffedLayoutManager.brandMargin }
}
