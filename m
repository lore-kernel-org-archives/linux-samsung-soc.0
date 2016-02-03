From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/10] drm/exynos: depend on ARCH_EXYNOS for DRM_EXYNOS
Date: Wed, 03 Feb 2016 13:42:45 +0100
Message-ID: <1454503374-16382-2-git-send-email-m.szyprowski@samsung.com>
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

RnJvbTogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgoKQmVjYXVzZSBQ
TEFUX1NBTVNVTkcgaXNuJ3QgaW5jbHVkZSBleHlub3MgU29DcyBmb3IgYXJtNjQsIGJ1dApBUkNI
X0VYWU5PUyBjYW4gZG8gaXQuIEFuZCBpdCBhbHNvIG5lZWRzIHRvIGFkZCBBUkNIX1MzQzY0WFgg
aW5zdGVhZCBvZgpQTEFUX1NBTVNVTkcuCgpTaWduZWQtb2ZmLWJ5OiBKb29ueW91bmcgU2hpbSA8
ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tj
b25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL0tjb25maWcKaW5kZXggODNlZmNhOS4uZjE3ZDM5MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvS2NvbmZpZwpAQCAtMSw2ICsxLDYgQEAKIGNvbmZpZyBEUk1fRVhZTk9TCiAJdHJpc3Rh
dGUgIkRSTSBTdXBwb3J0IGZvciBTYW1zdW5nIFNvQyBFWFlOT1MgU2VyaWVzIgotCWRlcGVuZHMg
b24gT0YgJiYgRFJNICYmIChQTEFUX1NBTVNVTkcgfHwgQVJDSF9NVUxUSVBMQVRGT1JNKQorCWRl
cGVuZHMgb24gT0YgJiYgRFJNICYmIChBUkNIX1MzQzY0WFggfHwgQVJDSF9FWFlOT1MgfHwgQVJD
SF9NVUxUSVBMQVRGT1JNKQogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fS01T
X0ZCX0hFTFBFUgogCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QKLS0gCjEuOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
