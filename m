From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v3 05/10] drm/exynos: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Sat,  4 Aug 2018 17:15:25 +0100
Message-ID: <20180804161530.12275-6-alexandru-cosmin.gheorghe@arm.com>
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
LgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWluLmdo
ZW9yZ2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3Bs
YW5lLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFu
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMKaW5kZXggZWI5
OTE1ZGE3ZGVjLi42ODEzMjhmYmU3ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9wbGFuZS5jCkBAIC0xMzksOCArMTM5LDcgQEAgc3RhdGljIHZvaWQgZXh5bm9zX2RybV9w
bGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKIAogCWV4eW5vc19zdGF0ZSA9IGt6
YWxsb2Moc2l6ZW9mKCpleHlub3Nfc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAlpZiAoZXh5bm9zX3N0
YXRlKSB7Ci0JCXBsYW5lLT5zdGF0ZSA9ICZleHlub3Nfc3RhdGUtPmJhc2U7Ci0JCXBsYW5lLT5z
dGF0ZS0+cGxhbmUgPSBwbGFuZTsKKwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChw
bGFuZSwgJmV4eW5vc19zdGF0ZS0+YmFzZSk7CiAJCXBsYW5lLT5zdGF0ZS0+enBvcyA9IGV4eW5v
c19wbGFuZS0+Y29uZmlnLT56cG9zOwogCX0KIH0KLS0gCjIuMTguMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
