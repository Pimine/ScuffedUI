//
//  Logger.swift
//  https://github.com/denandreychuk/ScuffedUI
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Denis Andreychuk
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

extension Logger {
    enum LogLevel: String {
        case info    = "📔 INFO"
        case warning = "📒 WARNING"
        case error   = "📕 ERROR"
    }
}

let log = Logger.self
final class Logger {
    
    // MARK: - Properties
    
    static let prefix = "[ScuffedUtilities]"
    
    // MARK: - Log Methods
    
    static func info(_ message: String) {
        log(.info, message: message)
    }
    
    static func warning(_ message: String) {
        log(.warning, message: message)
    }
    
    static func error(_ message: String) {
        log(.error, message: message)
    }
    
    private static func log(_ level: LogLevel, message: String) {
        print("\(prefix) \(level.rawValue) \(message)")
    }
}
