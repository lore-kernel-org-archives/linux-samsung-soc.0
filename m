From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 18/23] arm64: dts: exynos: add DSD/GSD clocks to DECONs
 and GSCALERs
Date: Tue, 5 Mar 2019 10:37:53 +0100
Message-ID: <CAJKOXPd8hWaADUcCd=GU_V=APA8DCV71xzb5AjwA0HH9q4yO8Q@mail.gmail.com>
References: <CGME20190301122112eucas1p2d389c3d94c691507d5ac2c3d224e2e32@eucas1p2.samsung.com>
 <20190301122055.7135-1-a.hajda@samsung.com>
 <20190301122055.7135-19-a.hajda@samsung.com>
 <CAJKOXPdjJ1Mu41Vn51dF3zr5i-MaswWhz92ZVkToYw+a9q_Y9w@mail.gmail.com>
 <f2d5d6d6-e0e4-a2bf-640c-9bb347d70bec@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f2d5d6d6-e0e4-a2bf-640c-9bb347d70bec@samsung.com>
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

T24gVHVlLCA1IE1hciAyMDE5IGF0IDEwOjM2LCBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1
bmcuY29tPiB3cm90ZToKPgo+IE9uIDA1LjAzLjIwMTkgMTA6MjgsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gPiBPbiBGcmksIDEgTWFyIDIwMTkgYXQgMTM6MjQsIEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4+IFRvIHN1cHBvcnQgbG9jYWwgcGF0aHMg
Ym90aCBERUNPTiBhbmQgR1NDQUxFUiBzaG91bGQgZW5hYmxlIHJlc3BlY3RpdmUKPiA+PiBTbWFy
dCBEZWNrIGNsb2NrcyBEU0QgYW5kIEdTRC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRzaSB8IDI1ICsrKysrKysrKysrKystLS0tLS0t
LS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQo+ID4gSGkgQW5kcnplaiwKPiA+Cj4gPiBZb3UgZGlkIG5vdCBDQyBtZSBvbiBEVFMgcGF0Y2hl
cy4gVGhlIERUUyBzaG91bGQgZ28gdGhyb3VnaCBhcm0tc29jIERUCj4gPiBicmFuY2gsIG5vdCB0
aHJvdWdoIGRyaXZlcnMvc3Vic3lzdGVtLgo+ID4KPiA+IEFueSBkZXBlbmRlbmNpZXMgaGVyZSBh
bmQgaW4gbmV4dCBwYXRjaD8KPgo+Cj4gVXBzLCBmb3JnaXZlIG1lIG15IGRpc3RyYWN0aW9uLiBE
VFMgcGF0Y2hlcyBzaG91bGQgYmUgYXBwbGllZCBiZWZvcmUKPiBmb2xsb3dpbmcgZHJpdmVyIGNo
YW5nZXMuCgpJIGNhbiB0YWtlIHRoZW0gYWZ0ZXIgbWVyZ2Ugd2luZG93IGFuZCBlaXRoZXIgcHJl
cGFyZSBhIHNlcGFyYXRlCmJyYW5jaCt0YWcgb3IgdGhlIGZvbGxvd2luZyBkcml2ZXIgY2hhbmdl
cyB3aWxsIHdhaXQgdGlsbCBuZXh0CnJlbGVhc2UuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
