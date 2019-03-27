From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 08/21] drm/exynos: Use drm_fb_helper_fill_info
Date: Thu, 28 Mar 2019 07:57:54 +0900
Message-ID: <901dcf5b-4549-8cf9-4dd0-569cb4642cfa@samsung.com>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
 <CGME20190326132028epcas5p1b29ce1824f06a686d8b4182ed1b170ed@epcas5p1.samsung.com>
 <20190326132008.11781-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-8-daniel.vetter@ffwll.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc@vger.kernel.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

CgoxOS4gMy4gMjYuIOyYpO2bhCAxMDoxOeyXkCBEYW5pZWwgVmV0dGVyIOydtCjqsIApIOyTtCDq
uIA6Cj4gVGhpcyB3aWxsIGdpdmUgdGhlIGV4eW5vcyBmYmRldiBhIG5hbWUhCj4gCj4gdjI6IFJl
YmFzZQo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgoKQWNrZWQtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClRoYW5r
cywKSW5raSBEYWUKCj4gQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBDYzog
Sm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgo+IENjOiBTZXVuZy1Xb28g
S2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21p
bi5wYXJrQHNhbXN1bmcuY29tPgo+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+
IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Zi
ZGV2LmMgfCA0ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCj4g
aW5kZXggYzMwZGQ4OGNkYjI1Li41ODFhNmEyMDc5OTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYwo+IEBAIC04NywxMSArODcsOSBAQCBzdGF0aWMgaW50
IGV4eW5vc19kcm1fZmJkZXZfdXBkYXRlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCj4g
IAkJcmV0dXJuIFBUUl9FUlIoZmJpKTsKPiAgCX0KPiAgCj4gLQlmYmktPnBhciA9IGhlbHBlcjsK
PiAgCWZiaS0+ZmJvcHMgPSAmZXh5bm9zX2RybV9mYl9vcHM7Cj4gIAo+IC0JZHJtX2ZiX2hlbHBl
cl9maWxsX2ZpeChmYmksIGZiLT5waXRjaGVzWzBdLCBmYi0+Zm9ybWF0LT5kZXB0aCk7Cj4gLQlk
cm1fZmJfaGVscGVyX2ZpbGxfdmFyKGZiaSwgaGVscGVyLCBzaXplcy0+ZmJfd2lkdGgsIHNpemVz
LT5mYl9oZWlnaHQpOwo+ICsJZHJtX2ZiX2hlbHBlcl9maWxsX2luZm8oZmJpLCBoZWxwZXIsIHNp
emVzKTsKPiAgCj4gIAlucl9wYWdlcyA9IGV4eW5vc19nZW0tPnNpemUgPj4gUEFHRV9TSElGVDsK
PiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
