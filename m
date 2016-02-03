From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 04/10] drm/exynos: mic: use devm_clk interface
Date: Wed, 03 Feb 2016 13:42:48 +0100
Message-ID: <1454503374-16382-5-git-send-email-m.szyprowski@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RHJpdmVycyBzaG91bGQgdXNlIGRldm1fY2xrKiBpbnRlcmZhY2UgaW5zdGVhZCBvZiBvZl9jbGsq
IGZ1bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWlj
LmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYwppbmRleCA0ZWFlZjM2
Li4xMDU5NGMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
bWljLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCkBAIC00
NDUsNyArNDQ1LDcgQEAgaW50IGV4eW5vc19taWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgTlVNX0NMS1M7IGkrKykgewotCQltaWMt
PmNsa3NbaV0gPSBvZl9jbGtfZ2V0X2J5X25hbWUoZGV2LT5vZl9ub2RlLCBjbGtfbmFtZXNbaV0p
OworCQltaWMtPmNsa3NbaV0gPSBkZXZtX2Nsa19nZXQoZGV2LCBjbGtfbmFtZXNbaV0pOwogCQlp
ZiAoSVNfRVJSKG1pYy0+Y2xrc1tpXSkpIHsKIAkJCURSTV9FUlJPUigibWljOiBGYWlsZWQgdG8g
Z2V0IGNsb2NrICglcylcbiIsCiAJCQkJCQkJCWNsa19uYW1lc1tpXSk7CkBAIC00NjMsMTMgKzQ2
Myw5IEBAIGVycjoKIHN0YXRpYyBpbnQgZXh5bm9zX21pY19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZXh5bm9zX21pYyAqbWljID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Ci0JaW50IGk7CiAKIAlkcm1fYnJpZGdlX3JlbW92ZSgmbWljLT5icmlk
Z2UpOwogCi0JZm9yIChpID0gTlVNX0NMS1MgLSAxOyBpID4gLTE7IGktLSkKLQkJY2xrX3B1dCht
aWMtPmNsa3NbaV0pOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjEuOS4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
