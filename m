From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 3/4] ARM: dts: add fimd device node to exynos4415.dtsi
Date: Fri, 14 Nov 2014 17:24:33 +0900
Message-ID: <5465BC41.6060501@samsung.com>
References: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
 <1415340747-27904-4-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1415340747-27904-4-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com, cw00.choi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAxMeyblCAwN+ydvCAxNToxMiwgWW91bmdKdW4gQ2hvIHdyb3RlOgo+IFRoaXMg
cGF0Y2ggYWRkcyBmaW1kIGRldmljZSBub2RlIHRvIGV4eW5vczQ0MTUuZHRzaS4KPiAKCkhpIEt1
a2ppbiwKCkNvdWxkIHlvdSBtZXJnZSBwYXRjaCAzIGFuZCA0IHRvIHlvdXIgdHJlZT8gVGhlc2Ug
YXJlIGR0IHBhcnQgZm9yCkV4eW5vczQ0MTUgZHJtIHN1cHBvcnQuIEZvciBkcm0gcGF0Y2hlcywg
SSBhbHJlYWR5IG1lcmdlZCB0aGVtLgoKVGhhbmtzLApJbmtpIERhZQoKCj4gU2lnbmVkLW9mZi1i
eTogWW91bmdKdW4gQ2hvIDx5ajQ0LmNob0BzYW1zdW5nLmNvbT4KPiBBY2tlZC1ieTogS3l1bmdt
aW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNDQxNS5kdHNpIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQ0MTUuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTUuZHRzaQo+IGluZGV4
IGMxYzliMzcuLjMwYWNiM2EgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxNS5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxNS5kdHNpCj4gQEAg
LTIzNCw2ICsyMzQsMTggQEAKPiAgCQkJaW50ZXJydXB0cyA9IDwwIDI0MCAwPjsKPiAgCQl9Owo+
ICAKPiArCQlmaW1kOiBmaW1kQDExQzAwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5n
LGV4eW5vczQ0MTUtZmltZCI7Cj4gKwkJCXJlZyA9IDwweDExQzAwMDAwIDB4MzAwMDA+Owo+ICsJ
CQlpbnRlcnJ1cHQtbmFtZXMgPSAiZmlmbyIsICJ2c3luYyIsICJsY2Rfc3lzIjsKPiArCQkJaW50
ZXJydXB0cyA9IDwwIDg0IDA+LCA8MCA4NSAwPiwgPDAgODYgMD47Cj4gKwkJCWNsb2NrcyA9IDwm
Y211IENMS19TQ0xLX0ZJTUQwPiwgPCZjbXUgQ0xLX0ZJTUQwPjsKPiArCQkJY2xvY2stbmFtZXMg
PSAic2Nsa19maW1kIiwgImZpbWQiOwo+ICsJCQlzYW1zdW5nLHBvd2VyLWRvbWFpbiA9IDwmcGRf
bGNkMD47Cj4gKwkJCXNhbXN1bmcsc3lzcmVnID0gPCZzeXNyZWdfc3lzdGVtX2NvbnRyb2xsZXI+
Owo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJCX07Cj4gKwo+ICAJCWhzb3RnOiBoc290
Z0AxMjQ4MDAwMCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxzM2M2NDAwLWhzb3RnIjsK
PiAgCQkJcmVnID0gPDB4MTI0ODAwMDAgMHgyMDAwMD47Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
