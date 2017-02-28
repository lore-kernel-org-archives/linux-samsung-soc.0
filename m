From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] drm/exynos/fimd: signal frame done interrupt at front
 porch
Date: Tue, 28 Feb 2017 13:03:03 +0100
Message-ID: <1488283383-4335-3-git-send-email-a.hajda@samsung.com>
References: <1488283383-4335-1-git-send-email-a.hajda@samsung.com>
 <CGME20170228120309eucas1p18087a872c992d4e5be507e408c785fbb@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488283383-4335-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VkJMQU5LIGludGVycnVwdCBzaG91bGQgYmUgc2lnbmFsbGVkIGFzIHNvb24gYXMgc2Nhbm91dCBl
bmRzLCBmcm9udCBwb3JjaAppcyB0aGUgYmVzdCBtb21lbnQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9maW1kLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZmltZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQu
YwppbmRleCA2MzhjNzc1Li4wYjc0ZTU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmltZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9maW1kLmMKQEAgLTI1Niw3ICsyNTYsNyBAQCBzdGF0aWMgaW50IGZpbWRfZW5hYmxlX3Zi
bGFuayhzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjKQogCQkJdmFsIHw9IFZJRElOVENPTjBf
SU5UX0ZSQU1FOwogCiAJCQl2YWwgJj0gflZJRElOVENPTjBfRlJBTUVTRUwwX01BU0s7Ci0JCQl2
YWwgfD0gVklESU5UQ09OMF9GUkFNRVNFTDBfVlNZTkM7CisJCQl2YWwgfD0gVklESU5UQ09OMF9G
UkFNRVNFTDBfRlJPTlRQT1JDSDsKIAkJCXZhbCAmPSB+VklESU5UQ09OMF9GUkFNRVNFTDFfTUFT
SzsKIAkJCXZhbCB8PSBWSURJTlRDT04wX0ZSQU1FU0VMMV9OT05FOwogCQl9Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
