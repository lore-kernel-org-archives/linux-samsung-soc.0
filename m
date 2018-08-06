From: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Subject: Re: [PATCH v3 06/10] drm/imx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 6 Aug 2018 09:53:22 +0100
Message-ID: <20180806085322.GA16672@e114479-lin.cambridge.arm.com>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-7-alexandru-cosmin.gheorghe@arm.com>
 <1533536953.4204.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1533536953.4204.3.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCBBdWcgMDYsIDIwMTggYXQgMDg6Mjk6MTNBTSArMDIwMCwgUGhpbGlwcCBaYWJlbCB3
cm90ZToKCkhpLAoKPiBIaSBBbGV4YW5kcnUsCj4gCj4gT24gU2F0LCAyMDE4LTA4LTA0IGF0IDE3
OjE1ICswMTAwLCBBbGV4YW5kcnUgR2hlb3JnaGUgd3JvdGU6Cj4gPiBBIG5ldyBoZWxwZXIgZnVu
Y3Rpb24oX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCkgaGFzIGJlZW4gYWRkZWQKPiA+
IGZvciBsaW5raW5nIGEgcGxhbmUgd2l0aCBpdHMgc3RhdGUgYW5kIHJlc2V0dGluZyB0aGUgY29y
ZQo+ID4gcHJvcGVydGllcyhhbHBoYSwgcm90YXRpb24sIGV0Yy4pIHRvIHRoZWlyIGRlZmF1bHQg
dmFsdWVzLgo+ID4gVXNlIHRoYXQgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgbG9naWMuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21p
bi5naGVvcmdoZUBhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2
My1wbGFuZS5jIHwgOCArKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLXBsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKPiA+
IGluZGV4IDIwM2YyNDdkNDg1NC4uMWJkNGRlMDNjZTllIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14
L2lwdXYzLXBsYW5lLmMKPiA+IEBAIC0yODEsMTYgKzI4MSwxNCBAQCBzdGF0aWMgdm9pZCBpcHVf
cGxhbmVfc3RhdGVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gPiAgCQlpcHVfc3Rh
dGUgPSB0b19pcHVfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiA+ICAJCV9fZHJtX2F0b21p
Y19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZShwbGFuZS0+c3RhdGUpOwo+ID4gIAkJa2ZyZWUo
aXB1X3N0YXRlKTsKPiA+ICsJCXBsYW5lLT5zdGF0ZSA9IE5VTEw7Cj4gPiAgCX0KPiA+ICAKPiA+
ICAJaXB1X3N0YXRlID0ga3phbGxvYyhzaXplb2YoKmlwdV9zdGF0ZSksIEdGUF9LRVJORUwpOwo+
ID4gIAo+ID4gLQlpZiAoaXB1X3N0YXRlKSB7Cj4gPiAtCQlpcHVfc3RhdGUtPmJhc2UucGxhbmUg
PSBwbGFuZTsKPiA+IC0JCWlwdV9zdGF0ZS0+YmFzZS5yb3RhdGlvbiA9IERSTV9NT0RFX1JPVEFU
RV8wOwo+ID4gLQl9Cj4gPiArCWlmIChpcHVfc3RhdGUpCj4gPiArCQlfX2RybV9hdG9taWNfaGVs
cGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmaXB1X3N0YXRlLT5iYXNlKTsKPiA+ICAKPiAKPiBDb3Vs
ZCB5b3UgcmVtb3ZlIHRoaXMgd2hpdGUgbGluZSBhcyB3ZWxsPwoKWWVzLCB3aWxsIGRvIGJlZm9y
ZSBhcHBseWluZy4KCgo+IAo+ID4gLQlwbGFuZS0+c3RhdGUgPSAmaXB1X3N0YXRlLT5iYXNlOwo+
ID4gIH0KPiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCj4gCj4gQWNr
ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gdG8gYmUg
bWVyZ2VkIHRocm91Z2ggZHJtLW1pc2MgdG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgY2hhbmdlcy4K
PiAKPiByZWdhcmRzCj4gUGhpbGlwcAoKLS0gCkNoZWVycywKQWxleCBHCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
