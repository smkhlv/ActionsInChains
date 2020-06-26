//
//  SMAction.swift
//  ActionsInChains
//
//  Created by Sergey Mikhailov on 26.06.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import Foundation

enum SMThreadType {
    case main
    case background
}

public typealias SMActionBlock = (Error) -> Void
public typealias SMCompletionBlock = () -> Void

protocol SMActionProtocol {
    
    var type: SMThreadType! { get set }
    var action: SMActionBlock! { get set }
    var configurator: SMActionConfigurator! { get set }
    var completion: SMCompletionBlock! { get set }
    init(type: SMThreadType, action: SMActionBlock, configurator: SMActionConfigurator, completion: SMCompletionBlock)
}

class SMAction: SMActionProtocol {
    var type: SMThreadType!
    
    var action: SMActionBlock!
    
    var configurator: SMActionConfigurator!
    
    var completion: SMCompletionBlock!

    
    required init(type: SMThreadType, action: (Error) -> Void, configurator: SMActionConfigurator, completion: () -> Void) {
        
    }
    
}
