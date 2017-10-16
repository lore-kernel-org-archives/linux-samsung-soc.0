From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/bridge/analogix: Do not use device's
 drvdata
Date: Mon, 16 Oct 2017 12:44:09 +0200
Message-ID: <be199812-9fc5-11ec-cca4-5b9fcff57070@samsung.com>
References: <20171016100640.26575-1-jeffy.chen@rock-chips.com>
 <CGME20171016100746epcas2p436f3573bcb862275aea1869aabe4ad17@epcas2p4.samsung.com>
 <20171016100640.26575-5-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20171016100640.26575-5-jeffy.chen@rock-chips.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org
Cc: rjw@rjwysocki.net, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, briannorris@chromium.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Caesar Wang <wxt@rock-chips.com>, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, zain wang <wzz@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, dmitry.torokhov@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>, dianders@chromium.org, tfiga@chromium.org, Kyungmin Park <kyungmin.park@samsung.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTYuMTAuMjAxNyAxMjowNiwgSmVmZnkgQ2hlbiB3cm90ZToKPiBGcm9tOiBUb21hc3ogRmln
YSA8dGZpZ2FAY2hyb21pdW0ub3JnPgo+Cj4gVGhlIGRyaXZlciB0aGF0IGluc3RhbnRpYXRlcyB0
aGUgYnJpZGdlIHNob3VsZCBvd24gdGhlIGRydmRhdGEsIGFzIGFsbAo+IGRyaXZlciBtb2RlbCBj
YWxsYmFja3MgKHByb2JlLCByZW1vdmUsIHNodXRkb3duLCBQTSBvcHMsIGV0Yy4pIGFyZSBhbHNv
Cj4gb3duZWQgYnkgaXRzIGRyaXZlciBzdHJ1Y3QuIE1vcmVvdmVyLCBzdG9yaW5nIHR3byBkaWZm
ZXJlbnQgcG9pbnRlcgo+IHR5cGVzIGluIGRyaXZlciBkYXRhIGRlcGVuZGluZyBvbiBkcml2ZXIg
aW5pdGlhbGl6YXRpb24gc3RhdHVzIGlzIGJhcmVseQo+IGEgZ29vZCBwcmFjdGljZSBhbmQgaW4g
ZmFjdCBoYXMgbGVkIHRvIG1hbnkgYnVncyBpbiB0aGlzIGRyaXZlci4KPgo+IExldCdzIGNsZWFu
IHVwIHRoaXMgbWVzcyBhbmQgY2hhbmdlIEFuYWxvZ2l4IGVudHJ5IHBvaW50cyB0byBzaW1wbHkK
PiBhY2NlcHQgc29tZSBvcGFxdWUgc3RydWN0IHBvaW50ZXIsIGFkanVzdGluZyB0aGVpciB1c2Vy
cyBhdCB0aGUgc2FtZQo+IHRpbWUgdG8gYXZvaWQgYnJlYWtpbmcgdGhlIGNvbXBpbGF0aW9uLgo+
Cj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKZWZmeSBDaGVuIDxqZWZmeS5jaGVuQHJvY2stY2hpcHMuY29tPgoKVGhhbmtz
IGZvciBtYWtpbmcgaXQgYSBiaXQgc2FuZXIuCgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
