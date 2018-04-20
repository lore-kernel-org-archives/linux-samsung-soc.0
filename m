From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/2] drm/exynos/mixer: fixes for interlaced mode
Date: Fri, 20 Apr 2018 14:44:32 +0200
Message-ID: <f709ca8c-19e4-e93a-bd78-40bf70b6b6e5@samsung.com>
References: <CGME20180202151126eucas1p2142bfb4a4376aea7763f40ce2630e349@eucas1p2.samsung.com>
 <20180202151123.31082-1-a.hajda@samsung.com>
 <e8e5530d-9b6e-ff9b-3f9e-cf3a5b5b138a@samsung.com>
 <cdd233c8-d800-db1a-d3c5-6444a46cc1d3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cdd233c8-d800-db1a-d3c5-6444a46cc1d3@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTIuMDMuMjAxOCAwODoxMiwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAyMC4wMi4yMDE4
IDA3OjQ1LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBIaSBJbmtpLAo+Pgo+PiBPbiAwMi4wMi4y
MDE4IDE2OjExLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Pj4gSGkgSW5raSwgVG9iaWFzLAo+Pj4K
Pj4+IFRoaXMgaXMgcmV2aWV3ZWQvdXBkYXRlZC90ZXN0ZWQgVG9iaWFzJ3MgcGF0Y2ggYWRkcmVz
c2luZyBwYWdlLWZhdWx0cwo+Pj4gaW4gVmlkZW8gUHJvY2Vzc29yIGluIGludGVybGFjZWQgbW9k
ZS4gUGx1cyBwcmVsaW1pbmFyeSBwYXRjaCBmaXhpbmcgTWl4ZXIKPj4+IGludGVybGFjZWQgbW9k
ZS4KPj4+Cj4+PiBSZWdhcmRzCj4+PiBBbmRyemVqCj4+IEdlbnRsZSBwaW5nLgo+IFBpbmcuCgpQ
aW5nLCBhbG1vc3QgdGhyZWUgbW9udGhzIHBhc3NlZC4KClJlZ2FyZHMKQW5kcnplagoKPgo+IC0t
Cj4gUmVnYXJkcwo+IEFuZHJ6ZWoKPgo+PiBSZWdhcmRzCj4+IEFuZHJ6ZWoKPj4KPj4+IEFuZHJ6
ZWogSGFqZGEgKDEpOgo+Pj4gICBkcm0vZXh5bm9zL21peGVyOiBmaXggc3luY2hyb25pemF0aW9u
IGNoZWNrIGluIGludGVybGFjZWQgbW9kZQo+Pj4KPj4+IFRvYmlhcyBKYWtvYmkgKDEpOgo+Pj4g
ICBkcm0vZXh5bm9zOiBtaXhlcjogYXZvaWQgT29wcyBpbiB2cF92aWRlb19idWZmZXIoKQo+Pj4K
Pj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIHwgMjIgKysrKysrKysr
KysrKysrKystLS0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvcmVncy1taXhlci5oICAg
fCAgMSArCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
