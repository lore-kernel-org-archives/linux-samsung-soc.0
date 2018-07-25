From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 6/9] ARM: dts: exynos5250: add DSI node
Date: Wed, 25 Jul 2018 17:46:41 +0200
Message-ID: <20180725154644.25412-7-a.hajda@samsung.com>
References: <20180725154644.25412-1-a.hajda@samsung.com>
 <CGME20180725154701eucas1p1396ca9e1b9e93868a688b51ec9ca443f@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180725154644.25412-1-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Maciej Purski <m.purski@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHBhdGNoIGFkZHMgY29tbW9uIHBhcnQgb2YgRFNJIG5vZGUgZm9yIEV4eW5vczUyNTAgcGxh
dGZvcm1zCmFuZCBhIHJlcXVpcmVkIG1pcGktcGh5IG5vZGUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYWNpZWogUHVy
c2tpIDxtLnB1cnNraUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1
MjUwLmR0c2kgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC5k
dHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC5kdHNpCmluZGV4IDJkYWY1MDViM2Qw
OC4uOTk2NWVjYTk0YTMxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUw
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC5kdHNpCkBAIC03MzMsNiAr
NzMzLDI3IEBACiAJCQkjcGh5LWNlbGxzID0gPDA+OwogCQl9OwogCisJCW1pcGlfcGh5OiB2aWRl
by1waHlAMTAwNDA3MTAgeworCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLHM1cHYyMTAtbWlwaS12
aWRlby1waHkiOworCQkJcmVnID0gPDB4MTAwNDA3MTAgMHgxMDA+OworCQkJI3BoeS1jZWxscyA9
IDwxPjsKKwkJCXN5c2NvbiA9IDwmcG11X3N5c3RlbV9jb250cm9sbGVyPjsKKwkJfTsKKworCQlk
c2lfMDogZHNpQDE0NTAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEw
LW1pcGktZHNpIjsKKwkJCXJlZyA9IDwweDE0NTAwMDAwIDB4MTAwMDA+OworCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDgyIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJc2Ftc3VuZyxwb3dlci1k
b21haW4gPSA8JnBkX2Rpc3AxPjsKKwkJCXBoeXMgPSA8Jm1pcGlfcGh5IDM+OworCQkJcGh5LW5h
bWVzID0gImRzaW0iOworCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRFNJTTA+LCA8JmNsb2NrIENM
S19TQ0xLX01JUEkxPjsKKwkJCWNsb2NrLW5hbWVzID0gImJ1c19jbGsiLCAic2Nsa19taXBpIjsK
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNz
aXplLWNlbGxzID0gPDA+OworCQl9OworCiAJCWFkYzogYWRjQDEyZDEwMDAwIHsKIAkJCWNvbXBh
dGlibGUgPSAic2Ftc3VuZyxleHlub3MtYWRjLXYxIjsKIAkJCXJlZyA9IDwweDEyRDEwMDAwIDB4
MTAwPjsKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
