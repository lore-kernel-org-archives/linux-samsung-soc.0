From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 05/15] gpio: move DT parsing code to separate functions
Date: Tue, 13 Jan 2015 07:17:29 +0100
Message-ID: <CACRpkdZLw=dTQ0zcHYSJ7rC5k3hjTJ-i__25eDyY8gz6PpnpsA@mail.gmail.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-6-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418226513-14105-6-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkLCBEZWMgMTAsIDIwMTQgYXQgNDo0OCBQTSwgQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4gd3JvdGU6Cgo+IFRoZSBwYXRjaCBtb3ZlcyBEZXZpY2UgVHJlZSBwYXJzaW5n
IGxvZ2ljIHRvIHNlcGFyYXRlCj4gZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKSSB0aGluayB0aGlzIHBhdGNoIG5lZWQgdG8g
YmUgcmViYXNlZCBvbiB0aGUgR1BJTyBkZXZlbCBicmFuY2gsIGJ1dApsb29rcyBsaWtlIGl0IG1h
a2VzIHRoaW5ncyBjbGVhbmVyIHNvIGNhbiBzdGFuZCBvbiBpdHMgb3duIG1lcml0cy4KV2UgbW92
ZXMgc3R1ZmYgYXJvdW5kIGEgYml0IGluIHRoZSBPRiBjb2RlIHRob3VnaC4KClBsZWFzZSByZW1l
bWJlciB0byBzZW5kIHRoaXMgcGF0Y2ggdG8gdGhlIGxpbnV4LWdwaW8gbGlzdCBhbmQgY29tYWlu
dGFpbmVyCkFsZXhhbmRyZSBDb3VyYm90IG9uIHJlcG9zdHMuIChDYy10YWdzIGluIHRoZSBwYXRj
aCBhcmUgZ29vZApmb3IgdGhpcy4pCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
