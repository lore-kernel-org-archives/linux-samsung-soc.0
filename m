From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2 03/12] drm/exynos/decon5433: fix vblank event handling
Date: Thu, 9 Mar 2017 12:54:21 +0900
Message-ID: <50f9ade8-4bb2-6071-6c2b-89ea8f525613@daenzer.net>
References: <1488985126-25288-1-git-send-email-a.hajda@samsung.com>
 <CGME20170308145902eucas1p24636df9b8eafd2b07f12a2c700c6bcea@eucas1p2.samsung.com>
 <1488985126-25288-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1488985126-25288-4-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDgvMDMvMTcgMTE6NTggUE0sIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gQ3VycmVudCBpbXBs
ZW1lbnRhdGlvbiBvZiBldmVudCBoYW5kbGluZyBhc3N1bWVzIHRoYXQgdmJsYW5rIGludGVycnVw
dCBpcwo+IGFsd2F5cyBjYWxsZWQgYXQgdGhlIHJpZ2h0IHRpbWUuIEl0IGlzIG5vdCB0cnVlLCBp
dCBjYW4gYmUgZGVsYXllZCBkdWUgdG8KPiB2YXJpb3VzIHJlYXNvbnMuIEFzIGEgcmVzdWx0IGRp
ZmZlcmVudCByYWNlcyBjYW4gaGFwcGVuLiBUaGUgcGF0Y2ggZml4ZXMKPiB0aGUgaXNzdWUgYnkg
dXNpbmcgaGFyZHdhcmUgZnJhbWUgY291bnRlciBwcmVzZW50IGluIERFQ09OIHRvIHNlcmlhbGl6
ZQo+IHZibGFuayBhbmQgY29tbWl0IGNvbXBsZXRpb24gZXZlbnRzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gdjI6Cj4gICAt
IGFkZGVkIGludGVybmFsIGRlY29uX2dldF9mcmFtZV9jb3VudCBmdW5jdGlvbiwKPiAgIC0gdXBk
YXRlZCBmcmFtZSBjb3VudGVyIG9uIGZsdXNoLAo+ICAgLSBtaXNjIHN0eWxlIGZpeGVzICh0aGFu
ayBJbmtpKQoKWy4uLl0KCj4gQEAgLTU3OSw2ICs2MzYsMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBjb21wb25lbnRfb3BzIGRlY29uX2NvbXBvbmVudF9vcHMgPSB7Cj4gIAkudW5iaW5kID0gZGVj
b25fdW5iaW5kLAo+ICB9Owo+ICAKPiArc3RhdGljIHZvaWQgZGVjb25faGFuZGxlX3ZibGFuayhz
dHJ1Y3QgZGVjb25fY29udGV4dCAqY3R4KQo+ICt7Cj4gKwl1MzIgZnJtOwo+ICsKPiArCXNwaW5f
bG9jaygmY3R4LT52YmxhbmtfbG9jayk7Cj4gKwo+ICsJZnJtID0gZGVjb25fZ2V0X2ZyYW1lX2Nv
dW50KGN0eCwgdHJ1ZSk7Cj4gKwo+ICsJaWYgKGZybSAhPSBjdHgtPmZyYW1lX2lkKSB7Cj4gKwkJ
aWYgKGZybSA+IGN0eC0+ZnJhbWVfaWQpCj4gKwkJCWRybV9jcnRjX2hhbmRsZV92YmxhbmsoJmN0
eC0+Y3J0Yy0+YmFzZSk7CgpUaGlzIGNvbXBhcmlzb24gaXNuJ3Qgc2FmZSBXUlQgdGhlIGNvdW50
ZXIgdmFsdWUgcmV0dXJuZWQgYnkKZGVjb25fZ2V0X2ZyYW1lX2NvdW50IHdyYXBwaW5nIGFyb3Vu
ZC4gSWYgaXQgZ29lcyBhbGwgdGhlIHdheSB1cCB0bwoweGZmZmZmZmZmIGJlZm9yZSB3cmFwcGlu
ZyBhcm91bmQgdG8gemVybywgaXQgY2FuIGJlIGhhbmRsZWQgZS5nLiBieQoKCQlpZiAoKHMzMiko
ZnJtIC0gY3R4LT5mcmFtZV9pZCkgPiAwKQoKb3RoZXJ3aXNlIGl0IGdldHMgYSBiaXQgbW9yZSBj
b21wbGljYXRlZC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgIGh0dHA6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
