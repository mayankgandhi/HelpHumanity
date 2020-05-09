//
//  File.swift
//  HelpHumanity
//
//  Created by Mayank on 09/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    @Published var organisations:[Organisation] = []
}
