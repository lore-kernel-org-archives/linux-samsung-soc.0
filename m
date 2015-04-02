From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 05/10] drm/exynos: atomic phase 2: keep track of
 framebuffer pointer
Date: Thu,  2 Apr 2015 11:17:07 -0300
Message-ID: <1427984231-7007-6-git-send-email-gustavo@padovan.org>
References: <1427984231-7007-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1427984231-7007-1-git-send-email-gustavo@padovan.org>
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
LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCmluZGV4IDQ0ZTczZDAuLmIwODBlODMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYwpAQCAtMTc0LDYgKzE3NCw5IEBA
IHN0YXRpYyBpbnQgZXh5bm9zX2RybV9jcnRjX3BhZ2VfZmxpcChzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCiAJCQkgICAgY3J0Y193LCBjcnRjX2gsIGNydGMtPngsIGNydGMtPnksCiAJCQkgICAgY3J0
Y193LCBjcnRjX2gpOwogCisJaWYgKGNydGMtPnByaW1hcnktPnN0YXRlKQorCQlkcm1fYXRvbWlj
X3NldF9mYl9mb3JfcGxhbmUoY3J0Yy0+cHJpbWFyeS0+c3RhdGUsIGZiKTsKKwogCXJldHVybiAw
OwogCiBvdXQ6Ci0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
