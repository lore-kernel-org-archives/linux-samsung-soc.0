From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 06/10] drm/imx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 09:49:11 +0200
Message-ID: <1532418551.4078.3.camel@pengutronix.de>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-7-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-7-alexandru-cosmin.gheorghe@arm.com>
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

SGkgQWxleGFuZHJ1LAoKT24gRnJpLCAyMDE4LTA3LTIwIGF0IDIyOjE1ICswMTAwLCBBbGV4YW5k
cnUgR2hlb3JnaGUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxh
bGV4YW5kcnUtY29zbWluLmdoZW9yZ2hlQGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbXgvaXB1djMtcGxhbmUuYyB8IDggKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2lteC9pcHV2My1wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5j
Cj4gaW5kZXggMjAzZjI0N2Q0ODU0Li4xYmQ0ZGUwM2NlOWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My1wbGFuZS5jCj4gQEAgLTI4MSwxNiArMjgxLDE0IEBAIHN0YXRpYyB2b2lkIGlwdV9wbGFu
ZV9zdGF0ZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiAgCQlpcHVfc3RhdGUgPSB0
b19pcHVfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiAgCQlfX2RybV9hdG9taWNfaGVscGVy
X3BsYW5lX2Rlc3Ryb3lfc3RhdGUocGxhbmUtPnN0YXRlKTsKPiAgCQlrZnJlZShpcHVfc3RhdGUp
Owo+ICsJCXBsYW5lLT5zdGF0ZSA9IE5VTEw7CgpXaXRoIF9fZHJtX2F0b21pY19oZWxwZXJfcGxh
bmVfcmVzZXQgYXMtaXMsIHRoaXMgY291bGQgYmUgZHJvcHBlZCAuLi4KCj4gIAl9Cj4gIAo+ICAJ
aXB1X3N0YXRlID0ga3phbGxvYyhzaXplb2YoKmlwdV9zdGF0ZSksIEdGUF9LRVJORUwpOwo+ICAK
PiAtCWlmIChpcHVfc3RhdGUpIHsKPiAtCQlpcHVfc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFuZTsK
PiAtCQlpcHVfc3RhdGUtPmJhc2Uucm90YXRpb24gPSBEUk1fTU9ERV9ST1RBVEVfMDsKPiAtCX0K
PiArCWlmIChpcHVfc3RhdGUpCj4gKwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChw
bGFuZSwgJmlwdV9zdGF0ZS0+YmFzZSk7CgouLi4gaWYgdGhpcyBpcyBjaGFuZ2UgdG8ganVzdAoK
CV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZpcHVfc3RhdGUtPmJhc2Up
OwoKPiAgCj4gLQlwbGFuZS0+c3RhdGUgPSAmaXB1X3N0YXRlLT5iYXNlOwo+ICB9Cj4gIAo+ICBz
dGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
