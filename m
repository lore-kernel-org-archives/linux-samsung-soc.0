From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 08/10] drm/sun4i: Use __drm_atomic_helper_plane_reset instead
 of copying the logic
Date: Fri, 20 Jul 2018 22:15:07 +0100
Message-ID: <20180720211509.23605-9-alexandru-cosmin.gheorghe@arm.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
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

U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWluLmdoZW9y
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2xheWVyLmMgfCA0
ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbGF5ZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV9sYXllci5jCmluZGV4IDc1MGFkMjRkZTFkNy4uNzhmNzdhZjg4
MDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbGF5ZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbGF5ZXIuYwpAQCAtMzUsOSArMzUsNyBAQCBz
dGF0aWMgdm9pZCBzdW40aV9iYWNrZW5kX2xheWVyX3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lKQogCiAJc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAlp
ZiAoc3RhdGUpIHsKLQkJcGxhbmUtPnN0YXRlID0gJnN0YXRlLT5zdGF0ZTsKLQkJcGxhbmUtPnN0
YXRlLT5wbGFuZSA9IHBsYW5lOwotCQlwbGFuZS0+c3RhdGUtPmFscGhhID0gRFJNX0JMRU5EX0FM
UEhBX09QQVFVRTsKKwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0
YXRlLT5zdGF0ZSk7CiAJCXBsYW5lLT5zdGF0ZS0+enBvcyA9IGxheWVyLT5pZDsKIAl9CiB9Ci0t
IAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
