From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset instead
 of copying the logic
Date: Fri, 20 Jul 2018 22:15:09 +0100
Message-ID: <20180720211509.23605-11-alexandru-cosmin.gheorghe@arm.com>
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
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgfCA0
ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCmluZGV4IDQ2NjMzNmIzNGZmZi4uMWUwZmIzYzc5
YjUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwpAQCAtNzIwLDkgKzcyMCw3IEBA
IHZvaWQgdm13X2R1X3BsYW5lX3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogCQlyZXR1
cm47CiAJfQogCi0JcGxhbmUtPnN0YXRlID0gJnZwcy0+YmFzZTsKLQlwbGFuZS0+c3RhdGUtPnBs
YW5lID0gcGxhbmU7Ci0JcGxhbmUtPnN0YXRlLT5yb3RhdGlvbiA9IERSTV9NT0RFX1JPVEFURV8w
OworCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZ2cHMtPmJhc2UpOwog
fQogCiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
