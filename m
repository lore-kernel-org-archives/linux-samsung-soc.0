From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/9] drm/exynos: rotator: Fix DRM_MODE_REFLECT_{X,Y}
 interpretation
Date: Thu, 07 Jun 2018 13:06:07 +0200
Message-ID: <20180607110614.335-3-m.szyprowski@samsung.com>
References: <20180607110614.335-1-m.szyprowski@samsung.com>
 <CGME20180607110620eucas1p1b43ac889bab07152bc20b97116b7ade4@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180607110614.335-1-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SG9yaXpvbnRhbCAoRFJNX01PREVfUkVGTEVDVF9ZKSBhbmQgdmVydGljYWwgKERNUl9NT0RFX1JF
RkxFQ1RfWSkgZmxpcAp3ZXJlIHN3YXBwZWQgaW4gUm90YXRvciBkcml2ZXIuIEZpeCB0aGlzIGJ5
IHN3YXBwaW5nIGNvZGUgZm9yIGludGVycHJldGluZwp0aGVtLgoKU2lnbmVkLW9mZi1ieTogTWFy
ZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9yb3RhdG9yLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9yb3RhdG9yLmMKaW5kZXggMWE3NmRkM2Q1MmUxLi5hODIwYTY4NDI5Yjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9yb3RhdG9yLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYwpAQCAtMTY4
LDkgKzE2OCw5IEBAIHN0YXRpYyB2b2lkIHJvdGF0b3JfZHN0X3NldF90cmFuc2Yoc3RydWN0IHJv
dF9jb250ZXh0ICpyb3QsCiAJdmFsICY9IH5ST1RfQ09OVFJPTF9GTElQX01BU0s7CiAKIAlpZiAo
cm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpCi0JCXZhbCB8PSBST1RfQ09OVFJPTF9GTElQ
X0hPUklaT05UQUw7Ci0JaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9ZKQogCQl2YWwg
fD0gUk9UX0NPTlRST0xfRkxJUF9WRVJUSUNBTDsKKwlpZiAocm90YXRpb24gJiBEUk1fTU9ERV9S
RUZMRUNUX1kpCisJCXZhbCB8PSBST1RfQ09OVFJPTF9GTElQX0hPUklaT05UQUw7CiAKIAl2YWwg
Jj0gflJPVF9DT05UUk9MX1JPVF9NQVNLOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
