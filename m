From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] drm/exynos/dsi: Remove error handling for bridge_node DT
 parsing
Date: Fri, 09 Jun 2017 18:23:00 +0900
Message-ID: <1497000180-30669-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170609092307epcas5p3a7851f80bd799626782941a640824521@epcas5p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGJyaWRnZV9ub2RlIGlzIHVubmVjZXNzYXJ5IGJldHdlZW4gRklNRCBhbmQgRFNJTS4gSWYg
ZG9uJ3QgcmVtb3ZlCmVycm9yIGhhbmRsaW5nLCBpdCB3aWxsIG5vdCB3b3JrIGJldHdlZW4gRklN
RCBhbmQgRFNJTS4gU28gcmVtb3ZlCmVycm9yIGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogSG9l
Z2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rz
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCmluZGV4IGExMWI3
OTUuLjZlZTBkYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKQEAg
LTE2NTEsOCArMTY1MSw2IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wYXJzZV9kdChzdHJ1Y3Qg
ZXh5bm9zX2RzaSAqZHNpKQogCQlyZXR1cm4gcmV0OwogCiAJZHNpLT5icmlkZ2Vfbm9kZSA9IG9m
X2dyYXBoX2dldF9yZW1vdGVfbm9kZShub2RlLCBEU0lfUE9SVF9JTiwgMCk7Ci0JaWYgKCFkc2kt
PmJyaWRnZV9ub2RlKQotCQlyZXR1cm4gLUVJTlZBTDsKIAogCXJldHVybiAwOwogfQotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
