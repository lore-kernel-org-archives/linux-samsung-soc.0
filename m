From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 8/9] drm/panel: simple: fix BOE/HV070WSA-100 timings
Date: Wed, 25 Jul 2018 17:46:43 +0200
Message-ID: <20180725154644.25412-9-a.hajda@samsung.com>
References: <20180725154644.25412-1-a.hajda@samsung.com>
 <CGME20180725154703eucas1p1e07c626c26a574ab19a8c0d73eacc1c3@eucas1p1.samsung.com>
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

UGFuZWwgdGltaW5ncyB3ZXJlIHRha2VuIGZyb20gdmVuZG9yIGNvZGUgYW5kIGFyZSBub3QgZnVs
bHkgY29ycmVjdCAtIHJlZnJlc2gKcmF0ZSBpcyBhYm91dCA1MEh6IGluc3RlYWQgb2YgNjBIei4g
VGhlIHBhdGNoIGZpeGVzIGl0LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
fCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggZDVkYTU4
ZDVjOWIxLi5hMjIyNmEzZDI4ODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMK
QEAgLTc0NiwxNSArNzQ2LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdmlj
X3RtMDcwZGRoMDMgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgYm9lX2h2MDcwd3NhX21vZGUgPSB7Ci0JLmNsb2NrID0gNDA4MDAsCisJLmNsb2NrID0gNDIx
MDUsCiAJLmhkaXNwbGF5ID0gMTAyNCwKLQkuaHN5bmNfc3RhcnQgPSAxMDI0ICsgOTAsCi0JLmhz
eW5jX2VuZCA9IDEwMjQgKyA5MCArIDkwLAotCS5odG90YWwgPSAxMDI0ICsgOTAgKyA5MCArIDkw
LAorCS5oc3luY19zdGFydCA9IDEwMjQgKyAzMCwKKwkuaHN5bmNfZW5kID0gMTAyNCArIDMwICsg
MzAsCisJLmh0b3RhbCA9IDEwMjQgKyAzMCArIDMwICsgMzAsCiAJLnZkaXNwbGF5ID0gNjAwLAot
CS52c3luY19zdGFydCA9IDYwMCArIDMsCi0JLnZzeW5jX2VuZCA9IDYwMCArIDMgKyA0LAotCS52
dG90YWwgPSA2MDAgKyAzICsgNCArIDMsCisJLnZzeW5jX3N0YXJ0ID0gNjAwICsgMTAsCisJLnZz
eW5jX2VuZCA9IDYwMCArIDEwICsgMTAsCisJLnZ0b3RhbCA9IDYwMCArIDEwICsgMTAgKyAxMCwK
IAkudnJlZnJlc2ggPSA2MCwKIH07CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
