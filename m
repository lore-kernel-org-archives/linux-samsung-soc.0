From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 3/3] drm/exynos: avoid leak if exynos_dpi_probe() fails
Date: Thu, 20 Nov 2014 21:54:24 -0200
Message-ID: <1416527664-10553-3-git-send-email-gustavo@padovan.org>
References: <1416527664-10553-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1416527664-10553-1-git-send-email-gustavo@padovan.org>
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
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwppbmRleCAwNjczYTM5Li4xNzNkMTM1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKQEAgLTEyMDIsOCAr
MTIwMiwxMCBAQCBzdGF0aWMgaW50IGZpbWRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlmaW1kX21hbmFnZXIuY3R4ID0gY3R4OwogCiAJY3R4LT5kaXNwbGF5ID0gZXh5bm9z
X2RwaV9wcm9iZShkZXYpOwotCWlmIChJU19FUlIoY3R4LT5kaXNwbGF5KSkKLQkJcmV0dXJuIFBU
Ul9FUlIoY3R4LT5kaXNwbGF5KTsKKwlpZiAoSVNfRVJSKGN0eC0+ZGlzcGxheSkpIHsKKwkJcmV0
ID0gUFRSX0VSUihjdHgtPmRpc3BsYXkpOworCQlnb3RvIGVycl9kZWxfY29tcG9uZW50OworCX0K
IAogCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOwogCi0tIAoxLjkuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
