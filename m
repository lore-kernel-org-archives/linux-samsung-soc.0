From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 06/10] drm/imx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 09:51:22 +0200
Message-ID: <1532418682.4078.5.camel@pengutronix.de>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-7-alexandru-cosmin.gheorghe@arm.com>
 <1532418551.4078.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1532418551.4078.3.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>, seanpaul@chromium.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, ville.syrjala@linux.intel.com, daniel@ffwll.ch, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, harry.wentland@amd.com, andrey.grodzovsky@amd.com, Tony.Cheng@amd.com, sunpeng.li@amd.com, shirish.s@amd.com, boris.brezillon@bootlin.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, maxime.ripard@bootlin.com, wens@csie.org, eric@anholt.net
Cc: nd@arm.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCAyMDE4LTA3LTI0IGF0IDA5OjQ5ICswMjAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+
IEhpIEFsZXhhbmRydSwKPiAKPiBPbiBGcmksIDIwMTgtMDctMjAgYXQgMjI6MTUgKzAxMDAsIEFs
ZXhhbmRydSBHaGVvcmdoZSB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVv
cmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jIHwgOCArKystLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLXBsYW5lLmMKPiA+IGluZGV4IDIwM2YyNDdkNDg1NC4uMWJkNGRlMDNjZTllIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKPiA+IEBAIC0yODEsMTYgKzI4MSwx
NCBAQCBzdGF0aWMgdm9pZCBpcHVfcGxhbmVfc3RhdGVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUpCj4gPiAgCQlpcHVfc3RhdGUgPSB0b19pcHVfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRl
KTsKPiA+ICAJCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZShwbGFuZS0+
c3RhdGUpOwo+ID4gIAkJa2ZyZWUoaXB1X3N0YXRlKTsKPiA+ICsJCXBsYW5lLT5zdGF0ZSA9IE5V
TEw7Cj4gCj4gV2l0aCBfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0IGFzLWlzLCB0aGlz
IGNvdWxkIGJlIGRyb3BwZWQgLi4uCj4gCj4gPiAgCX0KPiA+ICAKPiA+ICAJaXB1X3N0YXRlID0g
a3phbGxvYyhzaXplb2YoKmlwdV9zdGF0ZSksIEdGUF9LRVJORUwpOwo+ID4gIAo+ID4gLQlpZiAo
aXB1X3N0YXRlKSB7Cj4gPiAtCQlpcHVfc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFuZTsKPiA+IC0J
CWlwdV9zdGF0ZS0+YmFzZS5yb3RhdGlvbiA9IERSTV9NT0RFX1JPVEFURV8wOwo+ID4gLQl9Cj4g
PiArCWlmIChpcHVfc3RhdGUpCj4gPiArCQlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0
KHBsYW5lLCAmaXB1X3N0YXRlLT5iYXNlKTsKPiAKPiAuLi4gaWYgdGhpcyBpcyBjaGFuZ2UgdG8g
anVzdAo+IAo+IAlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmaXB1X3N0
YXRlLT5iYXNlKTsKCkV1aCwgb2J2aW91c2x5IHRoYXQgd29uJ3QgYmUgcG9zc2libGUsIHNvcnJ5
IGZvciB0aGUgbm9pc2UuCkkgYmxhbWUgdGhlIGhlYXQuCgpyZWdhcmRzClBoaWxpcHAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
