From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/4] drm/exynos: plane: honor buffer offset for dma_addr
Date: Mon, 27 Apr 2015 23:10:14 +0200
Message-ID: <1430169016-4966-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1430169016-4966-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1430169016-4966-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

UHJldmlvdXNseSB3ZSB3ZXJlIGlnbm9yaW5nIHRoZSBidWZmZXIgb2Zmc2V0cyB0aGF0IGFyZQpw
YXNzZWQgdGhyb3VnaCB0aGUgYWRkZmIyIGlvY3RsLiBUaGlzIGRpZG4ndCBjYXVzZSBhbnkKbWFq
b3IgaXNzdWVzLCBzaW5jZSBmb3IgdW5pLXBsYW5hciBmb3JtYXRzIChsaWtlIFhSR0I4ODg4KQp1
c2Vyc3BhY2Ugd291bGQgbW9zdCBvZiB0aGUgdGltZSBqdXN0IHVzZSBvZmZzZXRzWzBdPTAuCgpI
b3dldmVyIHdpdGggTlYxMiBvZmZzZXRzWzFdIGlzIHZlcnkgbGlrZWx5IG5vbi16ZXJvLgpTbyBw
cm9wZXJseSBhcHBseSB0aGUgb2Zmc2V0cyB0byBvdXIgZG1hIGFkZHJlc3Nlcy4KClNpZ25lZC1v
ZmYtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51bmktYmllbGVmZWxkLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYwppbmRleCAxM2VhMzM0Li5iMTE4MGZiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYwpAQCAtNzYsNyArNzYsNyBAQCBp
bnQgZXh5bm9zX2NoZWNrX3BsYW5lKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYikKIAkJCXJldHVybiAtRUZBVUxUOwogCQl9CiAKLQkJZXh5bm9zX3Bs
YW5lLT5kbWFfYWRkcltpXSA9IGJ1ZmZlci0+ZG1hX2FkZHI7CisJCWV4eW5vc19wbGFuZS0+ZG1h
X2FkZHJbaV0gPSBidWZmZXItPmRtYV9hZGRyICsgZmItPm9mZnNldHNbaV07CiAKIAkJRFJNX0RF
QlVHX0tNUygiYnVmZmVyOiAlZCwgZG1hX2FkZHIgPSAweCVseFxuIiwKIAkJCQlpLCAodW5zaWdu
ZWQgbG9uZylleHlub3NfcGxhbmUtPmRtYV9hZGRyW2ldKTsKLS0gCjIuMC41CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
