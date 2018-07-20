From: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Subject: [PATCH 07/10] drm: rcar-du: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Fri, 20 Jul 2018 22:15:06 +0100
Message-ID: <20180720211509.23605-8-alexandru-cosmin.gheorghe@arm.com>
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
Z2hlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9wbGFuZS5j
IHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3ZzcC5jICAgfCA0ICst
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYwppbmRleCBjMjBmN2VkNDhjOGQuLjE5
YTlkNWY2ZGIxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9w
bGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYwpAQCAt
Njg5LDE1ICs2ODksMTMgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9wbGFuZV9yZXNldChzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSkKIAlzdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9L
RVJORUwpOwogCWlmIChzdGF0ZSA9PSBOVUxMKQogCQlyZXR1cm47CisJX19kcm1fYXRvbWljX2hl
bHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5zdGF0ZSk7CiAKIAlzdGF0ZS0+aHdpbmRl
eCA9IC0xOwogCXN0YXRlLT5zb3VyY2UgPSBSQ0FSX0RVX1BMQU5FX01FTU9SWTsKIAlzdGF0ZS0+
Y29sb3JrZXkgPSBSQ0FSX0RVX0NPTE9SS0VZX05PTkU7CiAJc3RhdGUtPnN0YXRlLnpwb3MgPSBw
bGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZID8gMCA6IDE7CiAKLQlwbGFuZS0+
c3RhdGUgPSAmc3RhdGUtPnN0YXRlOwotCXBsYW5lLT5zdGF0ZS0+YWxwaGEgPSBEUk1fQkxFTkRf
QUxQSEFfT1BBUVVFOwotCXBsYW5lLT5zdGF0ZS0+cGxhbmUgPSBwbGFuZTsKIH0KIAogc3RhdGlj
IGludCByY2FyX2R1X3BsYW5lX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3ZzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV92c3AuYwppbmRleCA3MmVlYmVkYTUx
OGUuLjBhMGFhNDkwZjgwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV92c3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3ZzcC5jCkBA
IC0zNDYsMTEgKzM0Niw5IEBAIHN0YXRpYyB2b2lkIHJjYXJfZHVfdnNwX3BsYW5lX3Jlc2V0KHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogCWlmIChzdGF0ZSA9PSBOVUxMKQogCQlyZXR1cm47CiAK
LQlzdGF0ZS0+c3RhdGUuYWxwaGEgPSBEUk1fQkxFTkRfQUxQSEFfT1BBUVVFOworCV9fZHJtX2F0
b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzdGF0ZS0+c3RhdGUpOwogCXN0YXRlLT5z
dGF0ZS56cG9zID0gcGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSA/IDAgOiAx
OwogCi0JcGxhbmUtPnN0YXRlID0gJnN0YXRlLT5zdGF0ZTsKLQlwbGFuZS0+c3RhdGUtPnBsYW5l
ID0gcGxhbmU7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIHJjYXJf
ZHVfdnNwX3BsYW5lX2Z1bmNzID0gewotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
