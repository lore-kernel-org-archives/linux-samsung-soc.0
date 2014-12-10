From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC 07/15] clk: add DT parsing function
Date: Wed, 10 Dec 2014 16:48:25 +0100
Message-ID: <1418226513-14105-8-git-send-email-a.hajda@samsung.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: open list <linux-kernel@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Andrzej Hajda <a.hajda@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHBhdGNoIGFkZHMgZnVuY3Rpb24gZm9yIHBhcnNpbmcgRGV2aWNlIFRyZWUgdG8gZ2V0CmNs
b2NrIHNwZWNpZmllci4gVGhlIGZ1bmN0aW9uIGNvdWxkIGJlIHVsdGltYXRlbHkgdXNlZApieSBj
bG9jayBjb3JlLgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9jbGtkZXYuYyB8IDIzICsrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL2Nsa2Rldi5jIGIvZHJpdmVycy9jbGsvY2xrZGV2LmMKaW5kZXggZGE0YmRhOC4uYmQy
Mjc1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xrZGV2LmMKKysrIGIvZHJpdmVycy9jbGsv
Y2xrZGV2LmMKQEAgLTEyMCw2ICsxMjAsMjkgQEAgc3RydWN0IGNsayAqb2ZfY2xrX2dldF9ieV9u
YW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGNvbnN0IGNoYXIgKm5hbWUpCiAJcmV0dXJuIGNs
azsKIH0KIEVYUE9SVF9TWU1CT0wob2ZfY2xrX2dldF9ieV9uYW1lKTsKKworc3RhdGljIGludCBv
Zl9nZXRfY2xvY2tfc3BlYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUsCisJ
CXN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKnNwZWMpCit7CisJc3RydWN0IGRldmljZV9ub2RlICpu
cCA9IGRldi0+b2Zfbm9kZTsKKworCXdoaWxlIChucCkgeworCQlpbnQgaWR4ID0gMDsKKworCQlp
ZiAobmFtZSkKKwkJCWlkeCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgImNsb2NrLW5h
bWVzIiwgbmFtZSk7CisKKwkJaWYgKCFvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwgImNs
b2NrcyIsICIjY2xvY2stY2VsbHMiLAorCQkJCQkJaWR4LCBzcGVjKSkKKwkJCXJldHVybiAwOwor
CisJCW5wID0gbnAtPnBhcmVudDsKKwkJaWYgKG5wICYmICFvZl9nZXRfcHJvcGVydHkobnAsICJj
bG9jay1yYW5nZXMiLCBOVUxMKSkKKwkJCWJyZWFrOworCX0KKworCXJldHVybiAtRU5PRU5UOwor
fQogI2VuZGlmCiAKIC8qCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
