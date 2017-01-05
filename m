From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v6 4/4] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Thu, 05 Jan 2017 15:45:50 +0900
Message-ID: <1483598750-15062-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1483598750-15062-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170105064609epcas5p3e7ca4d3ee6a8b3d2a1d0fd11794eff12@epcas5p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1483598750-15062-1-git-send-email-hoegeun.kwon@samsung.com>
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
LmNvbT4KVGVzdGVkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KLS0t
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMgfCAxMCArKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLmR0cwppbmRleCA1Yjk0NTFkLi4wYTYyOTFm
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5k
dHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzCkBA
IC0zMDksNiArMzA5LDE2IEBACiAJCQl9OwogCQl9OwogCX07CisKKwlwYW5lbEAwIHsKKwkJY29t
cGF0aWJsZSA9ICJzYW1zdW5nLHM2ZTNoYTIiOworCQlyZWcgPSA8MD47CisJCXZkZDMtc3VwcGx5
ID0gPCZsZG8yN19yZWc+OworCQl2Y2ktc3VwcGx5ID0gPCZsZG8yOF9yZWc+OworCQlyZXNldC1n
cGlvcyA9IDwmZ3BnMCAwIEdQSU9fQUNUSVZFX0xPVz47CisJCWVuYWJsZS1ncGlvcyA9IDwmZ3Bm
MSA1IEdQSU9fQUNUSVZFX0hJR0g+OworCQl0ZS1ncGlvcyA9IDwmZ3BmMSAzIEdQSU9fQUNUSVZF
X0hJR0g+OworCX07CiB9OwogCiAmaHNpMmNfMCB7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
