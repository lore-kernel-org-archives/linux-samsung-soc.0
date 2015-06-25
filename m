From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: iommu: fix potential NULL pointer dereference
Date: Thu, 25 Jun 2015 15:10:12 +0200
Message-ID: <1435237812-24959-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

U29tZSBkcml2ZXJzIChsaWtlIEV4eW5vcyBtaXhlcikgY2FsbHMgZHJtX2lvbW11X2F0dGFjaF9k
ZXZpY2VfaWZfcG9zc2libGUKYmVmb3JlIHJlZ2lzdGVyaW5nIGNydGMsIHNvIGFkZGl0aW9uYWwg
Y2hlY2sgZm9yIE5VTEwgY3J0YyBwb2ludGVyIGlzCnJlcXVpcmVkLgoKU2lnbmVkLW9mZi1ieTog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pb21tdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2lvbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1faW9tbXUuYwppbmRleCBkNGVjNzQ2NWU5Y2MuLmQ0ZWI3MzBiYTI1NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lvbW11LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lvbW11LmMKQEAgLTE1MSw3ICsxNTEsNyBA
QCBpbnQgZHJtX2lvbW11X2F0dGFjaF9kZXZpY2VfaWZfcG9zc2libGUoc3RydWN0IGV4eW5vc19k
cm1fY3J0YyAqZXh5bm9zX2NydGMsCiAJaW50IHJldCA9IDA7CiAKIAlpZiAoaXNfZHJtX2lvbW11
X3N1cHBvcnRlZChkcm1fZGV2KSkgewotCQlpZiAoZXh5bm9zX2NydGMtPm9wcy0+Y2xlYXJfY2hh
bm5lbHMpCisJCWlmIChleHlub3NfY3J0YyAmJiBleHlub3NfY3J0Yy0+b3BzLT5jbGVhcl9jaGFu
bmVscykKIAkJCWV4eW5vc19jcnRjLT5vcHMtPmNsZWFyX2NoYW5uZWxzKGV4eW5vc19jcnRjKTsK
IAkJcmV0dXJuIGRybV9pb21tdV9hdHRhY2hfZGV2aWNlKGRybV9kZXYsIHN1YmRydl9kZXYpOwog
CX0KLS0gCjEuOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
