//
//  RubberBandDemo.swift
//  Demos
//
//  Created by Agustín de Cabrera on 25/5/2022.
//  Copyright © 2022 Agustín de Cabrera. All rights reserved.
//

import UIKit
import FittedSheets

class RubberBandDemo: SimpleDemo {
    override class var name: String { "Rubber Band" }

    override class func openDemo(from parent: UIViewController, in view: UIView?) {
        let useInlineMode = view != nil

        let controller = ColorDemo()

        var options = SheetOptions()
        options.useInlineMode = useInlineMode
        options.useRubberBandEffect = true
        options.rubberBandDamping = 0.0

        let sheet = SheetViewController(
            controller: controller,
            sizes: [.fixed(150), .fixed(350)],
            options: options)
        sheet.allowPullingPastMaxHeight = false
        sheet.allowPullingPastMinHeight = false

        addSheetEventLogging(to: sheet)

        if let view = view {
            sheet.animateIn(to: view, in: parent)
        } else {
            parent.present(sheet, animated: true, completion: nil)
        }
    }
}
