From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v3 9/9] drm/exynos: return return value of
 exynos_crtc->enable_vblank
Date: Thu, 16 Jul 2015 12:23:39 -0300
Message-ID: <1437060219-32278-9-git-send-email-gustavo@padovan.org>
References: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
SW5zdGVhZCBvZiBibGluZGx5IGlnbm9yZSB0aGUgcmV0dXJuIHZhbHVlIG9mIGVuYWJsZV92Ymxh
bmsgcmV0dXJuIGl0CnRvIHRoZSB1cHBlciBEUk0gbGF5ZXIgZm9yIGVycm9yIGhhbmRsaW5nLgoK
U3VnZ2VzdGVkLWJ5OiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+ClNp
Z25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5j
by51az4KUmV2aWV3ZWQtYnk6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKaW5kZXggZTljMjkxZi4uOWJjMjM1MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCkBAIC0xNzUsNyArMTc1LDcg
QEAgaW50IGV4eW5vc19kcm1fY3J0Y19lbmFibGVfdmJsYW5rKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIGludCBwaXBlKQogCQlyZXR1cm4gLUVQRVJNOwogCiAJaWYgKGV4eW5vc19jcnRjLT5vcHMt
PmVuYWJsZV92YmxhbmspCi0JCWV4eW5vc19jcnRjLT5vcHMtPmVuYWJsZV92YmxhbmsoZXh5bm9z
X2NydGMpOworCQlyZXR1cm4gZXh5bm9zX2NydGMtPm9wcy0+ZW5hYmxlX3ZibGFuayhleHlub3Nf
Y3J0Yyk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
