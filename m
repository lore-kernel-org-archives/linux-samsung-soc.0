From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4 5/6] extcon: add possibility to get extcon device by
 OF node
Date: Wed, 21 Feb 2018 16:54:42 +0100
Message-ID: <6da27f54-76d0-2ac8-666e-e3ebfc71b2c1@samsung.com>
References: <CGME20180221085608eucas1p162d2e579a1cc887672b722458edb98fe@eucas1p1.samsung.com>
 <20180221085541.14556-1-a.hajda@samsung.com>
 <20180221085541.14556-6-a.hajda@samsung.com>
 <CAHp75VdxGDCGQBN05bL3_h8P62-v6+5oGW3M7CA+701o15ZXnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAHp75VdxGDCGQBN05bL3_h8P62-v6+5oGW3M7CA+701o15ZXnQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, USB <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjEuMDIuMjAxOCAxNToyNywgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFdlZCwgRmVi
IDIxLCAyMDE4IGF0IDEwOjU1IEFNLCBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PiB3cm90ZToKPj4gU2luY2UgZXh0Y29uIHByb3BlcnR5IGlzIG5vdCBhbGxvd2VkIGluIERULCBl
eHRjb24gc3Vic3lzdGVtIHJlcXVpcmVzCj4+IGFub3RoZXIgd2F5IHRvIGdldCBleHRjb24gZGV2
aWNlLiBMZXRzIHRyeSB0aGUgc2ltcGxlc3QgYXBwcm9hY2ggLSBnZXQKPj4gZWRldiBieSBvZl9u
b2RlLgo+PiArLyoKPj4gKyAqIGV4dGNvbl9nZXRfZWRldl9ieV9vZl9ub2RlIC0gR2V0IHRoZSBl
eHRjb24gZGV2aWNlIGZyb20gZGV2aWNldHJlZS4KPj4gKyAqIEBub2RlICAgICAgIDogT0Ygbm9k
ZSBpZGVudHlmeWluZyBlZGV2Cj4+ICsgKgo+PiArICogUmV0dXJuIHRoZSBwb2ludGVyIG9mIGV4
dGNvbiBkZXZpY2UgaWYgc3VjY2VzcyBvciBFUlJfUFRSKGVycikgaWYgZmFpbC4KPj4gKyAqLwo+
PiArc3RydWN0IGV4dGNvbl9kZXYgKmV4dGNvbl9nZXRfZWRldl9ieV9vZl9ub2RlKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSkKPiBGaXJzdCBvZiBhbGwsIHRoZSBhbGwgb3RoZXIgc2ltaWxhciBj
YXNlcyB1c2UgIl9ieV9ub2RlIiBpbiB0aGUgbmFtZS4KCk9LLCBsb29rcyBiZXR0ZXIuCgo+IFNl
Y29uZCwgaXQncyBub3QgX2dldF8sIGl0J3MgX2ZpbmRfLgoKVGhlIHBhdGNoIHNwbGl0cyBleGlz
aXRpbmcgZXh0Y29uX2dldF9lZGV2X2J5X3BoYW5kbGUgZnVuY3Rpb24gaW50byB0d28KZnVuY3Rp
b25zLCBub3RoaW5nIG1vcmUuClRodXMgaXQgZm9sbG93ZWQgbmFtaW5nIGNvbnZlbnRpb24gcHJl
c2VudCBpbiBleHRjb24gZnJhbWV3b3JrLiBJIGNhbgpzd2l0Y2ggaXQgb2YgY291cnNlIHRvIF9m
aW5kXy4KCj4KPj4gK3sKPj4gKyAgICAgICBzdHJ1Y3QgZXh0Y29uX2RldiAqZWRldjsKPj4gKwo+
PiArICAgICAgIG11dGV4X2xvY2soJmV4dGNvbl9kZXZfbGlzdF9sb2NrKTsKPj4gKyAgICAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5KGVkZXYsICZleHRjb25fZGV2X2xpc3QsIGVudHJ5KQo+PiArICAg
ICAgICAgICAgICAgaWYgKGVkZXYtPmRldi5wYXJlbnQgJiYgZWRldi0+ZGV2LnBhcmVudC0+b2Zf
bm9kZSA9PSBub2RlKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4gKyAg
ICAgICBlZGV2ID0gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPj4gK291dDoKPj4gKyAgICAgICBt
dXRleF91bmxvY2soJmV4dGNvbl9kZXZfbGlzdF9sb2NrKTsKPj4gKwo+PiArICAgICAgIHJldHVy
biBlZGV2Owo+IENhbid0IGl0IGJlIGRvbmUgdXNpbmcgYnVzX2ZpbmRfZGV2aWNlKCk/CgpUaGVy
ZSBpcyBubyBzcGVjaWFsIGV4dGNvbiBidXMsIHNvIEkgYW0gbm90IHN1cmUuIEFueXdheSBpZiBp
dCBjYW4sIGl0CnNob3VsZCBiZSBkb25lIHByb2JhYmx5IGluIGFub3RoZXIgcGF0Y2guCgpSZWdh
cmRzCkFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
