From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [RFC PATCH v3 3/5] drm/bridge/analogix: Do not use device's
 drvdata
Date: Tue, 17 Oct 2017 19:42:38 -0400
Message-ID: <000001d347a1$9f11ffa0$dd35fee0$@gmail.com>
References: <20171017080925.23763-1-jeffy.chen@rock-chips.com>
 <20171017080925.23763-4-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171017080925.23763-4-jeffy.chen@rock-chips.com>
Content-language: en-us
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Jeffy Chen' <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org
Cc: 'Daniel Vetter' <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 'Laurent Pinchart' <Laurent.pinchart@ideasonboard.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, briannorris@chromium.org, 'Krzysztof Kozlowski' <krzk@kernel.org>, linux-rockchip@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>, 'Caesar Wang' <wxt@rock-chips.com>, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net, 'zain wang' <wzz@rock-chips.com>, 'Tomeu Vizoso' <tomeu.vizoso@collabora.com>, dmitry.torokhov@gmail.com, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, dianders@chromium.org, tfiga@chromium.org, 'Kyungmin Park' <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlc2RheSwgT2N0b2JlciAxNywgMjAxNyA0OjA5IEFNLCBKZWZmeSBDaGVuIHdyb3RlOgo+
IAo+IEZyb206IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+Cj4gCj4gVGhlIGRyaXZl
ciB0aGF0IGluc3RhbnRpYXRlcyB0aGUgYnJpZGdlIHNob3VsZCBvd24gdGhlIGRydmRhdGEsIGFz
IGFsbAo+IGRyaXZlciBtb2RlbCBjYWxsYmFja3MgKHByb2JlLCByZW1vdmUsIHNodXRkb3duLCBQ
TSBvcHMsIGV0Yy4pIGFyZSBhbHNvCj4gb3duZWQgYnkgaXRzIGRyaXZlciBzdHJ1Y3QuIE1vcmVv
dmVyLCBzdG9yaW5nIHR3byBkaWZmZXJlbnQgcG9pbnRlcgo+IHR5cGVzIGluIGRyaXZlciBkYXRh
IGRlcGVuZGluZyBvbiBkcml2ZXIgaW5pdGlhbGl6YXRpb24gc3RhdHVzIGlzIGJhcmVseQo+IGEg
Z29vZCBwcmFjdGljZSBhbmQgaW4gZmFjdCBoYXMgbGVkIHRvIG1hbnkgYnVncyBpbiB0aGlzIGRy
aXZlci4KPiAKPiBMZXQncyBjbGVhbiB1cCB0aGlzIG1lc3MgYW5kIGNoYW5nZSBBbmFsb2dpeCBl
bnRyeSBwb2ludHMgdG8gc2ltcGx5Cj4gYWNjZXB0IHNvbWUgb3BhcXVlIHN0cnVjdCBwb2ludGVy
LCBhZGp1c3RpbmcgdGhlaXIgdXNlcnMgYXQgdGhlIHNhbWUKPiB0aW1lIHRvIGF2b2lkIGJyZWFr
aW5nIHRoZSBjb21waWxhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogRmlnYSA8dGZp
Z2FAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEplZmZ5IENoZW4gPGplZmZ5LmNoZW5A
cm9jay1jaGlwcy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+CgpBY2tlZC1ieTogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+CgpC
ZXN0IHJlZ2FyZHMsCkppbmdvbyBIYW4KCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+
IENoYW5nZXMgaW4gdjI6IE5vbmUKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeF9kcF9jb3JlLmMgfCA1MCArKysrKysrKystLS0tLS0tLQo+IC0tLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMgICAgICAgICAgICAgICAgIHwgMjYgKysr
KysrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlw
LmMgICAgfCA0NworKysrKysrKysrKy0tLS0tLS0KPiAtLQo+ICBpbmNsdWRlL2RybS9icmlkZ2Uv
YW5hbG9naXhfZHAuaCAgICAgICAgICAgICAgICAgICB8IDE5ICsrKystLS0tCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
