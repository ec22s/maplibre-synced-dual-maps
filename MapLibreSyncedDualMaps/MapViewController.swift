import MapLibre

class MapViewController: UIViewController, MLNMapViewDelegate {
    let buttonStackView = UIStackView()
    let mapStackView = UIStackView()
    var mapViews = [MLNMapView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupMaps()
        setupButtons()
    }
    
    override func viewDidLayoutSubviews()
    {
       super.viewDidLayoutSubviews()
       DispatchQueue.main.async {
           if self.view.frame.height > self.view.frame.width {
               self.mapStackView.axis = .vertical
               self.buttonStackView.axis = .horizontal
           } else {
               self.mapStackView.axis = .horizontal
               self.buttonStackView.axis = .vertical
           }
       }
    }

    func mapView(_ mapView: MLNMapView, regionDidChangeAnimated animated: Bool) {
        syncPositionFromMapView(mapView)
    }

    func mapView(_: MLNMapView, didFinishLoading style: MLNStyle) {
        /// Do nothing so far.
    }
    
    private func setupButtons() {
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.spacing = ZOOM_BUTTON_DELIM_WIDTH
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        let buttonZoomIn = createButton(imageName: "plus", param: 1)
        let buttonZoomOut = createButton(imageName: "minus", param: -1)
        for btn in [buttonZoomIn, buttonZoomOut] {
            buttonStackView.addArrangedSubview(btn)
            NSLayoutConstraint.activate([
                btn.heightAnchor.constraint(equalToConstant: ZOOM_BUTTON_SIZE),
                btn.widthAnchor.constraint(equalToConstant: ZOOM_BUTTON_SIZE)
            ])
        }
    }

    private func createButton(imageName: String, param: Double) -> UIButton {
        let button = UIButton(frame: .zero, primaryAction: UIAction { _ in
            for mapView in self.mapViews {
                mapView.zoomLevel = mapView.zoomLevel + param
            }
        })

        var bgConf = UIBackgroundConfiguration.clear()
        bgConf.strokeColor = MAPS_DELIM_COLOR
        bgConf.strokeWidth = MAPS_DELIM_WIDTH

        var btnConf = UIButton.Configuration.filled()
        btnConf.background = bgConf
        btnConf.baseBackgroundColor = ZOOM_BUTTON_BACKGROUND
        btnConf.baseForegroundColor = ZOOM_BUTTON_FOREGROUND
        btnConf.image = UIImage(systemName: imageName)

        button.configuration = btnConf
        return button
    }
    
    private func setupMaps() {
        for i in 0 ..< MAP_STYLES.count {
            let mapView = MLNMapView(frame: view.bounds, styleURL: URL(string: MAP_STYLES[i]))
            mapView.allowsRotating = false
            mapView.allowsTilting = false
            mapView.showsUserLocation = false
            mapView.setCenter(INIT_CENTER, zoomLevel: INIT_ZOOM, animated: MAPS_ANIMATED)
            mapView.delegate = self
            mapStackView.addArrangedSubview(mapView)
            mapViews.append(mapView)
        }
    }

    private func setupStackView() {
        mapStackView.distribution = .fillEqually
        mapStackView.translatesAutoresizingMaskIntoConstraints = false
        mapStackView.backgroundColor = MAPS_DELIM_COLOR
        mapStackView.spacing = MAPS_DELIM_WIDTH
        view.addSubview(mapStackView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mapStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mapStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mapStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            mapStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
    }
    
    private func syncPositionFromMapView(_ mv: MLNMapView) {
        for mapView in mapViews {
            if ObjectIdentifier(mapView) == ObjectIdentifier(mv) { continue }
            mapView.setCenter(mv.centerCoordinate, zoomLevel: mv.zoomLevel, animated: MAPS_ANIMATED)
        }
    }
}
