From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/3] drm/exynos: don't commit if plane scaling is required
Date: Thu, 19 Mar 2015 11:27:48 -0300
Message-ID: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
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
ZXh5bm9zIGRvZXNuJ3Qgc2hvdyBzY2FsZWQgcGxhbmVzIHByb3Blcmx5IG9uIHRoZSBzY3JlZW4g
c28KZGlzYWJsZSB0aGUgZmVhdHVyZSBhbmQgc2hvdyBhIG1lc3NhZ2UgdG8gdGhlIHVzZXIuCgpT
aWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEu
Y28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDYgKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX21peGVyLmMKaW5kZXggMmUzYmM1Ny4uYTk1ZmU4NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19taXhlci5jCkBAIC01NTAsNiArNTUwLDEyIEBAIHN0YXRpYyB2b2lkIG1peGVy
X2dyYXBoX2J1ZmZlcihzdHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4LCBpbnQgd2luKQogCQlmbXQg
PSBBUkdCODg4ODsKIAl9CiAKKwlpZiAod2luX2RhdGEtPmNydGNfd2lkdGggIT0gd2luX2RhdGEt
PnNyY193aWR0aCB8fAorCSAgICB3aW5fZGF0YS0+Y3J0Y19oZWlnaHQgIT0gd2luX2RhdGEtPnNy
Y19oZWlnaHQpIHsKKwkJRFJNX0RFQlVHX0tNUygicGxhbmUgc2NhbGluZyBub3Qgc3VwcG9ydGVk
XG4iKTsKKwkJcmV0dXJuOworCX0KKwogCS8qIDJ4IHNjYWxpbmcgZmVhdHVyZSAqLwogCXhfcmF0
aW8gPSAwOwogCXlfcmF0aW8gPSAwOwotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
