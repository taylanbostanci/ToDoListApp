//
//  DateFormatExt.swift
//  denemeler
//
//  Created by Taylan Bostanci on 28.08.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import Foundation
var dateFormatter : DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "dd MMM yyyy"
      formatter.locale = Locale(identifier: "tr_TR")
      return formatter
  }

