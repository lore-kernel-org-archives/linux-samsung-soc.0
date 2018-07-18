From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] drm/exynos/mixer: Remove unused local variable priv
Date: Wed, 18 Jul 2018 21:55:20 +0200
Message-ID: <20180718195520.5226-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

UmVtb3ZlIGxvY2FsIHZhcmlhYmxlICdwcml2JyB0byBmaXggR0NDIHdhcm5pbmc6CgogICAgZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYzogSW4gZnVuY3Rpb24gJ21peGVyX2lu
aXRpYWxpemUnOgogICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYzo4NDA6
Mjk6IHdhcm5pbmc6IHZhcmlhYmxlICdwcml2JyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMg
fCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfbWl4ZXIuYwppbmRleCAyNzJjNzlmNWY1YmYuLmI4NmFlMmFiOTU5MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCkBAIC04MzcsOCArODM3LDYgQEAgc3RhdGlj
IGludCBtaXhlcl9pbml0aWFsaXplKHN0cnVjdCBtaXhlcl9jb250ZXh0ICptaXhlcl9jdHgsCiAJ
CQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldikKIHsKIAlpbnQgcmV0OwotCXN0cnVjdCBleHlu
b3NfZHJtX3ByaXZhdGUgKnByaXY7Ci0JcHJpdiA9IGRybV9kZXYtPmRldl9wcml2YXRlOwogCiAJ
bWl4ZXJfY3R4LT5kcm1fZGV2ID0gZHJtX2RldjsKIAotLSAKMi4xNC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
