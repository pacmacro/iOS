import Mapbox

class ViewController: UIViewController {
    
    var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the map view
        mapView = MGLMapView(frame: view.bounds, styleURL: NSURL(string: "mapbox://styles/ctrlshiftgo/cihfgoup600o2jnkx6dhzb3eh"))
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        // set the map's center coordinate
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 49.280915,
            longitude: -123.122352),
            zoomLevel: 15, animated: false)
        view.addSubview(mapView)
    }
    
}