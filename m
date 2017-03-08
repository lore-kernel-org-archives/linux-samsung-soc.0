From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 07/12] drm/exynos/decon5433: fix software trigger mask
Date: Wed, 08 Mar 2017 15:58:41 +0100
Message-ID: <1488985126-25288-8-git-send-email-a.hajda@samsung.com>
References: <1488985126-25288-1-git-send-email-a.hajda@samsung.com>
 <CGME20170308145903eucas1p2a64c7cd562dfddf43dbbe5dd9281edc6@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488985126-25288-1-git-send-email-a.hajda@samsung.com>
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
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHBhdGNoIGZpeGVzIGNvcHkvcGFzdGUgYnVnIGludHJvZHVjZWQgZHVyaW5nIGNvZGUgcmVm
YWN0b3JpbmcuCgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFj
bGUuY29tPgpGaXhlczogYjkzYzJlOGI1ZDlkICgiZHJtL2V4eW5vcy9kZWNvbjU0MzM6IGNvbmZp
Z3VyZSBzeXNyZWcgaW4gY2FzZSBvZiBoYXJkd2FyZSB0cmlnZ2VyIilGaXhlczoKU2lnbmVkLW9m
Zi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jCmluZGV4IDMxOWY1NTcuLmVlOGQ1Y2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKQEAgLTE4
Miw4ICsxODIsOCBAQCBzdGF0aWMgdm9pZCBkZWNvbl9zZXR1cF90cmlnZ2VyKHN0cnVjdCBkZWNv
bl9jb250ZXh0ICpjdHgpCiAJCXJldHVybjsKIAogCWlmICghKGN0eC0+b3V0X3R5cGUgJiBJODBf
SFdfVFJHKSkgewotCQl3cml0ZWwoVFJJR0NPTl9URV9BVVRPX01BU0sgfCBUUklHQ09OX1NXVFJJ
R0VOCi0JCSAgICAgICB8IFRSSUdDT05fVEVfQVVUT19NQVNLIHwgVFJJR0NPTl9TV1RSSUdFTiwK
KwkJd3JpdGVsKFRSSUdDT05fVFJJR0VOX1BFUl9GIHwgVFJJR0NPTl9UUklHRU5fRiB8CisJCSAg
ICAgICBUUklHQ09OX1RFX0FVVE9fTUFTSyB8IFRSSUdDT05fU1dUUklHRU4sCiAJCSAgICAgICBj
dHgtPmFkZHIgKyBERUNPTl9UUklHQ09OKTsKIAkJcmV0dXJuOwogCX0KLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
