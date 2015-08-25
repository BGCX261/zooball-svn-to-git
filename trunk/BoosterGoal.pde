public class BoosterGoal extends Booster
{
  Vector2D center;
  Vector2D size;
  double radiusSquared;
  
  public BoosterGoal( double x, double y, double width, double height, Vector2D force ) {
    super( force );
    center = new Vector2D( x, y );
    size = new Vector2D( width, height );
    radiusSquared = width * width * 0.25 + height * height * 0.25;
    Vector2D[] points = new Vector2D[4];
    Vector2D v = Vector2D.scale( size, 0.5 );
    // Points are clockwise
    points[0] = new Vector2D( center.x - v.x, center.y - v.y );
    points[1] = new Vector2D( center.x + v.x, center.y - v.y );
    points[2] = new Vector2D( center.x + v.x, center.y + v.y );
    points[3] = new Vector2D( center.x - v.x, center.y + v.y );
    setPoints( points );
  }
  
  public boolean contains( Vector2D p ) {
    c = color( 0, 0, 255 );
    if ( radiusSquared < Vector2D.sub( center, p ).magnitudeSquared( ) ) return false;
    return super.contains( p );
  }
  
  public void drawDebug( ) {
    super.drawDebug( );
    // DEBUG
    fill( 255 );
    ellipse( (float)center.x, (float)center.y, 5, 5 );
    fill( 0, 0 );
    stroke( 255 );
    float diameter = (float)Math.sqrt( radiusSquared ) * 2;
    ellipse( (float)center.x, (float)center.y, diameter, diameter );
    stroke( 255, 0, 0 );
    line( (float)center.x, (float)center.y, (float)(center.x + force.x * 0.25), (float)(center.y + force.y * 0.25) );
    noStroke( );
    // END DEBUG
  }
}
