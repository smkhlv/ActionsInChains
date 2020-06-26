//
//  SMActionConfigurator.swift
//  ActionsInChains
//
//  Created by Sergey Mikhailov on 26.06.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import Foundation

protocol SMActionConfigurator {
    var delay: DispatchTime { get set }
    var skipToNext: Bool { get set }
}
