import Mapbox

class ViewController: UIViewController {
    //Controller for the mapview, i haven't renamed this since it would break a bunch of other elements
    
    var mapView: MGLMapView!
    
    //Information

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
        
        //Drawing overlay
        drawBoundingRect()
    }
    func drawBoundingRect(){
        //Setup center location
        let vanLat = 49.280915
        let vanLon = -123.122352
        //Setting up coordinates
        var coords: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2DMake(vanLat, vanLon),
            CLLocationCoordinate2DMake(vanLat, vanLon + 0.002),
            CLLocationCoordinate2DMake(vanLat - 0.002, vanLon + 0.002),
            CLLocationCoordinate2DMake(vanLat - 0.002, vanLon)
        ]
        //Building Overlay
        let tmpOverlay = MGLPolygon(coordinates: &coords, count: UInt(coords.count))
        //Adding the overlay to the map
        mapView.addAnnotation(tmpOverlay)
    }
    func mapView(mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat{
        return 0.5
    }
    func mapView(mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor.whiteColor()
    }
    
}