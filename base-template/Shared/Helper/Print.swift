//
//  Print.swift
//  base-template
//
//  Created by Ziad Ahmed on 01/01/2025.
//

import Foundation

func printToConsole(message: String) {
    #if DEBUG
        print(message)
    #endif
}
