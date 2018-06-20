From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/9] dt-bindings: display: add DT bindings for BOE
 HV070WSA-100 panel
Date: Wed, 20 Jun 2018 12:25:12 -0600
Message-ID: <20180620182512.GA14562@rob-hp-laptop>
References: <1529396370-18761-1-git-send-email-m.purski@samsung.com>
 <CGME20180619082000eucas1p1c5cc2b526583c3fd5e9fc13656ed4858@eucas1p1.samsung.com>
 <1529396370-18761-5-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1529396370-18761-5-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBKdW4gMTksIDIwMTggYXQgMTA6MTk6MjVBTSArMDIwMCwgTWFjaWVqIFB1cnNraSB3
cm90ZToKPiBGcm9tOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IAo+IFRo
ZSBwYXRjaCBhZGRzIGJpbmRpbmdzIHRvIEJPRSBIVjA3MC1XU0EgV1NWR0EgcGFuZWwuCj4gQmlu
ZGluZ3MgYXJlIGNvbXBhdGlibGUgd2l0aCBzaW1wbGUgcGFuZWwgYmluZGluZ3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNYWNpZWogUHVyc2tpIDxtLnB1cnNraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLGh2MDcwd3NhLTEwMC50eHQgICAgfCAyOCArKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9ib2UsaHYwNzB3c2EtMTAwLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsaHYwNzB3c2EtMTAw
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2Jv
ZSxodjA3MHdzYS0xMDAudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
Li45ZThlZWE4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSxodjA3MHdzYS0xMDAudHh0Cj4gQEAgLTAsMCAr
MSwyOCBAQAo+ICtCT0UgSFYwNzBXU0EtMTAwIDcuMDEiIFdTVkdBIFRGVCBMQ0QgcGFuZWwKPiAr
Cj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJib2Us
aHYwNzB3c2EtMTAwIgo+ICstIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhl
IFZDQyBzdXBwbHkgdm9sdGFnZSAoMy4zIHZvbHRzKQo+ICstIGVuYWJsZS1ncGlvOiBHUElPIHBp
biB0byBlbmFibGUgYW5kIGRpc2FibGUgcGFuZWwgKGFjdGl2ZSBoaWdoKQoKZW5hYmxlLWdwaW9z
CgpXaXRoIHRoYXQsCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
