From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 08/10] drm/exynos: initialize DMA ops for virtual Exynos DRM
 device
Date: Wed, 03 Feb 2016 13:42:52 +0100
Message-ID: <1454503374-16382-9-git-send-email-m.szyprowski@samsung.com>
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

VmlydHVhbCBEUk0gZGV2aWNlIGlzIHVzZWQgZm9yIG1lbW9yeSBhbGxvY2F0aW9uIGZvciBHRU0g
b2JqZWN0cy4gT24Kc29tZSBhcmNoaXRlY3R1cmVzIG51bGwgZG1hIG9wZXJhdGlvbnMgYXJlIGFz
c2lnbmVkIGZvciB2aXJ0dWFsIGRldmljZXMKaWYgbm8gZXhwbGljaXQgaW5pdGlhbGl6YXRpb24g
aGFzIGJlZW4gbWFkZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJv
d3NraUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHJ2LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwppbmRleCA2OGYwZjM2Li5hMzNlYTQ0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCkBAIC0xNDQsNiArMTQ0LDcgQEAgc3Rh
dGljIGludCBleHlub3NfZHJtX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQg
bG9uZyBmbGFncykKIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZwcml2YXRlLT53YWl0KTsKIAlzcGlu
X2xvY2tfaW5pdCgmcHJpdmF0ZS0+bG9jayk7CiAKKwlhcmNoX3NldHVwX2RtYV9vcHMoZGV2LT5k
ZXYsIDAsIERNQV9CSVRfTUFTSygzMiksIGZhbHNlLCBmYWxzZSk7CiAJZGV2X3NldF9kcnZkYXRh
KGRldi0+ZGV2LCBkZXYpOwogCWRldi0+ZGV2X3ByaXZhdGUgPSAodm9pZCAqKXByaXZhdGU7CiAK
LS0gCjEuOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
