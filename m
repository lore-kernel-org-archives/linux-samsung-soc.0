From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v3 08/10] drm/sun4i: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Sat,  4 Aug 2018 17:15:28 +0100
Message-ID: <20180804161530.12275-9-alexandru-cosmin.gheorghe@arm.com>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: seanpaul@chromium.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, ville.syrjala@linux.intel.com, daniel@ffwll.ch, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, harry.wentland@amd.com, andrey.grodzovsky@amd.com, Tony.Cheng@amd.com, sunpeng.li@amd.com, shirish.s@amd.com, boris.brezillon@bootlin.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com, maxime.ripard@bootlin.com, wens@csie.org, eric@anholt.net, linux-graphics-maintainer@vmware.com, syeh@
Cc: nd@arm.com, Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

QSBuZXcgaGVscGVyIGZ1bmN0aW9uKF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQpIGhh
cyBiZWVuIGFkZGVkCmZvciBsaW5raW5nIGEgcGxhbmUgd2l0aCBpdHMgc3RhdGUgYW5kIHJlc2V0
dGluZyB0aGUgY29yZQpwcm9wZXJ0aWVzKGFscGhhLCByb3RhdGlvbiwgZXRjLikgdG8gdGhlaXIg
ZGVmYXVsdCB2YWx1ZXMuClVzZSB0aGF0IGluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlIGxvZ2lj
LgoKX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCBpbml0aWFsaXplcyB0aGUgYWxwaGEg
cHJvcGVydHkgdG8gaXRzCm1heCB2YWx1ZSwgd2hpY2ggaXMgZGVmaW5lZCBieSB0aGUgZHJtIGNv
cmUgYXMgRFJNX0JMRU5EX0FMUEhBX09QQVFVRSwKc28gbm90aGluZyBjaGFuZ2VzIHJlZ2FyZGlu
ZyB0aGUgYWxwaGEgdmFsdWUuCgpBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5k
cnUtY29zbWluLmdoZW9yZ2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX2xheWVyLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbGF5
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9sYXllci5jCmluZGV4IDc1MGFkMjRk
ZTFkNy4uNzhmNzdhZjg4MDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfbGF5ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbGF5ZXIuYwpAQCAt
MzUsOSArMzUsNyBAQCBzdGF0aWMgdm9pZCBzdW40aV9iYWNrZW5kX2xheWVyX3Jlc2V0KHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lKQogCiAJc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBH
RlBfS0VSTkVMKTsKIAlpZiAoc3RhdGUpIHsKLQkJcGxhbmUtPnN0YXRlID0gJnN0YXRlLT5zdGF0
ZTsKLQkJcGxhbmUtPnN0YXRlLT5wbGFuZSA9IHBsYW5lOwotCQlwbGFuZS0+c3RhdGUtPmFscGhh
ID0gRFJNX0JMRU5EX0FMUEhBX09QQVFVRTsKKwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9y
ZXNldChwbGFuZSwgJnN0YXRlLT5zdGF0ZSk7CiAJCXBsYW5lLT5zdGF0ZS0+enBvcyA9IGxheWVy
LT5pZDsKIAl9CiB9Ci0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
