From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH] drm/exynos: avoid leak if exynos_dpi_probe() fails
Date: Mon, 24 Nov 2014 16:23:30 -0200
Message-ID: <1416853410-11369-1-git-send-email-gustavo@padovan.org>
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
To: linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
VGhlIGNvbXBvbmVudCBtdXN0IGJlIGRlbGV0ZWQgaWYgdGhlIHByb2JlIGZhaWxzLgoKU2lnbmVk
LW9mZi1ieTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVr
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgfCA2ICsrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwppbmRleCAxYmY1MmFiLi5hYmQyY2E5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKQEAgLTEyMTUsOCAr
MTIxNSwxMCBAQCBzdGF0aWMgaW50IGZpbWRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjdHgpOwogCiAJY3R4LT5kaXNwbGF5
ID0gZXh5bm9zX2RwaV9wcm9iZShkZXYpOwotCWlmIChJU19FUlIoY3R4LT5kaXNwbGF5KSkKLQkJ
cmV0dXJuIFBUUl9FUlIoY3R4LT5kaXNwbGF5KTsKKwlpZiAoSVNfRVJSKGN0eC0+ZGlzcGxheSkp
IHsKKwkJcmV0ID0gUFRSX0VSUihjdHgtPmRpc3BsYXkpOworCQlnb3RvIGVycl9kZWxfY29tcG9u
ZW50OworCX0KIAogCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7CiAKLS0gCjEuOS4zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
