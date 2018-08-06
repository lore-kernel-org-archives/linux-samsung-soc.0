From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 06/10] drm/imx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 06 Aug 2018 08:29:13 +0200
Message-ID: <1533536953.4204.3.camel@pengutronix.de>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-7-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180804161530.12275-7-alexandru-cosmin.gheorghe@arm.com>
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

SGkgQWxleGFuZHJ1LAoKT24gU2F0LCAyMDE4LTA4LTA0IGF0IDE3OjE1ICswMTAwLCBBbGV4YW5k
cnUgR2hlb3JnaGUgd3JvdGU6Cj4gQSBuZXcgaGVscGVyIGZ1bmN0aW9uKF9fZHJtX2F0b21pY19o
ZWxwZXJfcGxhbmVfcmVzZXQpIGhhcyBiZWVuIGFkZGVkCj4gZm9yIGxpbmtpbmcgYSBwbGFuZSB3
aXRoIGl0cyBzdGF0ZSBhbmQgcmVzZXR0aW5nIHRoZSBjb3JlCj4gcHJvcGVydGllcyhhbHBoYSwg
cm90YXRpb24sIGV0Yy4pIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzLgo+IFVzZSB0aGF0IGluc3Rl
YWQgb2YgZHVwbGljYXRpbmcgdGhlIGxvZ2ljLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgfCA4ICsrKy0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgv
aXB1djMtcGxhbmUuYwo+IGluZGV4IDIwM2YyNDdkNDg1NC4uMWJkNGRlMDNjZTllIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYwo+IEBAIC0yODEsMTYgKzI4MSwxNCBAQCBzdGF0aWMg
dm9pZCBpcHVfcGxhbmVfc3RhdGVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAkJ
aXB1X3N0YXRlID0gdG9faXB1X3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7Cj4gIAkJX19kcm1f
YXRvbWljX2hlbHBlcl9wbGFuZV9kZXN0cm95X3N0YXRlKHBsYW5lLT5zdGF0ZSk7Cj4gIAkJa2Zy
ZWUoaXB1X3N0YXRlKTsKPiArCQlwbGFuZS0+c3RhdGUgPSBOVUxMOwo+ICAJfQo+ICAKPiAgCWlw
dV9zdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCppcHVfc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAgCj4g
LQlpZiAoaXB1X3N0YXRlKSB7Cj4gLQkJaXB1X3N0YXRlLT5iYXNlLnBsYW5lID0gcGxhbmU7Cj4g
LQkJaXB1X3N0YXRlLT5iYXNlLnJvdGF0aW9uID0gRFJNX01PREVfUk9UQVRFXzA7Cj4gLQl9Cj4g
KwlpZiAoaXB1X3N0YXRlKQo+ICsJCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxh
bmUsICZpcHVfc3RhdGUtPmJhc2UpOwo+ICAKCkNvdWxkIHlvdSByZW1vdmUgdGhpcyB3aGl0ZSBs
aW5lIGFzIHdlbGw/Cgo+IC0JcGxhbmUtPnN0YXRlID0gJmlwdV9zdGF0ZS0+YmFzZTsKPiAgfQo+
ICAKPiAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgoKQWNrZWQtYnk6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cgp0byBiZSBtZXJnZWQgdGhyb3VnaCBkcm0t
bWlzYyB0b2dldGhlciB3aXRoIHRoZSBvdGhlciBjaGFuZ2VzLgoKcmVnYXJkcwpQaGlsaXBwCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
