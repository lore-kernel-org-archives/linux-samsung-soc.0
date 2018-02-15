From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 4/6] arm64: dts: exynos: add OF graph between MHL and
 USB connector
Date: Thu, 15 Feb 2018 11:39:18 +0100
Message-ID: <20180215103920.32017-5-a.hajda@samsung.com>
References: <20180215103920.32017-1-a.hajda@samsung.com>
 <CGME20180215103927eucas1p24785b56277ed6c9fa2fd70058096b944@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180215103920.32017-1-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T0YgZ3JhcGggZGVzY3JpYmVzIE1ITCBkYXRhIGxhbmVzIGJldHdlZW4gTUhMIGFuZCByZXNwZWN0
aXZlIFVTQgpjb25uZWN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgotLS0KIC4uLi9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29t
bW9uLmR0c2kgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQppbmRleCA3ZTQ5ZmFk
ZWU0MTIuLmVmNzU4ZjczMzdlOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlu
b3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9l
eHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKQEAgLTc3OSw5ICs3NzksMjIgQEAKIAkJ
Y2xvY2tzID0gPCZwbXVfc3lzdGVtX2NvbnRyb2xsZXIgMD47CiAJCWNsb2NrLW5hbWVzID0gInh0
YWwiOwogCi0JCXBvcnQgewotCQkJbWhsX3RvX2hkbWk6IGVuZHBvaW50IHsKLQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmhkbWlfdG9fbWhsPjsKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8
MD47CisJCQkJbWhsX3RvX2hkbWk6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZoZG1pX3RvX21obD47CisJCQkJfTsKKwkJCX07CisKKwkJCXBvcnRAMSB7CisJCQkJcmVnID0g
PDE+OworCQkJCW1obF90b19tdXNiX2NvbjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8Jm11c2JfY29uX3RvX21obD47CisJCQkJfTsKIAkJCX07CiAJCX07CiAJfTsKQEAgLTgw
NCw2ICs4MTcsMTggQEAKIAkJCQkJICAgICAidXNiLWItY29ubmVjdG9yIjsKIAkJCQlsYWJlbCA9
ICJtaWNyby1VU0IiOwogCQkJCXR5cGUgPSAibWljcm8iOworCisJCQkJcG9ydHMgeworCQkJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCQkJcG9y
dEAzIHsKKwkJCQkJCW11c2JfY29uX3RvX21obDogZW5kcG9pbnQgeworCQkJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmbWhsX3RvX211c2JfY29uPjsKKwkJCQkJCX07CisJCQkJCX07CisJCQkJfTsK
KwkJCX07CiAJCQl9OwogCQl9OwogCi0tIAoyLjE2LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
