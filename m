From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v10 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 22 Feb 2017 10:09:54 +0900
Message-ID: <5be15c1c-ba4c-94d9-30be-8d161e9be7b3@samsung.com>
References: <1487574582-15746-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170220071001epcas1p3c2b32665942ba55c3ed4e06d2c66d661@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CGME20170220071001epcas1p3c2b32665942ba55c3ed4e06d2c66d661@epcas1p3.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5nQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRj
aCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZGlzcGxheQpjb250
cm9sbGVyIHRvIFRNMiBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4u
aHdhbmdAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1
bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5n
LmNvbT4KVGVzdGVkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KLS0t
CiAgYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzIHwgMTIgKysr
KysrKysrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMgCmIvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzCmluZGV4IGRlYTBhNmYuLmRi
M2ZlZDIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMt
dG0yLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5k
dHMKQEAgLTUyLDYgKzUyLDE4IEBACiAgCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI1MDAwMDAw
MD4sIDw0MDAwMDAwMDA+OwogIH07CiAgKyZkc2kgeworCXBhbmVsQDAgeworCQljb21wYXRpYmxl
ID0gInNhbXN1bmcsczZlM2hhMiI7CisJCXJlZyA9IDwwPjsKKwkJdmRkMy1zdXBwbHkgPSA8Jmxk
bzI3X3JlZz47CisJCXZjaS1zdXBwbHkgPSA8JmxkbzI4X3JlZz47CisJCXJlc2V0LWdwaW9zID0g
PCZncGcwIDAgR1BJT19BQ1RJVkVfTE9XPjsKKwkJZW5hYmxlLWdwaW9zID0gPCZncGYxIDUgR1BJ
T19BQ1RJVkVfSElHSD47CisJCXRlLWdwaW9zID0gPCZncGYxIDMgR1BJT19BQ1RJVkVfSElHSD47
CisJfTsKK307CisKICAmaHNpMmNfOSB7CiAgCXN0YXR1cyA9ICJva2F5IjsKICAtLSAxLjkuMQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
