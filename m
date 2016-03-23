From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/7] drm/exynos/hdmi: add core reset code
Date: Wed, 23 Mar 2016 14:15:14 +0100
Message-ID: <1458738918-32054-4-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VG8gZW5zdXJlIEhETUktUEhZIHJlcHJvZ3JhbW1pbmcgd2lsbCBub3QgYWZmZWN0CkhETUkgdGhl
IGxhdHRlciBzaG91bGQgYmUgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hk
bWkuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2hkbWkuYwppbmRleCAxNjk1MWYzLi42ZmFhMTA0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCkBAIC0xNjYyLDYgKzE2NjIsMTAgQEAgc3RhdGljIHZv
aWQgaGRtaV9tb2RlX2FwcGx5KHN0cnVjdCBoZG1pX2NvbnRleHQgKmhkYXRhKQogCiBzdGF0aWMg
dm9pZCBoZG1pcGh5X2NvbmZfcmVzZXQoc3RydWN0IGhkbWlfY29udGV4dCAqaGRhdGEpCiB7CisJ
aGRtaV9yZWdfd3JpdGVtYXNrKGhkYXRhLCBIRE1JX0NPUkVfUlNUT1VULCAwLCAxKTsKKwl1c2xl
ZXBfcmFuZ2UoMTAwMDAsIDEyMDAwKTsKKwloZG1pX3JlZ193cml0ZW1hc2soaGRhdGEsIEhETUlf
Q09SRV9SU1RPVVQsIH4wLCAxKTsKKwl1c2xlZXBfcmFuZ2UoMTAwMDAsIDEyMDAwKTsKIAloZG1p
X3JlZ193cml0ZW1hc2soaGRhdGEsIEhETUlfUEhZX1JTVE9VVCwgfjAsIEhETUlfUEhZX1NXX1JT
VE9VVCk7CiAJdXNsZWVwX3JhbmdlKDEwMDAwLCAxMjAwMCk7CiAJaGRtaV9yZWdfd3JpdGVtYXNr
KGhkYXRhLCBIRE1JX1BIWV9SU1RPVVQsIDAsIEhETUlfUEhZX1NXX1JTVE9VVCk7Ci0tIAoxLjku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
