From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: decon5433: Fix WINCONx reset value
Date: Thu, 07 Jun 2018 13:07:49 +0200
Message-ID: <20180607110749.507-1-m.szyprowski@samsung.com>
References: <CGME20180607110754eucas1p2291258a7c53e680386e2ce22a97cf534@eucas1p2.samsung.com>
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
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIG9ubHkgYml0cyB0aGF0IHNob3VsZCBiZSBwcmVzZXJ2ZWQgaW4gZGVjb25fd2luX3NldF9m
bXQoKSBpcwpXSU5DT054X0VOV0lOX0YuIEFsbCBvdGhlciBiaXRzIGRlcGVuZHMgb24gdGhlIHNl
bGVjdGVkIHBpeGVsIGZvcm1hdHMgYW5kCmFyZSBzZXQgYnkgdGhlIG1lbnRpb25lZCBmdW5jdGlv
bi4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5n
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKaW5kZXggOTJk
MjhiNWIxMDc3Li5lODY4NzczZWE1MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vczU0MzNfZHJtX2RlY29uLmMKQEAgLTI2NSw3ICsyNjUsNyBAQCBzdGF0aWMgdm9pZCBkZWNv
bl93aW5fc2V0X3BpeGZtdChzdHJ1Y3QgZGVjb25fY29udGV4dCAqY3R4LCB1bnNpZ25lZCBpbnQg
d2luLAogCXVuc2lnbmVkIGxvbmcgdmFsOwogCiAJdmFsID0gcmVhZGwoY3R4LT5hZGRyICsgREVD
T05fV0lOQ09OeCh3aW4pKTsKLQl2YWwgJj0gfldJTkNPTnhfQlBQTU9ERV9NQVNLOworCXZhbCAm
PSBXSU5DT054X0VOV0lOX0Y7CiAKIAlzd2l0Y2ggKGZiLT5mb3JtYXQtPmZvcm1hdCkgewogCWNh
c2UgRFJNX0ZPUk1BVF9YUkdCMTU1NToKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
