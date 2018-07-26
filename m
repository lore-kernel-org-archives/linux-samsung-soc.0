From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v2 08/10] drm/sun4i: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Thu, 26 Jul 2018 17:17:54 +0100
Message-ID: <20180726161756.1794-9-alexandru-cosmin.gheorghe@arm.com>
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
ZyB0aGUgYWxwaGEgdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgR2hlb3JnaGUgPGFs
ZXhhbmRydS1jb3NtaW4uZ2hlb3JnaGVAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfbGF5ZXIuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40
aV9sYXllci5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2xheWVyLmMKaW5kZXggNzUw
YWQyNGRlMWQ3Li43OGY3N2FmODgwNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV9sYXllci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9sYXllci5j
CkBAIC0zNSw5ICszNSw3IEBAIHN0YXRpYyB2b2lkIHN1bjRpX2JhY2tlbmRfbGF5ZXJfcmVzZXQo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiAKIAlzdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpzdGF0
ZSksIEdGUF9LRVJORUwpOwogCWlmIChzdGF0ZSkgewotCQlwbGFuZS0+c3RhdGUgPSAmc3RhdGUt
PnN0YXRlOwotCQlwbGFuZS0+c3RhdGUtPnBsYW5lID0gcGxhbmU7Ci0JCXBsYW5lLT5zdGF0ZS0+
YWxwaGEgPSBEUk1fQkxFTkRfQUxQSEFfT1BBUVVFOworCQlfX2RybV9hdG9taWNfaGVscGVyX3Bs
YW5lX3Jlc2V0KHBsYW5lLCAmc3RhdGUtPnN0YXRlKTsKIAkJcGxhbmUtPnN0YXRlLT56cG9zID0g
bGF5ZXItPmlkOwogCX0KIH0KLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
