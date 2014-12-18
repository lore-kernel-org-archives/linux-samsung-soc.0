From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 29/29] drm/exynos: atomic phase 2: keep track of framebuffer
 pointer
Date: Thu, 18 Dec 2014 11:58:55 -0200
Message-ID: <1418911135-5207-30-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
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
VXNlIGRybV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZSgpIGluIHRoZSBsZWdhY3kgcGFnZV9mbGlw
IHBhdGggdG8ga2VlcAp0cmFjayBvZiB0aGUgZnJhbWVidWZmZXIgcG9pbnRlciBhbmQgcmVmZXJl
bmNlLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29s
bGFib3JhLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRj
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYwppbmRleCBjZjE2ODQ0Li5iNTEwYmFjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKQEAgLTIxOSw2ICsyMTksMTAg
QEAgc3RhdGljIGludCBleHlub3NfZHJtX2NydGNfcGFnZV9mbGlwKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywKIAkJCQkgICAgY3J0Y193LCBjcnRjX2gsIGNydGMtPngsIGNydGMtPnksCiAJCQkJICAg
IGNydGNfdywgY3J0Y19oKTsKIAl9CisKKwlpZiAoY3J0Yy0+cHJpbWFyeS0+c3RhdGUpCisJCWRy
bV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZShjcnRjLT5wcmltYXJ5LT5zdGF0ZSwgZmIpOworCiBv
dXQ6CiAJbXV0ZXhfdW5sb2NrKCZkZXYtPnN0cnVjdF9tdXRleCk7CiAJcmV0dXJuIHJldDsKLS0g
CjEuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
