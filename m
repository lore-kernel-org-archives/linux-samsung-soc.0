From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v4 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 04 Jan 2017 15:58:35 +0900
Message-ID: <1483513115-3068-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1483513115-3068-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170104065900epcas5p2752d2a9575b62a6155ffeb2b7d8f49a7@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1483513115-3068-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jh80.chung@samsung.com, cw00.choi@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5nQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRj
aCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZGlzcGxheQpjb250
cm9sbGVyIHRvIFRNMiBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4u
aHdhbmdAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1
bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5n
LmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMg
fCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5k
dHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMKaW5kZXgg
NWI5NDUxZC4uYjNiYTFhYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3Mv
ZXh5bm9zNTQzMy10bTIuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5v
czU0MzMtdG0yLmR0cwpAQCAtMzA0LDExICszMDQsMjggQEAKIAkJCXJlZyA9IDwxPjsKIAogCQkJ
ZHNpX291dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW4+Owog
CQkJCXNhbXN1bmcsYnVyc3QtY2xvY2stZnJlcXVlbmN5ID0gPDUxMjAwMDAwMD47CiAJCQkJc2Ft
c3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDE2MDAwMDAwPjsKIAkJCX07CiAJCX07CiAJfTsK
KworCXBhbmVsQDAgeworCQljb21wYXRpYmxlID0gInNhbXN1bmcsczZlM2hhMiI7CisJCXJlZyA9
IDwwPjsKKwkJdmRkMy1zdXBwbHkgPSA8JmxkbzI3X3JlZz47CisJCXZjaS1zdXBwbHkgPSA8Jmxk
bzI4X3JlZz47CisJCXJlc2V0LWdwaW9zID0gPCZncGcwIDAgR1BJT19BQ1RJVkVfTE9XPjsKKwkJ
ZW5hYmxlLWdwaW9zID0gPCZncGYxIDUgR1BJT19BQ1RJVkVfSElHSD47CisJCXRlLWdwaW9zID0g
PCZncGYxIDMgR1BJT19BQ1RJVkVfSElHSD47CisKKwkJcG9ydCB7CisJCQlwYW5lbF9pbjogZW5k
cG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291dD47CisJCQl9OworCQl9Owor
CX07CiB9OwogCiAmaHNpMmNfMCB7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
