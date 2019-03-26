From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 08/21] drm/exynos: Use drm_fb_helper_fill_info
Date: Tue, 26 Mar 2019 14:19:55 +0100
Message-ID: <20190326132008.11781-8-daniel.vetter@ffwll.ch>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyB3aWxsIGdpdmUgdGhlIGV4eW5vcyBmYmRldiBhIG5hbWUhCgp2MjogUmViYXNlCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIu
c2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5j
b20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpDYzogS3Vr
amluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzog
bGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9mYmRldi5jCmluZGV4IGMzMGRkODhjZGIyNS4uNTgxYTZhMjA3OTk1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYwpAQCAtODcsMTEgKzg3LDkgQEAgc3RhdGlj
IGludCBleHlub3NfZHJtX2ZiZGV2X3VwZGF0ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVy
LAogCQlyZXR1cm4gUFRSX0VSUihmYmkpOwogCX0KIAotCWZiaS0+cGFyID0gaGVscGVyOwogCWZi
aS0+ZmJvcHMgPSAmZXh5bm9zX2RybV9mYl9vcHM7CiAKLQlkcm1fZmJfaGVscGVyX2ZpbGxfZml4
KGZiaSwgZmItPnBpdGNoZXNbMF0sIGZiLT5mb3JtYXQtPmRlcHRoKTsKLQlkcm1fZmJfaGVscGVy
X2ZpbGxfdmFyKGZiaSwgaGVscGVyLCBzaXplcy0+ZmJfd2lkdGgsIHNpemVzLT5mYl9oZWlnaHQp
OworCWRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKGZiaSwgaGVscGVyLCBzaXplcyk7CiAKIAlucl9w
YWdlcyA9IGV4eW5vc19nZW0tPnNpemUgPj4gUEFHRV9TSElGVDsKIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
