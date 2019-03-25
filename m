From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 RESEND 01/24] arm64: dts: exynos: configure GSCALER
 related clocks
Date: Mon, 25 Mar 2019 09:44:06 +0100
Message-ID: <CAJKOXPfGTaDvNZUVjRjU4K26jchmN9AUFuwjTE65KZacb+PsCA@mail.gmail.com>
References: <CGME20190325071353eucas1p13470b85473aa92b25d38fcf4eceea76e@eucas1p1.samsung.com>
 <20190325071349.22600-1-a.hajda@samsung.com>
 <20190325071349.22600-2-a.hajda@samsung.com>
 <CAJKOXPf5c0Tu9FwOA0rj7w7T6C3Kcw6exRdnZrqk7PWmNtz4Sg@mail.gmail.com>
 <666e6797-f7f8-df7e-172b-d186bf83f056@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <666e6797-f7f8-df7e-172b-d186bf83f056@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCAyNSBNYXIgMjAxOSBhdCAwOTozMiwgQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1z
dW5nLmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS4wMy4yMDE5IDA4OjUwLCBLcnp5c3p0b2YgS296bG93
c2tpIHdyb3RlOgo+ID4gT24gTW9uLCAyNSBNYXIgMjAxOSBhdCAwODoxMywgQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPj4gR1NDQUxFUiBzaG91bGQgYmUgZmVl
ZCB3aXRoIGNsb2NrIGF0IGNlcnRhaW4gcmF0ZXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+ID4+IC0tLQo+ID4+IEFscmVhZHkg
bWVyZ2VkICEhIQo+ID4gVGhlbiB5b3Ugc2hvdWxkIHNraXAgaXQgYmVjYXVzZSBzb21lb25lIG1p
Z2h0IG5vdCBub3RpY2UgaXQgYW5kIGFwcGx5Cj4gPiBzZWNvbmQgdGltZS4KPgo+Cj4gSSB3YXMg
YXNrZWQgdG8gcmViYXNlIHRoZSBwYXRjaHNldCBvbiBleHlub3MtZHJtLW5leHQsIGJ1dCBpdCBk
b2VzIG5vdAo+IGNvbnRhaW5zIHlldCB0aGVzZSBwYXRjaGVzLAo+Cj4gc28gd2l0aG91dCBhZGRp
bmcgaXQgaGVyZSAic29tZW9uZSBtaWdodCBub3Qgbm90aWNlIGl0IGFuZCIgY2FuIGNvbXBsYWlu
Cj4gdGhhdCBwYXRjaHNldCBpcyBicm9rZW4gOikKPgo+IE1heWJlIGJldHRlciBzb2x1dGlvbiB3
b3VsZCBiZSBwb2ludCB0byBwb2ludCBvdXQgc2Ftc3VuZy1zb2MgdHJlZSB0YWcKPiB3aGljaCBz
aG91bGQgZXh5bm9zLWRybS1uZXh0IGJlIGJhc2VkIG9uPyBOZXh0IHRpbWUgSSB3aWxsIHRyeSB0
aGlzIHdheS4KClllcywgSSBzZWUuIElmIG5lZWRlZCwgSSBjYW4gcHJvdmlkZSBzdGFibGUgdGFn
IHdpdGggRFRTIHBhdGNoZXMKaG93ZXZlciBpbiBnZW5lcmFsIHRoaXMgaXMgZGlzY291cmFnZWQg
YmVjYXVzZSBpdCBtZWFucyB0aGF0IHlvdSBicmVhawp0aGUgQUJJLiBVcGRhdGVkIGRyaXZlciBk
b2VzIG5vdCB3b3JrIHdpdGggb2xkIERUQnMuLi4gc28gdGhlIGJlc3Qgd2F5CmlzIHRvIHNwbGl0
IHRoZSBwYXRjaHNldCBhbmQgYnJpbmcgaW4gdGhlIHNlY29uZCBwYXJ0IG9mIGRyaXZlcgpjaGFu
Z2VzIGxhdGVyLiA6KQoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
