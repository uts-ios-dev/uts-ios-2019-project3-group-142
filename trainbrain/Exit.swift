//
//  Exit.swift
//  trainbrain
//
//  Created by Imogen Thomson on 25/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import Foundation

enum ExitType : String {
    case elevator
    case escalator
    case gate // For platforms with exits level to street
    case ramp
    case stairs
}

struct Exit {
    let type : ExitType
    let carriageNumber : Int // 1 = front carriage of train; 8 = last carriage of train
    let doorNumber : Int // 1 = towards front of train; 2 = towards back of train
}
