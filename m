From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] drm/exynos: dp: Lower level of EDID read success message
Date: Thu, 14 May 2015 09:03:06 +0900
Message-ID: <1431561786-12413-1-git-send-email-k.kozlowski@samsung.com>
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
To: Jingoo Han <jg1.han@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RG9uJ3QgcG9sbHV0ZSB0aGUgZG1lc2cgd2l0aCBFRElEIHJlYWQgc3VjY2VzcyBtZXNzYWdlIGFz
IGFuIGVycm9yLgpQcmludGluZyBhcyBkZWJ1ZyBzaG91bGQgYmUgZmluZS4KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGsua296bG93c2tpQHNhbXN1bmcuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RwX2NvcmUuYwppbmRleCA0NDFlZjA2Yjg4OTQuLjMwZmViN2QwNjYyNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBfY29yZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYwpAQCAtMTk1LDcgKzE5NSw3IEBAIHN0
YXRpYyBpbnQgZXh5bm9zX2RwX3JlYWRfZWRpZChzdHJ1Y3QgZXh5bm9zX2RwX2RldmljZSAqZHAp
CiAJCX0KIAl9CiAKLQlkZXZfZXJyKGRwLT5kZXYsICJFRElEIFJlYWQgc3VjY2VzcyFcbiIpOwor
CWRldl9kYmcoZHAtPmRldiwgIkVESUQgUmVhZCBzdWNjZXNzIVxuIik7CiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
