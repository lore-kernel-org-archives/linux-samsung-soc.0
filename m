From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH v2 3/3] drm/exynos: Consolidate return statements in
 fimd_bind()
Date: Thu, 07 May 2015 09:04:46 +0900
Message-ID: <1430957086-25005-4-git-send-email-k.kozlowski@samsung.com>
References: <1430957086-25005-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1430957086-25005-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2kua0BnbWFpbC5jb20+CgpTaW1w
bGlmeSB0aGUgY29kZSBhbmQgcmVtb3ZlIHN1cGVyZmx1b3VzIHJldHVybiBzdGF0ZW1lbnQuIEp1
c3QgcmV0dXJuCnRoZSByZXN1bHQgb2YgZmltZF9pb21tdV9hdHRhY2hfZGV2aWNlcygpLgoKU2ln
bmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2kua0BnbWFpbC5jb20+
CgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKTmV3IHBhdGNoLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9maW1kLmMgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2ZpbWQuYwppbmRleCA1YzFhMTQ4NTI1ZjguLmQ3MDRmMmJhNzE3OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCkBAIC0xMDQyLDEyICsxMDQyLDcgQEAgc3Rh
dGljIGludCBmaW1kX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0
ZXIsIHZvaWQgKmRhdGEpCiAJaWYgKGN0eC0+ZGlzcGxheSkKIAkJZXh5bm9zX2RybV9jcmVhdGVf
ZW5jX2Nvbm4oZHJtX2RldiwgY3R4LT5kaXNwbGF5KTsKIAotCXJldCA9IGZpbWRfaW9tbXVfYXR0
YWNoX2RldmljZXMoY3R4LCBkcm1fZGV2KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0J
cmV0dXJuIDA7Ci0KKwlyZXR1cm4gZmltZF9pb21tdV9hdHRhY2hfZGV2aWNlcyhjdHgsIGRybV9k
ZXYpOwogfQogCiBzdGF0aWMgdm9pZCBmaW1kX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2UgKm1hc3RlciwKLS0gCjIuMS40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
