From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH v3 03/10] drm: mali-dp: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Sat,  4 Aug 2018 17:15:23 +0100
Message-ID: <20180804161530.12275-4-alexandru-cosmin.gheorghe@arm.com>
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
LgoKUmV2aWV3ZWQtYnk6IEF5YW4gS3VtYXIgaGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgpB
Y2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jIHwgNyArKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfcGxhbmVzLmMKaW5kZXggMjk0MDlhNjVkODY0Li40OWMzN2Y2ZGQ2M2UgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCkBAIC03OCwxMSArNzgsOCBAQCBzdGF0aWMgdm9p
ZCBtYWxpZHBfcGxhbmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiAJa2ZyZWUoc3Rh
dGUpOwogCXBsYW5lLT5zdGF0ZSA9IE5VTEw7CiAJc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3Rh
dGUpLCBHRlBfS0VSTkVMKTsKLQlpZiAoc3RhdGUpIHsKLQkJc3RhdGUtPmJhc2UucGxhbmUgPSBw
bGFuZTsKLQkJc3RhdGUtPmJhc2Uucm90YXRpb24gPSBEUk1fTU9ERV9ST1RBVEVfMDsKLQkJcGxh
bmUtPnN0YXRlID0gJnN0YXRlLT5iYXNlOwotCX0KKwlpZiAoc3RhdGUpCisJCV9fZHJtX2F0b21p
Y19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzdGF0ZS0+YmFzZSk7CiB9CiAKIHN0YXRpYyBz
dHJ1Y3QKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
