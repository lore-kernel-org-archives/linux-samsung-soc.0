From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/2] drm/exynos/mixer: fixes for interlaced mode
Date: Mon, 23 Apr 2018 08:29:55 +0900
Message-ID: <5ADD1AF3.7000800@samsung.com>
References: <CGME20180202151126eucas1p2142bfb4a4376aea7763f40ce2630e349@eucas1p2.samsung.com>
 <20180202151123.31082-1-a.hajda@samsung.com>
 <e8e5530d-9b6e-ff9b-3f9e-cf3a5b5b138a@samsung.com>
 <cdd233c8-d800-db1a-d3c5-6444a46cc1d3@samsung.com>
 <f709ca8c-19e4-e93a-bd78-40bf70b6b6e5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <f709ca8c-19e4-e93a-bd78-40bf70b6b6e5@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CgoyMDE464WEIDA07JuUIDIw7J28IDIxOjQ07JeQIEFuZHJ6ZWogSGFqZGEg7J20KOqwgCkg7JO0
IOq4gDoKPiBPbiAxMi4wMy4yMDE4IDA4OjEyLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBPbiAy
MC4wMi4yMDE4IDA3OjQ1LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Pj4gSGkgSW5raSwKPj4+Cj4+
PiBPbiAwMi4wMi4yMDE4IDE2OjExLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Pj4+IEhpIElua2ks
IFRvYmlhcywKPj4+Pgo+Pj4+IFRoaXMgaXMgcmV2aWV3ZWQvdXBkYXRlZC90ZXN0ZWQgVG9iaWFz
J3MgcGF0Y2ggYWRkcmVzc2luZyBwYWdlLWZhdWx0cwo+Pj4+IGluIFZpZGVvIFByb2Nlc3NvciBp
biBpbnRlcmxhY2VkIG1vZGUuIFBsdXMgcHJlbGltaW5hcnkgcGF0Y2ggZml4aW5nIE1peGVyCj4+
Pj4gaW50ZXJsYWNlZCBtb2RlLgo+Pj4+Cj4+Pj4gUmVnYXJkcwo+Pj4+IEFuZHJ6ZWoKPj4+IEdl
bnRsZSBwaW5nLgo+PiBQaW5nLgo+IAo+IFBpbmcsIGFsbW9zdCB0aHJlZSBtb250aHMgcGFzc2Vk
Lgo+CgpPb3BzLCByZWFsbHkgc29ycnkuIEkgZm9yZ290IHRoaXMuIE1lcmdlZC4KClRoYW5rcywK
SW5raSBEYWUKIAo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4+Cj4+IC0tCj4+IFJlZ2FyZHMKPj4g
QW5kcnplago+Pgo+Pj4gUmVnYXJkcwo+Pj4gQW5kcnplago+Pj4KPj4+PiBBbmRyemVqIEhhamRh
ICgxKToKPj4+PiAgIGRybS9leHlub3MvbWl4ZXI6IGZpeCBzeW5jaHJvbml6YXRpb24gY2hlY2sg
aW4gaW50ZXJsYWNlZCBtb2RlCj4+Pj4KPj4+PiBUb2JpYXMgSmFrb2JpICgxKToKPj4+PiAgIGRy
bS9leHlub3M6IG1peGVyOiBhdm9pZCBPb3BzIGluIHZwX3ZpZGVvX2J1ZmZlcigpCj4+Pj4KPj4+
PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDIyICsrKysrKysrKysr
KysrKysrLS0tLS0KPj4+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9yZWdzLW1peGVyLmggICB8
ICAxICsKPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCj4gCj4gCj4gLS0KPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMg
bGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtc2Ftc3VuZy1zb2MiIGluCj4g
dGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKPiBNb3Jl
IG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZv
Lmh0bWwKPiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
