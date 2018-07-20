From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 06/10] drm/imx: Use __drm_atomic_helper_plane_reset instead of
 copying the logic
Date: Fri, 20 Jul 2018 22:15:05 +0100
Message-ID: <20180720211509.23605-7-alexandru-cosmin.gheorghe@arm.com>
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
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jIHwgOCAr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKaW5kZXggMjAzZjI0N2Q0ODU0Li4xYmQ0ZGUwM2Nl
OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKQEAgLTI4MSwxNiArMjgxLDE0IEBAIHN0
YXRpYyB2b2lkIGlwdV9wbGFuZV9zdGF0ZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkK
IAkJaXB1X3N0YXRlID0gdG9faXB1X3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7CiAJCV9fZHJt
X2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZShwbGFuZS0+c3RhdGUpOwogCQlrZnJl
ZShpcHVfc3RhdGUpOworCQlwbGFuZS0+c3RhdGUgPSBOVUxMOwogCX0KIAogCWlwdV9zdGF0ZSA9
IGt6YWxsb2Moc2l6ZW9mKCppcHVfc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAotCWlmIChpcHVfc3Rh
dGUpIHsKLQkJaXB1X3N0YXRlLT5iYXNlLnBsYW5lID0gcGxhbmU7Ci0JCWlwdV9zdGF0ZS0+YmFz
ZS5yb3RhdGlvbiA9IERSTV9NT0RFX1JPVEFURV8wOwotCX0KKwlpZiAoaXB1X3N0YXRlKQorCQlf
X2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmaXB1X3N0YXRlLT5iYXNlKTsK
IAotCXBsYW5lLT5zdGF0ZSA9ICZpcHVfc3RhdGUtPmJhc2U7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICoKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
