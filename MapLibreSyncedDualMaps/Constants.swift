import CoreLocation
import UIKit

let INIT_CENTER = CLLocationCoordinate2D(latitude: 40, longitude: 140)
let INIT_ZOOM: Double = 3
let MAPS_ANIMATED: Bool = false
let MAPS_DELIM_COLOR = UIColor.gray
let MAPS_DELIM_WIDTH: Double = 1
let MAP_STYLES: [String] = [
    "https://tiles.versatiles.org/assets/styles/colorful.json",
    "https://americanamap.org/style.json",
]
let ZOOM_BUTTON_DELIM_WIDTH: Double = 8
let ZOOM_BUTTON_BACKGROUND = UIColor.white
let ZOOM_BUTTON_FOREGROUND = UIColor.gray
let ZOOM_BUTTON_SIZE: Double = 32
