From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-4.11-rc1/drivers/gpu/drm/exynos/exynos5433_drm_decon.c:681:
 suspicious mask ?
Date: Thu, 09 Mar 2017 16:34:09 +0900
Message-ID: <58C10571.9050107@samsung.com>
References: <CGME20170306100527epcas1p349cea73e30f7720a65d312808c4b2cc3@epcas1p3.samsung.com>
 <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Binderman <dcb314@hotmail.com>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "airlied@linux.ie" <airlied@linux.ie>, "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, "javier@osg.samsung.com" <javier@osg.samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gRGF2aWQsCgpUaGFua3MgZm9yIHJlcG9ydC4KCjIwMTfrhYQgMDPsm5QgMDbsnbwgMTk6
MDXsl5AgRGF2aWQgQmluZGVybWFuIOydtCjqsIApIOyTtCDquIA6Cj4gSGVsbG8gdGhlcmUsCj4g
Cj4gbGludXgtNC4xMS1yYzEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9k
ZWNvbi5jOjY4MV06ICh3YXJuaW5nKSBSZXN1bHQgb2Ygb3BlcmF0b3IgJ3wnIGlzIGFsd2F5cyB0
cnVlIGlmIG9uZSBvcGVyYW5kIGlzIG5vbi16ZXJvLiBEaWQgeW91IGludGVuZCB0byB1c2UgJyYn
Pwo+IAoKUmlnaHQuIHRoaXMgaXMga25vd24gaXNzdWUgYW5kIGJlbG93IHBhdGNoIGZpeGVzIHRo
aXMsCmh0dHA6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzEzMjU4OS5odG1s
CgpUaGlzIHBhdGNoIHdpbGwgZ28gdG8gLWZpeGVzLgoKPiBTb3VyY2UgY29kZSBpcwo+IAo+ICAg
ICBpZiAoY3R4LT5vdXRfdHlwZSB8IEk4MF9IV19UUkcpIHsKPiAKPiBBbHNvIGluIHRoZSBzYW1l
IGZpbGU6Cj4gCj4gW2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24u
YzoxMzFdOiAoc3R5bGUpIFNhbWUgZXhwcmVzc2lvbiBvbiBib3RoIHNpZGVzIG9mICd8Jy4KPiAK
PiBTb3VyY2UgY29kZSBpcwo+IAo+ICAgICAgICB3cml0ZWwoVFJJR0NPTl9URV9BVVRPX01BU0sg
fCBUUklHQ09OX1NXVFJJR0VOCj4gICAgICAgICAgICAgICAgfCBUUklHQ09OX1RFX0FVVE9fTUFT
SyB8IFRSSUdDT05fU1dUUklHRU4sCgpJbiB0aGlzIGNhc2UsIG9ubHkgcHJvYmxlbSBpcyB0d28g
ZmxhZ3MgYXJlIHNldCBpbiBkdXBsaWNhdGUuIFRoaXMgc2hvdWxkIGJlIGNsZWFuZWQgdXAuIFRo
YW5rcy4gOikKCj4gCj4gUmVnYXJkcwo+IAo+IERhdmlkIEJpbmRlcm1hbgo+IAo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
