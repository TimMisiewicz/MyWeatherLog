import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  List<Liveweer>? liveweer;

  WeatherData({this.liveweer});

  WeatherData.fromJson(Map<String, dynamic> json) {
    if (json['liveweer'] != null) {
      liveweer = <Liveweer>[];
      json['liveweer'].forEach((v) {
        liveweer!.add(Liveweer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.liveweer != null) {
      data['liveweer'] = this.liveweer!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        liveweer?.elementAt(0).d0tmin,
        liveweer?.elementAt(0).plaats,
        liveweer?.elementAt(0).temp,
        liveweer?.elementAt(0).luchtd,
        liveweer?.elementAt(0).sunder,
        liveweer?.elementAt(0).sup
      ];
}

class Liveweer {
  String? plaats;
  String? temp;
  String? gtemp;
  String? samenv;
  String? lv;
  String? windr;
  String? windrgr;
  String? windms;
  String? winds;
  String? windk;
  String? windkmh;
  String? luchtd;
  String? ldmmhg;
  String? dauwp;
  String? zicht;
  String? verw;
  String? sup;
  String? sunder;
  String? image;
  String? d0weer;
  String? d0tmax;
  String? d0tmin;
  String? d0windk;
  String? d0windknp;
  String? d0windms;
  String? d0windkmh;
  String? d0windr;
  String? d0windrgr;
  String? d0neerslag;
  String? d0zon;
  String? d1weer;
  String? d1tmax;
  String? d1tmin;
  String? d1windk;
  String? d1windknp;
  String? d1windms;
  String? d1windkmh;
  String? d1windr;
  String? d1windrgr;
  String? d1neerslag;
  String? d1zon;
  String? d2weer;
  String? d2tmax;
  String? d2tmin;
  String? d2windk;
  String? d2windknp;
  String? d2windms;
  String? d2windkmh;
  String? d2windr;
  String? d2windrgr;
  String? d2neerslag;
  String? d2zon;
  String? alarm;
  String? alarmtxt;

  Liveweer(
      {this.plaats,
      this.temp,
      this.gtemp,
      this.samenv,
      this.lv,
      this.windr,
      this.windrgr,
      this.windms,
      this.winds,
      this.windk,
      this.windkmh,
      this.luchtd,
      this.ldmmhg,
      this.dauwp,
      this.zicht,
      this.verw,
      this.sup,
      this.sunder,
      this.image,
      this.d0weer,
      this.d0tmax,
      this.d0tmin,
      this.d0windk,
      this.d0windknp,
      this.d0windms,
      this.d0windkmh,
      this.d0windr,
      this.d0windrgr,
      this.d0neerslag,
      this.d0zon,
      this.d1weer,
      this.d1tmax,
      this.d1tmin,
      this.d1windk,
      this.d1windknp,
      this.d1windms,
      this.d1windkmh,
      this.d1windr,
      this.d1windrgr,
      this.d1neerslag,
      this.d1zon,
      this.d2weer,
      this.d2tmax,
      this.d2tmin,
      this.d2windk,
      this.d2windknp,
      this.d2windms,
      this.d2windkmh,
      this.d2windr,
      this.d2windrgr,
      this.d2neerslag,
      this.d2zon,
      this.alarm,
      this.alarmtxt});

  Liveweer.fromJson(Map<String, dynamic> json) {
    plaats = json['plaats'];
    temp = json['temp'];
    gtemp = json['gtemp'];
    samenv = json['samenv'];
    lv = json['lv'];
    windr = json['windr'];
    windrgr = json['windrgr'];
    windms = json['windms'];
    winds = json['winds'];
    windk = json['windk'];
    windkmh = json['windkmh'];
    luchtd = json['luchtd'];
    ldmmhg = json['ldmmhg'];
    dauwp = json['dauwp'];
    zicht = json['zicht'];
    verw = json['verw'];
    sup = json['sup'];
    sunder = json['sunder'];
    image = json['image'];
    d0weer = json['d0weer'];
    d0tmax = json['d0tmax'];
    d0tmin = json['d0tmin'];
    d0windk = json['d0windk'];
    d0windknp = json['d0windknp'];
    d0windms = json['d0windms'];
    d0windkmh = json['d0windkmh'];
    d0windr = json['d0windr'];
    d0windrgr = json['d0windrgr'];
    d0neerslag = json['d0neerslag'];
    d0zon = json['d0zon'];
    d1weer = json['d1weer'];
    d1tmax = json['d1tmax'];
    d1tmin = json['d1tmin'];
    d1windk = json['d1windk'];
    d1windknp = json['d1windknp'];
    d1windms = json['d1windms'];
    d1windkmh = json['d1windkmh'];
    d1windr = json['d1windr'];
    d1windrgr = json['d1windrgr'];
    d1neerslag = json['d1neerslag'];
    d1zon = json['d1zon'];
    d2weer = json['d2weer'];
    d2tmax = json['d2tmax'];
    d2tmin = json['d2tmin'];
    d2windk = json['d2windk'];
    d2windknp = json['d2windknp'];
    d2windms = json['d2windms'];
    d2windkmh = json['d2windkmh'];
    d2windr = json['d2windr'];
    d2windrgr = json['d2windrgr'];
    d2neerslag = json['d2neerslag'];
    d2zon = json['d2zon'];
    alarm = json['alarm'];
    alarmtxt = json['alarmtxt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plaats'] = this.plaats;
    data['temp'] = this.temp;
    data['gtemp'] = this.gtemp;
    data['samenv'] = this.samenv;
    data['lv'] = this.lv;
    data['windr'] = this.windr;
    data['windrgr'] = this.windrgr;
    data['windms'] = this.windms;
    data['winds'] = this.winds;
    data['windk'] = this.windk;
    data['windkmh'] = this.windkmh;
    data['luchtd'] = this.luchtd;
    data['ldmmhg'] = this.ldmmhg;
    data['dauwp'] = this.dauwp;
    data['zicht'] = this.zicht;
    data['verw'] = this.verw;
    data['sup'] = this.sup;
    data['sunder'] = this.sunder;
    data['image'] = this.image;
    data['d0weer'] = this.d0weer;
    data['d0tmax'] = this.d0tmax;
    data['d0tmin'] = this.d0tmin;
    data['d0windk'] = this.d0windk;
    data['d0windknp'] = this.d0windknp;
    data['d0windms'] = this.d0windms;
    data['d0windkmh'] = this.d0windkmh;
    data['d0windr'] = this.d0windr;
    data['d0windrgr'] = this.d0windrgr;
    data['d0neerslag'] = this.d0neerslag;
    data['d0zon'] = this.d0zon;
    data['d1weer'] = this.d1weer;
    data['d1tmax'] = this.d1tmax;
    data['d1tmin'] = this.d1tmin;
    data['d1windk'] = this.d1windk;
    data['d1windknp'] = this.d1windknp;
    data['d1windms'] = this.d1windms;
    data['d1windkmh'] = this.d1windkmh;
    data['d1windr'] = this.d1windr;
    data['d1windrgr'] = this.d1windrgr;
    data['d1neerslag'] = this.d1neerslag;
    data['d1zon'] = this.d1zon;
    data['d2weer'] = this.d2weer;
    data['d2tmax'] = this.d2tmax;
    data['d2tmin'] = this.d2tmin;
    data['d2windk'] = this.d2windk;
    data['d2windknp'] = this.d2windknp;
    data['d2windms'] = this.d2windms;
    data['d2windkmh'] = this.d2windkmh;
    data['d2windr'] = this.d2windr;
    data['d2windrgr'] = this.d2windrgr;
    data['d2neerslag'] = this.d2neerslag;
    data['d2zon'] = this.d2zon;
    data['alarm'] = this.alarm;
    data['alarmtxt'] = this.alarmtxt;
    return data;
  }
}
