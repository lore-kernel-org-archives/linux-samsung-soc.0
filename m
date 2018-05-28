From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 09/12] ARM: dts: exynos5250: add mipi-phy node
Date: Mon, 28 May 2018 18:24:35 +0200
Message-ID: <CAJKOXPe0gq8U+7xSaxaZFjsGxx7iRGKMEtYn==fAZajJkfasxw@mail.gmail.com>
References: <CGME20180528094729eucas1p1cc26ea191a4ee1ba9daa06fae93037bf@eucas1p1.samsung.com>
 <1527500833-16005-1-git-send-email-m.purski@samsung.com>
 <1527500833-16005-10-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527500833-16005-10-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCBNYXkgMjgsIDIwMTggYXQgMTE6NDcgQU0sIE1hY2llaiBQdXJza2kgPG0ucHVyc2tp
QHNhbXN1bmcuY29tPiB3cm90ZToKPiBUaGUgcGF0Y2ggYWRkcyBwaHkgbm9kZSwgcmVxdWlyZWQg
YnkgTUlQSSBkZXZpY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogUHVyc2tpIDxtLnB1cnNraUBz
YW1zdW5nLmNvbT4KClRoaXMgaGF2ZSBwcmV0dHkgc21hbGwgY2hhbmdlcyBzaW5jZSBvcmlnaW5h
bCBBbmRyemVqJ3MgcGF0Y2ggc28KcHJvYmFibHkgQW5kcnplaidzIGF1dGhvcnNoaXAgc2hvdWxk
IGJlIHByZXNlcnZlZC4KCj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAuZHRz
aSB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9leHlub3M1MjUwLmR0c2kKPiBpbmRleCAyZGFmNTA1Li5hNjNiNjU1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczUyNTAuZHRzaQo+IEBAIC03MzMsNiArNzMzLDEyIEBACj4gICAgICAgICAg
ICAgICAgICAgICAgICAgI3BoeS1jZWxscyA9IDwwPjsKPiAgICAgICAgICAgICAgICAgfTsKPgo+
ICsgICAgICAgICAgICAgICBtaXBpX3BoeTogdmlkZW8tcGh5QDEwMDQwNzEwIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNhbXN1bmcsczVwdjIxMC1taXBpLXZpZGVv
LXBoeSI7CgpObyBEVEMgd2FybmluZ3MgKG1ha2UgZHRicyBXPTEpPyByZWcgaXMgbWlzc2luZyBz
byBEVEMgc2hvdWxkIGNvbXBsYWluLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgI3BoeS1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBzeXNjb24gPSA8JnBtdV9zeXN0ZW1fY29udHJvbGxlcj47Cj4gKyAgICAgICAgICAgICAg
IH07Cj4gKwo+ICAgICAgICAgICAgICAgICBhZGM6IGFkY0AxMmQxMDAwMCB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vcy1hZGMtdjEiOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDEyRDEwMDAwIDB4MTAwPjsKPiAtLQo+IDIu
Ny40Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
