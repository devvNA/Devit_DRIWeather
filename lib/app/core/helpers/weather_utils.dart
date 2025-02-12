class WeatherUtils {
  static String getCondition(int code) {
    switch (code) {
      case 1000:
        return 'Clear, Sunny';
      case 1100:
        return 'Mostly Clear';
      case 1101:
        return 'Partly Cloudy';
      case 1102:
        return 'Mostly Cloudy';
      case 1001:
        return 'Cloudy';
      case 2000 || 2100:
        return 'Fog';
      case 4000:
        return 'Drizzle';
      case 4001:
        return 'Rain';
      case 4200:
        return 'Light Rain';
      case 4201:
        return 'Heavy Rain';
      case 8000:
        return 'Thunderstorm';
      default:
        return 'Unknown';
    }
  }

  static String getLargeIconAsset(int code) {
    switch (code) {
      case 1000:
        return 'assets/images/10000_clear_large@2x.png';
      case 1100:
        return 'assets/images/11000_mostly_clear_large@2x.png';
      case 1101:
        return 'assets/images/11010_partly_cloudy_large@2x.png';
      case 1102:
        return 'assets/images/11020_mostly_cloudy_large@2x.png';
      case 1001:
        return 'assets/images/10010_cloudy_large@2x.png';
      case 2000 || 2100:
        return 'assets/images/20000_fog_large@2x.png';
      case 4000:
        return 'assets/images/40000_drizzle_large@2x.png';
      case 4001:
        return 'assets/images/40010_rain_large@2x.png';
      case 4200:
        return 'assets/images/40000_drizzle_large@2x.png';
      case 4201:
        return 'assets/images/40010_rain_large@2x.png';
      case 8000:
        return 'assets/images/80000_tstorm_large@2x.png';
      default:
        return 'assets/unknown.png';
    }
  }

  static String getSmallIconAsset(int code) {
    switch (code) {
      case 1000:
        return 'assets/images/10000_clear_large.png';
      case 1100:
        return 'assets/images/11000_mostly_clear_large.png';
      case 1101:
        return 'assets/images/11010_partly_cloudy_large.png';
      case 1102:
        return 'assets/images/11020_mostly_cloudy_large.png';
      case 1001:
        return 'assets/images/10010_cloudy_large.png';
      case 2000 || 2100:
        return 'assets/images/20000_fog_large.png';
      case 4000:
        return 'assets/images/40000_drizzle_large.png';
      case 4001:
        return 'assets/images/40010_rain_large.png';
      case 4200:
        return 'assets/images/40000_drizzle_large.png';
      case 4201:
        return 'assets/images/40010_rain_large.png';
      case 8000:
        return 'assets/images/80000_tstorm_large.png';
      default:
        return 'assets/unknown.png';
    }
  }
}
