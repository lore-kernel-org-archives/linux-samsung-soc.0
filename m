From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 7/9] tests/exynos: simplify drm_set_crtc
Date: Fri, 12 Jun 2015 20:15:12 +0200
Message-ID: <1434132914-3150-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

V2UgY2FuIGp1c3QgcmV0dXJuICdyZXQnIGhlcmUsIHRoZSBnb3RvIHNlcnZlcyBubyBwdXJwb3Nl
LgoKU2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZl
bGQuZGU+Ci0tLQogdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jIHwgNyArLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jIGIvdGVzdHMvZXh5bm9zL2V4
eW5vc19maW1nMmRfdGVzdC5jCmluZGV4IGRlNmEyYjcuLjFlYzczNDAgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYworKysgYi90ZXN0cy9leHlub3MvZXh5bm9z
X2ZpbWcyZF90ZXN0LmMKQEAgLTE1MCwxNCArMTUwLDkgQEAgc3RhdGljIGludCBkcm1fc2V0X2Ny
dGMoc3RydWN0IGV4eW5vc19kZXZpY2UgKmRldiwgc3RydWN0IGNvbm5lY3RvciAqYywKIAogCXJl
dCA9IGRybU1vZGVTZXRDcnRjKGRldi0+ZmQsIGMtPmNydGMsCiAJCQlmYl9pZCwgMCwgMCwgJmMt
PmlkLCAxLCBjLT5tb2RlKTsKLQlpZiAocmV0KSB7CisJaWYgKHJldCkKIAkJZHJtTXNnKCJmYWls
ZWQgdG8gc2V0IG1vZGU6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwotCQlnb3RvIGVycjsKLQl9
Ci0KLQlyZXR1cm4gMDsKIAotZXJyOgogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMC41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
