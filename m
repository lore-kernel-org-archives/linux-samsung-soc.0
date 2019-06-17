From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Date: Mon, 17 Jun 2019 16:06:31 -0600
Message-ID: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
 <20190616081557.GA3826@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190616081557.GA3826@kozik-lap>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMjoxNiBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDE6MzE6NDNQ
TSAtMDcwMCwgSm9zZXBoIEtvZ3V0IHdyb3RlOgo+ID4gRG9jdW1lbnQgdmVuZG9yIHNwZWNpZmlj
IGNvbXBhdGlibGUgc3RyaW5nIGZvciBNYWxpIGdwdXMgb24gRXh5bm9zIFNvQ3MuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1t
aWRnYXJkLnR4dCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+ID4gaW5kZXggMWIxYTc0MTI5MTQxLi5hOTcwNGM3MzZk
MDcgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1
L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gPiBAQCAtMTgsNiArMTgsNyBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAgICArICJhbWxvZ2ljLG1lc29uLWd4bS1tYWxpIgo+
ID4gICAgICArICJyb2NrY2hpcCxyazMyODgtbWFsaSIKPiA+ICAgICAgKyAicm9ja2NoaXAscmsz
Mzk5LW1hbGkiCj4gPiArICAgICsgInNhbXN1bmcsZXh5bm9zLW1hbGkiCj4KPiBBcmUgdGhlcmUg
YW55IGRyaXZlciBkaWZmZXJlbmNlcyBmb3IgRXh5bm9zPyBJZiBub3QgdGhlbiB3aHkgYWRkaW5n
Cj4gYW5vdGhlciBjb21wYXRpYmxlPwoKV3JvbmcgcXVlc3Rpb24uIEFyZSB0aGVyZSBhbnkgaGFy
ZHdhcmUgZGlmZmVyZW5jZXM/IChUcmljayBxdWVzdGlvbgpiZWNhdXNlIGRpZmZlcmVuY2UgY29t
cGFyZWQgdG8gd2hhdD8pCgpSZWFsbHksIHRoaXMgc2hvdWxkbid0IGJlICdleHlub3MnLCBidXQg
cGVyIFNvQy4gQnV0IEknbGwgbGVhdmUgaXQgdG8KdGhlIFNhbXN1bmcgZm9sa3MgdG8gZGVjaWRl
IGhvdyBzcGVjaWZpYyBpdCBzaG91bGQgYmUuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
