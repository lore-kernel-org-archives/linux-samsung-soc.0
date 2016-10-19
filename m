From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH V2] gpu/drm/exynos/exynos_hdmi - Unmap region obtained by
 of_iomap
Date: Wed, 19 Oct 2016 15:34:16 +0530
Message-ID: <1476871456-1098-1-git-send-email-arvind.yadav.cs@gmail.com>
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
To: airlied@linux.ie, krzk@kernel.org, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJlZSBtZW1vcnkgbWFwcGluZywgaWYgaGRtaV9wcm9iZSBpcyBub3Qgc3VjY2Vzc2Z1bC4KClNp
Z25lZC1vZmYtYnk6IEFydmluZCBZYWRhdiA8YXJ2aW5kLnlhZGF2LmNzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgfCAgICA1ICsrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRt
aS5jCmluZGV4IDIyNzVlZmUuLmJhMjhkZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19o
ZG1pLmMKQEAgLTE5MDEsNiArMTkwMSw4IEBAIGVycl9kaXNhYmxlX3BtX3J1bnRpbWU6CiBlcnJf
aGRtaXBoeToKIAlpZiAoaGRhdGEtPmhkbWlwaHlfcG9ydCkKIAkJcHV0X2RldmljZSgmaGRhdGEt
PmhkbWlwaHlfcG9ydC0+ZGV2KTsKKwlpZiAoaGRhdGEtPnJlZ3NfaGRtaXBoeSkKKwkJaW91bm1h
cChoZGF0YS0+cmVnc19oZG1pcGh5KTsKIGVycl9kZGM6CiAJcHV0X2RldmljZSgmaGRhdGEtPmRk
Y19hZHB0LT5kZXYpOwogCkBAIC0xOTIzLDYgKzE5MjUsOSBAQCBzdGF0aWMgaW50IGhkbWlfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKGhkYXRhLT5oZG1pcGh5X3Bv
cnQpCiAJCXB1dF9kZXZpY2UoJmhkYXRhLT5oZG1pcGh5X3BvcnQtPmRldik7CiAKKwlpZiAoaGRh
dGEtPnJlZ3NfaGRtaXBoeSkKKwkJaW91bm1hcChoZGF0YS0+cmVnc19oZG1pcGh5KTsKKwogCXB1
dF9kZXZpY2UoJmhkYXRhLT5kZGNfYWRwdC0+ZGV2KTsKIAogCXJldHVybiAwOwotLSAKMS43Ljku
NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
