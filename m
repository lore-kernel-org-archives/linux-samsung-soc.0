From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v11 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 08 Mar 2017 10:42:37 +0900
Message-ID: <1488937357-5623-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308014258epcas5p3eb57787aee92913e79bd467d5b285c0e@epcas5p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5nQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRj
aCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZGlzcGxheQpjb250
cm9sbGVyIHRvIFRNMiBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4u
aHdhbmdAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1
bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5n
LmNvbT4KVGVzdGVkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KUmV2
aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNv
bT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMgfCAx
MiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzIGIvYXJj
aC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzCmluZGV4IGRlYTBhNmYu
LmRiM2ZlZDIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0
MzMtdG0yLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRt
Mi5kdHMKQEAgLTUyLDYgKzUyLDE4IEBACiAJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjUwMDAw
MDAwPiwgPDQwMDAwMDAwMD47CiB9OwogCismZHNpIHsKKwlwYW5lbEAwIHsKKwkJY29tcGF0aWJs
ZSA9ICJzYW1zdW5nLHM2ZTNoYTIiOworCQlyZWcgPSA8MD47CisJCXZkZDMtc3VwcGx5ID0gPCZs
ZG8yN19yZWc+OworCQl2Y2ktc3VwcGx5ID0gPCZsZG8yOF9yZWc+OworCQlyZXNldC1ncGlvcyA9
IDwmZ3BnMCAwIEdQSU9fQUNUSVZFX0xPVz47CisJCWVuYWJsZS1ncGlvcyA9IDwmZ3BmMSA1IEdQ
SU9fQUNUSVZFX0hJR0g+OworCQl0ZS1ncGlvcyA9IDwmZ3BmMSAzIEdQSU9fQUNUSVZFX0hJR0g+
OworCX07Cit9OworCiAmaHNpMmNfOSB7CiAJc3RhdHVzID0gIm9rYXkiOwogCi0tIAoxLjkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
