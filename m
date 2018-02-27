From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: exynos: add OF graph between MHL and
 USB connector
Date: Tue, 27 Feb 2018 08:06:18 +0100
Message-ID: <513ee866-a44e-5969-4584-0385029e0356@samsung.com>
References: <CGME20180221085607eucas1p1a08c82fac832049d79705b4222422fa9@eucas1p1.samsung.com>
 <20180221085541.14556-1-a.hajda@samsung.com>
 <20180221085541.14556-5-a.hajda@samsung.com>
 <CAJKOXPczu67vPQEzQZvFRZGVNBpk0U6GJhSnb4dYWSgTY+Unog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAJKOXPczu67vPQEzQZvFRZGVNBpk0U6GJhSnb4dYWSgTY+Unog@mail.gmail.com>
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjYuMDIuMjAxOCAxNjoyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBXZWQs
IEZlYiAyMSwgMjAxOCBhdCA5OjU1IEFNLCBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPiB3cm90ZToKPj4gT0YgZ3JhcGggZGVzY3JpYmVzIE1ITCBkYXRhIGxhbmVzIGJldHdlZW4g
TUhMIGFuZCByZXNwZWN0aXZlIFVTQgo+PiBjb25uZWN0b3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4+IC0tLQo+PiB2NDoKPj4gLSBh
ZGRlZCBtaXNzaW5nIHJlZyBwcm9wZXJ0eSBpbiBjb25uZWN0b3IncyBwb3J0IG5vZGUgKEtyenlz
enRvZikKPj4gLS0tCj4+ICAuLi4vYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1v
bi5kdHNpICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IFlvdSBoYXZlIGEgZHVwbGljYXRl
ZCAnfTsnIHNvIGtidWlsZCBjb21wbGFpbnMgc28gSSBhc3N1bWUgdGhlcmUgd2lsbAo+IGJlIG5l
eHQgaXRlcmF0aW9uIG9mIHRoaXMuIEJlc2lkZSB0aGF0IEkgYW0gb2theSB3aXRoIGJvdGgsIHNv
IEkgd2lsbAo+IHRha2UgbmV4dCB2ZXJzaW9uIHdoZW4geW91ciBiaW5kaW5ncyBhbmQgZHJpdmVy
IGNoYW5nZXMgZ2V0Cj4gYWNrZWQvYWNjZXB0ZWQuCgpZZXMsIHRlc3Qgcm9ib3QgYWxyZWFkeSBy
ZXBvcnRlZCBpdCwgdGhhbmtzIGZvciBsb29raW5nIGF0IGl0LgpJIGhhdmUgcG9zdHBvbmVkIG5l
eHQgaXRlcmF0aW9uIGluIGNhc2UgYW55dGhpbmcgbmV3IGlzIHNwb3R0ZWQsIGJ1dApzaW5jZSBp
dCBpcyBjYWxtIEkgd2lsbCBzZW5kIGl0IGluIGZldyBtaW51dGVzLgoKUmVnYXJkcwpBbmRyemVq
Cgo+Cj4gQmVzdCBSZWdhcmRzLAo+IEtyenlzenRvZgo+IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXNhbXN1bmctc29j
IiBpbgo+IHRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3Jn
Cj4gTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRv
bW8taW5mby5odG1sCj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
