From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/decon: fix disable clocks order
Date: Thu, 11 Feb 2016 12:25:04 +0100
Message-ID: <1455189904-29167-1-git-send-email-a.hajda@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RGVjb24gcmVxdWlyZXMgdGhhdCBjbG9ja3Mgc2hvdWxkIGJlIGRpc2FibGVkIGluIHJldmVyc2Ug
b3JkZXIuIE90aGVyd2lzZQpzeXN0ZW0gaGFuZ3MuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zNTQzM19kcm1fZGVjb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vczU0MzNfZHJtX2RlY29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0
MzNfZHJtX2RlY29uLmMKaW5kZXggMWJmNmEyMS4uOTg2MTVlMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYwpAQCAtNTgyLDkgKzU4Miw5IEBAIG91
dDoKIHN0YXRpYyBpbnQgZXh5bm9zNTQzM19kZWNvbl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKIHsKIAlzdHJ1Y3QgZGVjb25fY29udGV4dCAqY3R4ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
Ci0JaW50IGk7CisJaW50IGkgPSBBUlJBWV9TSVpFKGRlY29uX2Nsa3NfbmFtZSk7CiAKLQlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZWNvbl9jbGtzX25hbWUpOyBpKyspCisJd2hpbGUgKC0t
aSA+PSAwKQogCQljbGtfZGlzYWJsZV91bnByZXBhcmUoY3R4LT5jbGtzW2ldKTsKIAogCXJldHVy
biAwOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
