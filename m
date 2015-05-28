From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 06/18] drm/exynos: atomic phase 2: keep track of
 framebuffer pointer
Date: Thu, 28 May 2015 18:42:44 -0300
Message-ID: <1432849376-12828-7-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
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
Cc: tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
VXNlIGRybV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZSgpIGluIHRoZSBsZWdhY3kgcGFnZV9mbGlw
IHBhdGggdG8ga2VlcAp0cmFjayBvZiB0aGUgZnJhbWVidWZmZXIgcG9pbnRlciBhbmQgcmVmZXJl
bmNlLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29s
bGFib3JhLmNvLnVrPgpSZXZpZXdlZC1ieTogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNh
bXN1bmcuY29tPgpUZXN0ZWQtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51bmktYmll
bGVmZWxkLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCmluZGV4IDczY2NmYTcuLmY3ODJkMWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYwpAQCAtMTY4LDYgKzE2OCw5IEBAIHN0
YXRpYyBpbnQgZXh5bm9zX2RybV9jcnRjX3BhZ2VfZmxpcChzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJCQkgICAgY3J0Y193LCBjcnRjX2gsIGNydGMtPnggPDwgMTYsIGNydGMtPnkgPDwgMTYsCiAJ
CQkgICAgY3J0Y193IDw8IDE2LCBjcnRjX2ggPDwgMTYpOwogCisJaWYgKGNydGMtPnByaW1hcnkt
PnN0YXRlKQorCQlkcm1fYXRvbWljX3NldF9mYl9mb3JfcGxhbmUoY3J0Yy0+cHJpbWFyeS0+c3Rh
dGUsIGZiKTsKKwogCXJldHVybiAwOwogCiBvdXQ6Ci0tIAoyLjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
