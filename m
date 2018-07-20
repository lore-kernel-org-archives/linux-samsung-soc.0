From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 03/10] drm: mali-dp: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Fri, 20 Jul 2018 22:15:02 +0100
Message-ID: <20180720211509.23605-4-alexandru-cosmin.gheorghe@arm.com>
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
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMgfCA3
ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwppbmRleCAyOTQwOWE2NWQ4NjQuLjQ5YzM3
ZjZkZDYzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKQEAgLTc4LDExICs3OCw4
IEBAIHN0YXRpYyB2b2lkIG1hbGlkcF9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSkKIAlrZnJlZShzdGF0ZSk7CiAJcGxhbmUtPnN0YXRlID0gTlVMTDsKIAlzdGF0ZSA9IGt6YWxs
b2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9LRVJORUwpOwotCWlmIChzdGF0ZSkgewotCQlzdGF0ZS0+
YmFzZS5wbGFuZSA9IHBsYW5lOwotCQlzdGF0ZS0+YmFzZS5yb3RhdGlvbiA9IERSTV9NT0RFX1JP
VEFURV8wOwotCQlwbGFuZS0+c3RhdGUgPSAmc3RhdGUtPmJhc2U7Ci0JfQorCWlmIChzdGF0ZSkK
KwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5iYXNlKTsK
IH0KIAogc3RhdGljIHN0cnVjdAotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
