From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 09/10] drm/vc4: Use __drm_atomic_helper_plane_reset instead of
 copying the logic
Date: Fri, 20 Jul 2018 22:15:08 +0100
Message-ID: <20180720211509.23605-10-alexandru-cosmin.gheorghe@arm.com>
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
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyB8IDQgKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9wbGFuZS5jCmluZGV4IDlkN2EzNmYxNDhjZi4uNjg4YWQ5YmIwZjA4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X3BsYW5lLmMKQEAgLTIwMCw5ICsyMDAsNyBAQCBzdGF0aWMgdm9pZCB2YzRfcGxh
bmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiAJaWYgKCF2YzRfc3RhdGUpCiAJCXJl
dHVybjsKIAotCXBsYW5lLT5zdGF0ZSA9ICZ2YzRfc3RhdGUtPmJhc2U7Ci0JcGxhbmUtPnN0YXRl
LT5hbHBoYSA9IERSTV9CTEVORF9BTFBIQV9PUEFRVUU7Ci0JdmM0X3N0YXRlLT5iYXNlLnBsYW5l
ID0gcGxhbmU7CisJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnZjNF9z
dGF0ZS0+YmFzZSk7CiB9CiAKIHN0YXRpYyB2b2lkIHZjNF9kbGlzdF93cml0ZShzdHJ1Y3QgdmM0
X3BsYW5lX3N0YXRlICp2YzRfc3RhdGUsIHUzMiB2YWwpCi0tIAoyLjE4LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
