From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/2] drm/exynos/mixer: fixes for interlaced mode
Date: Mon, 12 Mar 2018 08:12:39 +0100
Message-ID: <cdd233c8-d800-db1a-d3c5-6444a46cc1d3@samsung.com>
References: <CGME20180202151126eucas1p2142bfb4a4376aea7763f40ce2630e349@eucas1p2.samsung.com>
 <20180202151123.31082-1-a.hajda@samsung.com>
 <e8e5530d-9b6e-ff9b-3f9e-cf3a5b5b138a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <e8e5530d-9b6e-ff9b-3f9e-cf3a5b5b138a@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAuMDIuMjAxOCAwNzo0NSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBIaSBJbmtpLAo+Cj4g
T24gMDIuMDIuMjAxOCAxNjoxMSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPj4gSGkgSW5raSwgVG9i
aWFzLAo+Pgo+PiBUaGlzIGlzIHJldmlld2VkL3VwZGF0ZWQvdGVzdGVkIFRvYmlhcydzIHBhdGNo
IGFkZHJlc3NpbmcgcGFnZS1mYXVsdHMKPj4gaW4gVmlkZW8gUHJvY2Vzc29yIGluIGludGVybGFj
ZWQgbW9kZS4gUGx1cyBwcmVsaW1pbmFyeSBwYXRjaCBmaXhpbmcgTWl4ZXIKPj4gaW50ZXJsYWNl
ZCBtb2RlLgo+Pgo+PiBSZWdhcmRzCj4+IEFuZHJ6ZWoKPiBHZW50bGUgcGluZy4KClBpbmcuCgot
LQpSZWdhcmRzCkFuZHJ6ZWoKCj4KPiBSZWdhcmRzCj4gQW5kcnplago+Cj4+IEFuZHJ6ZWogSGFq
ZGEgKDEpOgo+PiAgIGRybS9leHlub3MvbWl4ZXI6IGZpeCBzeW5jaHJvbml6YXRpb24gY2hlY2sg
aW4gaW50ZXJsYWNlZCBtb2RlCj4+Cj4+IFRvYmlhcyBKYWtvYmkgKDEpOgo+PiAgIGRybS9leHlu
b3M6IG1peGVyOiBhdm9pZCBPb3BzIGluIHZwX3ZpZGVvX2J1ZmZlcigpCj4+Cj4+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIHwgMjIgKysrKysrKysrKysrKysrKystLS0t
LQo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9yZWdzLW1peGVyLmggICB8ICAxICsKPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
