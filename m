From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Tue, 8 Dec 2015 00:36:48 +0900
Message-ID: <CAAQKjZMgse2n0TcjLiBxDn6ddTNSaRKMxoBqU7u8u002W=hRWQ@mail.gmail.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <56658C78.8090509@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56658C78.8090509@osg.samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSmF2aWVyLAoKMjAxNS0xMi0wNyAyMjo0MSBHTVQrMDk6MDAgSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJAb3NnLnNhbXN1bmcuY29tPjoKPiBIZWxsbyBJbmtpLAo+Cj4gT24gMTIv
MDcvMjAxNSAwOTo1MiBBTSwgSW5raSBEYWUgd3JvdGU6Cj4+IEZyb206IEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KPj4KPgo+IFRoYW5rcyBhIGxvdCBm
b3IgcG9zdGluZyB0aGlzIHBhdGNoLgo+Cj4+IFRoZSBEVCBiaW5kaW5nIGZvciB0aGUgRXh5bm9z
IERSTSBEaXNwbGF5IFBvcnQgKERQKSBkcml2ZXIgaXNuJ3QgY29uc2lzdGVudAo+PiBzaW5jZSBp
dCB1c2VzIGEgcGhhbmRsZSB0byBkZXNjcmliZSB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBE
UCBwb3J0IGFuZAo+PiB0aGUgZGlzcGxheSBwYW5lbCBidXQgdXNlcyB0aGUgT0YgZ3JhcGggcG9y
dHMgYW5kIGVuZHBvaW50cyB0byBkZXNjcmliZSB0aGUKPj4gY29ubmVjdGlvbiBiZXR3ZW4gdGhl
IERQIHBvcnQsIGEgYnJpZGdlIGNoaXAgYW5kIHRoZSBwYW5lbC4KPj4KPj4gVGhlIEV4eW5vcyBE
UCBkcml2ZXIgYW5kIHRoZSBEVCBiaW5kaW5nIGhhdmUgYmVlbiBjaGFuZ2VkIHRvIGFsbG93IGFs
c28gdG8KPj4gZGVzY3JpYmUgdGhlIERQIHBvcnQgdG8gcGFuZWwgY29ubmVjdGlvbiB1c2luZyBw
b3J0cyAvIGVuZHBvaW50cyAoT0YgZ3JhcGgpCj4+IHNvIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUg
RXh5bm9zNTgwMCBQZWFjaCBQaSBEVCB0byBtYWtlIGl0IGNvbnNpc3RlbnQgd2l0aAo+PiB0aGUg
RXh5bm9zNTQyMCBQZWFjaCBQaXQgdGhhdCBoYXMgYSBlRFAgdG8gTFZEUyBjaGlwIGFuZCB1c2Vz
IE9GIGdyYXBoIHRvby4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzIDxqYXZpZXJAb3NnLnNhbXN1bmcuY29tPgo+PiBUZXN0ZWQtYnk6IEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KPgo+IFRoaXMgdGFnIHdhcyBub3Qg
aW4gbXkgb3JpZ2luYWwgcGF0Y2gsIGl0J3MgdHJ1ZSB0aGF0IEkgdGVzdGVkCj4gaXQgYnV0IHdp
bGwgc29tZW9uZSBiZWxpZXZlIG1lPyA7KQoKT29wcy4gSSBjb25mdXNlZCB5b3Ugc3ByZWFkIFJl
dmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgaGVyZSBhbmQgdGhlcmUuCkRvbid0IHdvcnJ5IGFib3V0
IHRoYXQuIFdpbGwgcmVtb3ZlIGl0IGlmIHlvdSBkb24ndCBnaXZlIG1lIFRlc3RlZC1ieS4KOikK
ClRoYW5rcywKSW5raSBEYWUKCj4KPj4gUmV2aWV3ZWQtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBz
YW1zdW5nLmNvbT4KPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPgo+IEJlc3QgcmVnYXJkcywK
PiAtLQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcwo+IE9wZW4gU291cmNlIEdyb3VwCj4gU2Ft
c3VuZyBSZXNlYXJjaCBBbWVyaWNhCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
