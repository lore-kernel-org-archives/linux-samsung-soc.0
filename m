From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: scaler: fix static checker warning
Date: Wed, 23 May 2018 09:48:15 +0900
Message-ID: <1527036495-24084-1-git-send-email-inki.dae@samsung.com>
References: <CGME20180523004817epcas2p132bbd4a6b606ec05541ddab5f2e793f7@epcas2p1.samsung.com>
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
To: dri-devel@lists.freedesktop.org
Cc: andrzej.p@samsung.com, linux-samsung-soc@vger.kernel.org, dan.carpenter@oracle.com
List-Id: linux-samsung-soc@vger.kernel.org

ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3NjYWxlci5jOjQwMiBzY2FsZXJfdGFz
a19kb25lKCkKd2Fybjogc2lnbmVkbmVzcyBidWcgcmV0dXJuaW5nICcoLTIyKScKClJlcG9ydGVk
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fc2NhbGVyLmMKaW5kZXggNjNiMDViNy4uOTFkNDM4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3NjYWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwpAQCAtMzk3LDcgKzM5Nyw3IEBAIHN0YXRpYyBpbmxp
bmUgdTMyIHNjYWxlcl9nZXRfaW50X3N0YXR1cyhzdHJ1Y3Qgc2NhbGVyX2NvbnRleHQgKnNjYWxl
cikKIAlyZXR1cm4gc2NhbGVyX3JlYWQoU0NBTEVSX0lOVF9TVEFUVVMpOwogfQogCi1zdGF0aWMg
aW5saW5lIGJvb2wgc2NhbGVyX3Rhc2tfZG9uZSh1MzIgdmFsKQorc3RhdGljIGlubGluZSBpbnQg
c2NhbGVyX3Rhc2tfZG9uZSh1MzIgdmFsKQogewogCXJldHVybiB2YWwgJiBTQ0FMRVJfSU5UX1NU
QVRVU19GUkFNRV9FTkQgPyAwIDogLUVJTlZBTDsKIH0KLS0gCjEuOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
