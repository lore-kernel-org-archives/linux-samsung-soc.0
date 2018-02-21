From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 4/6] arm64: dts: exynos: add OF graph between MHL and USB
 connector
Date: Wed, 21 Feb 2018 09:55:39 +0100
Message-ID: <20180221085541.14556-5-a.hajda@samsung.com>
References: <20180221085541.14556-1-a.hajda@samsung.com>
 <CGME20180221085607eucas1p1a08c82fac832049d79705b4222422fa9@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180221085541.14556-1-a.hajda@samsung.com>
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
QHNhbXN1bmcuY29tPgotLS0KdjQ6Ci0gYWRkZWQgbWlzc2luZyByZWcgcHJvcGVydHkgaW4gY29u
bmVjdG9yJ3MgcG9ydCBub2RlIChLcnp5c3p0b2YpCi0tLQogLi4uL2Jvb3QvZHRzL2V4eW5vcy9l
eHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24u
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5k
dHNpCmluZGV4IGY2MDRmNmIxYTljMi4uMmVkNTA2ZGY5NGQwIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQpAQCAtODE3
LDkgKzgxNywyMiBAQAogCQljbG9ja3MgPSA8JnBtdV9zeXN0ZW1fY29udHJvbGxlciAwPjsKIAkJ
Y2xvY2stbmFtZXMgPSAieHRhbCI7CiAKLQkJcG9ydCB7Ci0JCQltaGxfdG9faGRtaTogZW5kcG9p
bnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV90b19taGw+OworCQlwb3J0cyB7CisJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0
QDAgeworCQkJCXJlZyA9IDwwPjsKKwkJCQltaGxfdG9faGRtaTogZW5kcG9pbnQgeworCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfdG9fbWhsPjsKKwkJCQl9OworCQkJfTsKKworCQkJcG9y
dEAxIHsKKwkJCQlyZWcgPSA8MT47CisJCQkJbWhsX3RvX211c2JfY29uOiBlbmRwb2ludCB7CisJ
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbXVzYl9jb25fdG9fbWhsPjsKKwkJCQl9OwogCQkJfTsK
IAkJfTsKIAl9OwpAQCAtODQyLDYgKzg1NSwxOSBAQAogCQkJCQkgICAgICJ1c2ItYi1jb25uZWN0
b3IiOwogCQkJCWxhYmVsID0gIm1pY3JvLVVTQiI7CiAJCQkJdHlwZSA9ICJtaWNybyI7CisKKwkJ
CQlwb3J0cyB7CisJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCQkjc2l6ZS1jZWxscyA9
IDwwPjsKKworCQkJCQlwb3J0QDMgeworCQkJCQkJcmVnID0gPDM+OworCQkJCQkJbXVzYl9jb25f
dG9fbWhsOiBlbmRwb2ludCB7CisJCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaGxfdG9fbXVz
Yl9jb24+OworCQkJCQkJfTsKKwkJCQkJfTsKKwkJCQl9OworCQkJfTsKIAkJCX07CiAJCX07CiAK
LS0gCjIuMTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
