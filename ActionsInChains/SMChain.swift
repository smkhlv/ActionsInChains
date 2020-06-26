//
//  SMChain.swift
//  ActionsInChains
//
//  Created by Sergey Mikhailov on 26.06.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import Foundation

protocol SMChainProtocol {
    
    init(actions: [SMAction], completion: @escaping SMCompletionBlock)
    func addToChain(action: SMAction)
    func start()
    func stop()
}

class SMChain: SMChainProtocol {
    
    private var actions: [SMAction]!
    private var completion: SMCompletionBlock?
    private var groupQueue: DispatchGroup?
    
    required init(actions: [SMAction], completion: @escaping () -> Void) {
        self.actions = actions
        self.completion = completion
    }
    
    func addToChain(action: SMAction) {
        self.actions.append(action)
    }
    
    func start() {
        groupQueue = DispatchGroup()
        
        for action in self.actions {
            if action.type == .main {
                
            }
        }
    }
    
    func stop() {
        
    }
    
    private func handleAction(action: SMAction) {
        
        switch action.type {
        case .main:
            groupQueue?.enter()
            DispatchQueue.main.asyncAfter(deadline: action.configurator.delay) {
                action.action(Error?.self as! Error)
            }
        default:
            groupQueue?.enter()
            DispatchQueue.global().asyncAfter(deadline: action.configurator.delay) {
                action.action(Error?.self as! Error)
            }
        }
    }
    
}
