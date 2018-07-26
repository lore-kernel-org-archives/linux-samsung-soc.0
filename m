From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v2 04/10] drm: atmel-hlcdc: Use
 __drm_atomic_helper_plane_reset instead of copying the logic
Date: Thu, 26 Jul 2018 17:17:50 +0100
Message-ID: <20180726161756.1794-5-alexandru-cosmin.gheorghe@arm.com>
References: <20180726161756.1794-1-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180726161756.1794-1-alexandru-cosmin.gheorghe@arm.com>
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
ZyB0aGUgYWxwaGEgdmFsdWUuCgpBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxl
eGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hdG1l
bC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKaW5kZXggMDQ0NDAwNjRiOWI3Li45MzMwYTA3NmUx
NWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19w
bGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFu
ZS5jCkBAIC05NDIsMTAgKzk0Miw3IEBAIHN0YXRpYyB2b2lkIGF0bWVsX2hsY2RjX3BsYW5lX3Jl
c2V0KHN0cnVjdCBkcm1fcGxhbmUgKnApCiAJCQkJIkZhaWxlZCB0byBhbGxvY2F0ZSBpbml0aWFs
IHBsYW5lIHN0YXRlXG4iKTsKIAkJCXJldHVybjsKIAkJfQotCi0JCXAtPnN0YXRlID0gJnN0YXRl
LT5iYXNlOwotCQlwLT5zdGF0ZS0+YWxwaGEgPSBEUk1fQkxFTkRfQUxQSEFfT1BBUVVFOwotCQlw
LT5zdGF0ZS0+cGxhbmUgPSBwOworCQlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHAs
ICZzdGF0ZS0+YmFzZSk7CiAJfQogfQogCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
