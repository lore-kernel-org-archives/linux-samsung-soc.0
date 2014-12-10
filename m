From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC 00/15] Resource tracking/allocation framework
Date: Wed, 10 Dec 2014 17:39:18 +0000
Message-ID: <20141210173918.GN11285@n2100.arm.linux.org.uk>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <20141210161620.GM11285@n2100.arm.linux.org.uk>
 <CA+tnuKYSDZ0mtzQ_g1QjovJwG01OgPjSXuozEBXQsEZv_2o-=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CA+tnuKYSDZ0mtzQ_g1QjovJwG01OgPjSXuozEBXQsEZv_2o-=w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: A H <andrzej.hajda@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Kishon Vijay Abraham I <kishon@ti.com>, Andrzej Hajda <a.hajda@samsung.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkLCBEZWMgMTAsIDIwMTQgYXQgMDY6MjM6NDlQTSArMDEwMCwgQSBIIHdyb3RlOgo+IDEw
IGdydSAyMDE0IDE3OjE2ICJSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgiIDxsaW51eEBhcm0ubGlu
dXgub3JnLnVrPgo+IG5hcGlzYcWCKGEpOgo+ID4KPiA+IE9uIFdlZCwgRGVjIDEwLCAyMDE0IGF0
IDA0OjQ4OjE4UE0gKzAxMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gPiA+IDMuIFRoZXJlIGFy
ZSBkcml2ZXJzIHdoaWNoIGNhbiB3b3JrIHdpdGhvdXQgc3BlY2lmaWMgcmVzb3VyY2UsIGJ1dCBp
Zgo+ID4gPiAgIHRoZSByZXNvdXJjZSBiZWNvbWVzIGF2YWlsYWJsZS91bmF2YWlsYWJsZSBpdCBj
YW4gZG8gc29tZSBhZGRpdGlvbmFsCj4gc3R1ZmYuCj4gPiA+ICAgQW4gZXhhbXBsZSBvZiBzdWNo
IGRyaXZlciBpcyBEUk0gZHJpdmVyIChtb3JlIHByZWNpc2VseQo+IGRybV9jb25uZWN0b3IpIC0K
PiA+ID4gICBpdCBjYW4gc3RhcnQgd2l0aG91dCBhdHRhY2hlZCBkcm1fcGFuZWwsIGJ1dCBpZiB0
aGUgcGFuZWwgYmVjb21lcwo+IGF2YWlsYWJsZSBpdAo+ID4gPiAgIGNhbiByZWFjdCBieSBnZW5l
cmF0aW5nIEhQRCBldmVudCBhbmQgc3RhcnQgdXNpbmcgaXQuCj4gPgo+ID4gQmFkIGV4YW1wbGUs
IGFuZCBhY3R1YWxseSBpbmNvcnJlY3QuICBEUk0gY29ubmVjdG9ycyBhcmUgcmVmZXJlbmNlZCBp
bgo+ID4gdXNlcnNwYWNlIGJ5IGFuIElEUiBudW1iZXIsIHdoaWNoIGNhbiBiZSByZS11c2VkIGlu
IHRoZSBjYXNlIG9mIGEKPiA+IGNvbm5lY3RvciBhcHBlYXJpbmcsIGRpc2FwcGVhcmluZywgYW5k
IHRoZW4gYSBkaWZmZXJlbnQgY29ubmVjdG9yCj4gPiByZS1hcHBlYXJpbmcuCj4gCj4gQnV0IGl0
IGlzIG5vdCBhYm91dCByZWFwcGVhcmluZyBvZiBkcm1fY29ubmVjdG9yLCBpdCBpcyBhYm91dCBy
ZWFwcGVhcmluZwo+IG9mIGRybV9wYW5lbCB3aGljaCBpcyBmb3J0dW5hdGVseSBub3QgYSBwYXJ0
IG9mIGRybSBkcml2ZXIuIENvbm5lY3RvciBoZXJlCj4gaXMgb25seSBjb25zdW1lciBvZiBkcm1f
cGFuZWwgd2hpY2ggc2hvdWxkIGhhdmUgcG9zc2liaWxpdHkgdG8gcmVjZWl2ZQo+IG5vdGlmaWNh
dGlvbnMgb24gcGFuZWwgKGRpcy0pYXBwZWFyYW5jZS4KCk9rYXksIHNvIHRoYXQncyBleGFjdGx5
IGxpa2UgYSBwYW5lbCBiZWluZyAiaG90cGx1Z2dlZCIgdG8gdGhlIGNvbm5lY3RvciwKd2hpY2gg
c2hvdWxkIGJlIGZpbmUuCgotLSAKRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZTogY3Vy
cmVudGx5IGF0IDkuNU1icHMgZG93biA0MDBrYnBzIHVwCmFjY29yZGluZyB0byBzcGVlZHRlc3Qu
bmV0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
