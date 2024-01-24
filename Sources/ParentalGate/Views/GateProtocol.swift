//
//  File.swift
//  
//
//  Created by HossinAsaadi on 1/24/24.
//

import UIKit

public protocol GateProtocol {
    var solved: () -> Void { get set }
    var dismiss: () -> Void { get set }
}
