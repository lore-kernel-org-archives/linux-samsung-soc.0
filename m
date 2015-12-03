From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: dsi: modify a error type when getting a node
 failed
Date: Thu, 03 Dec 2015 14:45:41 +0900
Message-ID: <1449121541-4693-1-git-send-email-inki.dae@samsung.com>
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
To: dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBtYWtlcyBpdCB0byByZXR1cm4gLUVJTlZBTCBpbnN0ZWFkIG9mIC1FTlhJTwp3
aGVuIGdldHRpbmcgYSBwb3J0IG9yIGVuZHBvaW50IG5vZGUgZmFpbGVkLgoKU2lnbmVkLW9mZi1i
eTogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHNpLmMKaW5kZXggN2MzNjA2YS4uYTI0YmY4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9kc2kuYwpAQCAtMTczNSwxMyArMTczNSwxMyBAQCBzdGF0aWMgaW50IGV4eW5vc19k
c2lfcGFyc2VfZHQoc3RydWN0IGV4eW5vc19kc2kgKmRzaSkKIAogCWVwID0gb2ZfZ3JhcGhfZ2V0
X25leHRfZW5kcG9pbnQobm9kZSwgTlVMTCk7CiAJaWYgKCFlcCkgewotCQlyZXQgPSAtRU5YSU87
CisJCXJldCA9IC1FSU5WQUw7CiAJCWdvdG8gZW5kOwogCX0KIAogCWRzaS0+YnJpZGdlX25vZGUg
PSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVwKTsKIAlpZiAoIWRzaS0+YnJpZGdl
X25vZGUpIHsKLQkJcmV0ID0gLUVOWElPOworCQlyZXQgPSAtRUlOVkFMOwogCQlnb3RvIGVuZDsK
IAl9CiBlbmQ6Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
