From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: linux-4.11-rc1/drivers/gpu/drm/exynos/exynos5433_drm_decon.c:681:
 suspicious mask ?
Date: Thu, 09 Mar 2017 09:29:40 +0100
Message-ID: <4809303a-ab12-6246-63b5-b92e928eae2a@samsung.com>
References: <CGME20170306100527epcas1p349cea73e30f7720a65d312808c4b2cc3@epcas1p3.samsung.com>
 <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
 <58C10571.9050107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <58C10571.9050107@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, David Binderman <dcb314@hotmail.com>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "airlied@linux.ie" <airlied@linux.ie>, "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, "javier@osg.samsung.com" <javier@osg.samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkuMDMuMjAxNyAwODozNCwgSW5raSBEYWUgd3JvdGU6Cj4gSGVsbG8gRGF2aWQsCj4KPiBU
aGFua3MgZm9yIHJlcG9ydC4KPgo+IDIwMTfrhYQgMDPsm5QgMDbsnbwgMTk6MDXsl5AgRGF2aWQg
QmluZGVybWFuIOydtCjqsIApIOyTtCDquIA6Cj4+IEhlbGxvIHRoZXJlLAo+Pgo+PiBsaW51eC00
LjExLXJjMS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmM6Njgx
XTogKHdhcm5pbmcpIFJlc3VsdCBvZiBvcGVyYXRvciAnfCcgaXMgYWx3YXlzIHRydWUgaWYgb25l
IG9wZXJhbmQgaXMgbm9uLXplcm8uIERpZCB5b3UgaW50ZW5kIHRvIHVzZSAnJic/Cj4+Cj4gUmln
aHQuIHRoaXMgaXMga25vd24gaXNzdWUgYW5kIGJlbG93IHBhdGNoIGZpeGVzIHRoaXMsCj4gaHR0
cDovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMTMyNTg5Lmh0bWwKPgo+IFRo
aXMgcGF0Y2ggd2lsbCBnbyB0byAtZml4ZXMuCj4KPj4gU291cmNlIGNvZGUgaXMKPj4KPj4gICAg
IGlmIChjdHgtPm91dF90eXBlIHwgSTgwX0hXX1RSRykgewo+Pgo+PiBBbHNvIGluIHRoZSBzYW1l
IGZpbGU6Cj4+Cj4+IFtkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29u
LmM6MTMxXTogKHN0eWxlKSBTYW1lIGV4cHJlc3Npb24gb24gYm90aCBzaWRlcyBvZiAnfCcuCj4+
Cj4+IFNvdXJjZSBjb2RlIGlzCj4+Cj4+ICAgICAgICB3cml0ZWwoVFJJR0NPTl9URV9BVVRPX01B
U0sgfCBUUklHQ09OX1NXVFJJR0VOCj4+ICAgICAgICAgICAgICAgIHwgVFJJR0NPTl9URV9BVVRP
X01BU0sgfCBUUklHQ09OX1NXVFJJR0VOLAo+IEluIHRoaXMgY2FzZSwgb25seSBwcm9ibGVtIGlz
IHR3byBmbGFncyBhcmUgc2V0IGluIGR1cGxpY2F0ZS4gVGhpcyBzaG91bGQgYmUgY2xlYW5lZCB1
cC4gVGhhbmtzLiA6KQoKV3JvbmcgY29weS9wYXN0ZSByZW1vdmVkIHR3byBvdGhlciBmbGFncyBh
bmQgZHVwbGljYXRlZCB0aGVzZSBhYm92ZS4gSXQKZGlkIG5vdCBodXJ0IHRvIG11Y2ggYXMgaXQg
YWZmZWN0cyBvbmx5IHNvZnR3YXJlIHRyaWdnZXIgd2hpY2ggaXMgbm90CnVzZWQgYXRtLgpGaXgg
c2VudCB5ZXN0ZXJkYXkgWzFdLgoKWzFdOiBodHRwOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2Ry
aS1kZXZlbC9tc2cxMzQ4NzcuaHRtbAoKUmVnYXJkcwpBbmRyemVqCgo+Cj4+IFJlZ2FyZHMKPj4K
Pj4gRGF2aWQgQmluZGVybWFuCj4+Cj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
