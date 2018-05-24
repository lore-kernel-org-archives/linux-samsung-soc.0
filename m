From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] Exynos DRM - add 2 more planes to Decon on Exynos5433
Date: Thu, 24 May 2018 16:15:01 +0900
Message-ID: <5B066675.2070906@samsung.com>
References: <CGME20180523110016eucas1p1d92dd44b2012805dfbc754a872617bc1@eucas1p1.samsung.com>
 <20180523110002.25512-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180523110002.25512-1-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CgoyMDE464WEIDA17JuUIDIz7J28IDE5OjU57JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg
7JO0IOq4gDoKPiBEZWFyIGFsbCwKPiAKPiBUaGlzIHBhdGNoc2V0IGVuYWJsZXMgc3VwcG9ydCBm
b3IgMiBtb3JlIGhhcmR3YXJlIHdpbmRvd3MgaW4gRXh5bm9zNTQzMwo+IERlY29uJ3MsIHdoYXQg
Z2l2ZXMgdXMgMiBtb3JlIG92ZXJsYXkgcGxhbmVzLiBUaGlzIHJlcXVpcmUgZW5hYmxpbmcKPiBh
IGZldyBtb3JlIGNsb2NrcyB0byBnZXQgaXQgd29ya2luZyBwcm9wZXJseS4KPiAKPiBNeSBtZXJn
ZSBwbGFuIGZvciB0aGlzIHBhdGNoc2V0Ogo+IDEuIGR0cyAocGF0Y2ggMi8zKSAtIHBsZWFzZSBz
Y2hlZHVsZSBmb3IgdjQuMTggbWVyZ2Ugd2luZG93Cj4gMi4gZHJpdmVyIChwYXRjaCAzLzMpIC0g
cGxlYXNlIHNjaGVkdWxlIGZvciB0aGUgbmV4dCByZWxlYXNlIGFmdGVyIGR0cyBpcwo+ICAgIG1l
cmdlZAo+IDMuIGJpbmRpbmdzIChwYXRjaCAxLzMpIC0gcHJvYmFibHkgY2FuIGdvIHRvZ2V0aGVy
IHdpdGggdGhlIGRyaXZlciBwYXRjaAoKTWVyZ2VkIDEgYW5kIDMuCgpUaGFua3MsCklua2kgRGFl
Cgo+IAo+IEJlc3QgcmVnYXJkcwo+IE1hcmVrIFN6eXByb3dza2kKPiBTYW1zdW5nIFImRCBJbnN0
aXR1dGUgUG9sYW5kCj4gCj4gTWFyZWsgU3p5cHJvd3NraSAoMyk6Cj4gICBkdC1iaW5kaW5nczog
ZXh5bm9zNTQzMy1kZWNvbjogYWRkIG1vcmUgcmVxdWlyZWQgY2xvY2tzCj4gICBhcm02NDogZHRz
OiBleHlub3M6IEFkZCBtb3JlIGNsb2NrcyB0byBFeHlub3M1NDMzIERlY29uIGFuZCBEZWNvblRW
Cj4gICBkcm0vZXh5bm9zOiBkZWNvbjogQWRkIHN1cHBvcnQgZm9yIGhhcmR3YXJlIHdpbmRvd3Mg
bm8gNCBhbmQgNQo+IAo+ICAuLi4vZGlzcGxheS9leHlub3MvZXh5bm9zNTQzMy1kZWNvbi50eHQg
ICAgICAgfCAgOSArKysrKystLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1
NDMzLmR0c2kgICAgfCAxNCArKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zNTQzM19kcm1fZGVjb24uYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
