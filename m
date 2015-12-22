From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH v11 17/19] drm: bridge: analogix/dp: expand the look time
 for waiting AUX CH reply
Date: Tue, 22 Dec 2015 21:26:52 +0900
Message-ID: <000a01d13cb4$0f81f510$2e85df30$@com>
References: <1450236018-1118-1-git-send-email-ykk@rock-chips.com>
 <1450238257-3274-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1450238257-3274-1-git-send-email-ykk@rock-chips.com>
Content-Language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Yakir Yang' <ykk@rock-chips.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Mark Yao' <mark.yao@rock-chips.com>, 'Heiko Stuebner' <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, 'Jingoo Han' <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 'Kishon Vijay Abraham I' <kishon@ti.com>, javier@osg.samsung.com, 'Rob Herring' <robh+dt@kernel.org>, 'Andy Yan' <andy.yan@rock-chips.com>, 'Thierry Reding' <treding@nvidia.com>, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkbmVzZGF5LCBEZWNlbWJlciAxNiwgMjAxNSAxMjo1OCBQTSwgWWFraXIgWWFuZyB3cm90
ZToKPiAKPiBBZnRlciB0ZXN0IG9uIHJvY2tjaGlvcCBwbGF0Zm9ybSwgaSBmb3VuZCBzb21ldGlt
cyBkcml2ZXIgd291bGQgZmFpbGVkCj4gYXQgcmVhZGluZyBFRElEIG1lc3NhZ2UuIEFmdGVyIGRl
YnVnZ2luZyBtb3JlLCBpIGZvdW5kIHRoYXQgaXQncyBva2F5Cj4gdG8gcmVhZF9hIGJ5dGUgZnJv
bSBpMmMsIGJ1dCBpdCB3b3VsZCBmYWlsZWQgYXQgQVVYIHRyYW5zY2F0aW9uIGlmIHdlCj4gdHJ5
IHRvIHJlYWR5IG11bHRpLWJ5dGVzIGZyb20gaTJjLgo+IAo+IERyaXZlciBqdXN0IGNhbid0IHJl
Y2VpdmVkIHRoZSBBVVggQ0ggcmVwbHkgY29tbWFuZCwgZXZlbiBubyBBVVggZXJyb3IKPiBjb2Rl
LiBJIG1heSBndWVzcyB0aGF0IHRoZSBBVVggd2FpdCB0aW1lIGlzIG5vdCBlbm91Z2gsIHNvIEkg
dHJ5IHRvCj4gZXhwYW5kIHRoZSBBVVggd2FpdCB0aW1lLCBhbmQgaSBkbyBzZWUgdGhpcyBjb3Vs
ZCBmaXggdGhlIEVESUQgcmVhZAo+IGZhaWxlZCBhdCByb2NrY2hpcCBwbGF0Zm9ybS4KPiAKPiBB
bmQgSSB0aG91Z2h0IHRoYXQgZXhwYW5kIHRoZSB3YWl0IHRpbWUgd29uJ3QgaHVydCBFeHlub3Mg
cGxhdGZvcm0gdG9vCj4gbXVjaCwgY2F1c2UgRXh5bm9zIGRpZG4ndCBoYXZlIHRoaXMgcHJvYmxl
bSwgdGhlbiBkcml2ZXIgd291bGQgcmVjZWl2ZWQKPiB0aGUgcmVwbHkgY29tbWFuZCB2ZXJ5IHNv
b24sIHNvIG5vIG1vcmUgYWRkaXRpb25hbCB3YWl0IHRpbWUgd291bGQgYnJpbmcKPiB0byBFeHlu
b3MgcGxhdGZvcm0uCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hp
cHMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjExOiBOb25lCj4gQ2hhbmdlcyBpbiB2MTA6IE5v
bmUKPiBDaGFuZ2VzIGluIHY5OiBOb25lCj4gQ2hhbmdlcyBpbiB2ODogTm9uZQo+IENoYW5nZXMg
aW4gdjc6IE5vbmUKPiBDaGFuZ2VzIGluIHY2OiBOb25lCj4gQ2hhbmdlcyBpbiB2NTogTm9uZQo+
IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiBDaGFuZ2VzIGluIHYzOiBOb25lCj4gQ2hhbmdlcyBpbiB2
MjogTm9uZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2Rw
X3JlZy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9yZWcuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeF9kcF9yZWcuYwo+IGluZGV4IGM3ZTI5NTkuLmRjMzc2YmQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMKPiBAQCAtNDgy
LDcgKzQ4Miw3IEBAIGludCBhbmFsb2dpeF9kcF9zdGFydF9hdXhfdHJhbnNhY3Rpb24oc3RydWN0
IGFuYWxvZ2l4X2RwX2RldmljZSAqZHApCj4gIAlyZWcgPSByZWFkbChkcC0+cmVnX2Jhc2UgKyBB
TkFMT0dJWF9EUF9JTlRfU1RBKTsKPiAgCXdoaWxlICghKHJlZyAmIFJQTFlfUkVDRUlWKSkgewo+
ICAJCXRpbWVvdXRfbG9vcCsrOwo+IC0JCWlmIChEUF9USU1FT1VUX0xPT1BfQ09VTlQgPCB0aW1l
b3V0X2xvb3ApIHsKPiArCQlpZiAoRFBfVElNRU9VVF9MT09QX0NPVU5UICogMTAgPCB0aW1lb3V0
X2xvb3ApIHsKCk5vLCBJIGhhdGUgdGhpcyBjb2RpbmcuCmFuYWxvZ2l4X2RwX3JlZy5jIGlzIHRo
ZSBjb21tb24gY29kZSB0aGF0IGNhbiBiZSBzaGFyZWQgYnkgdmFyaW91cyBTb0NzLgpQbGVhc2Us
IGZpbmQgYW5vdGhlciB3YXkuCgpCZXN0IHJlZ2FyZHMsCkppbmdvbyBIYW4KCgo+ICAJCQlkZXZf
ZXJyKGRwLT5kZXYsICJBVVggQ0ggY29tbWFuZCByZXBseSBmYWlsZWQhXG4iKTsKPiAgCQkJcmV0
dXJuIC1FVElNRURPVVQ7Cj4gIAkJfQo+IC0tCj4gMS45LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
