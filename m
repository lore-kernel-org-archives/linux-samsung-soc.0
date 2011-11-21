From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
Date: Mon, 21 Nov 2011 11:57:17 +0000 (GMT)
Message-ID: <33510089.42761321876635907.JavaMail.weblogic@epv6ml08>
Reply-To: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
MIME-version: 1.0
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-l3A5Bk7waGM@public.gmane.org" <gregkh-l3A5Bk7waGM@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yulgon Kim <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shim Joonyoung <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtIIFttYWlsdG86Z3Jl
Z0Brcm9haC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTgsIDIwMTEgNDoxMiBBTQ0K
PiBUbzogSmluZ29vIEhhbg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1zYW1zdW5nLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmc7IGdyZWdraEBzdXNlLmRlOw0KPiBzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1
OyBrZ2VuZS5raW1Ac2Ftc3VuZy5jb207IHl1bGdvbi5raW1Ac2Ftc3VuZy5jb207DQo+IGp5MDky
Mi5zaGltQHNhbXN1bmcuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8zXSBTdXBwb3J0IFNh
bXN1bmcgUzVQIE9IQ0kgZGV2aWNlIGFuZCBkcml2ZXINCj4gDQo+IE9uIFR1ZSwgTm92IDE1LCAy
MDExIGF0IDA2OjQ5OjU4QU0gKzAwMDAsIEppbmdvbyBIYW4gd3JvdGU6DQo+ID4gSGVsbG8uDQo+
ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIFVTQiBPSENJIGRldmljZSBhbmQgaW5pdGlh
bCBkcml2ZXIgZm9yIFNhbXN1bmcNCj4gPiBTNVAgU29DcyBhbmQgaXMgYmFzZWQgZnJvbSBMaW51
eCAzLjItcmMxLiBJIGhhdmUgdGVzdGVkIG9uIFNNREtWMzEwDQo+IGJvYXJkDQo+ID4gdXNpbmcg
RVhZTk9TNC4NCj4gDQo+IFRoaXMgaXMgdG8gYmUgc2VudCB0aHJvdWdoIHNvbWUgYXJtIHRyZWUs
IG5vdCB0aGUgdXNiIHRyZWUsIHJpZ2h0Pw0KUmlnaHQsIDFzdCBhbmQgMm5kIHBhdGNoIGFyZSBz
ZW50IHRocm91Z2h0IGFybSB0cmVlLg0KSG93ZXZlciwgM3JkIHBhdGNoIGlzIHNlbnQgdGhyb3Vn
aCB0aGUgdXNiIHRyZWUuDQpUaGFua3MuDQpbUEFUQ0ggMS8zXSBBUk06IFNBTVNVTkc6IEFkZCBV
U0IgT0hDSSBkZXZpY2UNCltQQVRDSCAyLzNdICBBUk06IEVYWU5PUzogQWRkIFVTQiBPSENJIHN1
cHBvcnQgdG8gU01ES1YzMTAgYm9hcmQNCltQQVRDSCAzLzNdIFVTQjogQWRkIFM1UCBPSENJIGRp
dmVyDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0K


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
