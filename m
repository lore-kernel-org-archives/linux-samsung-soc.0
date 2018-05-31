From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/10] panel/hv070wsa-100: add DT bindings
Date: Wed, 30 May 2018 23:00:27 -0500
Message-ID: <20180531040027.GA20068@rob-hp-laptop>
References: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
 <CGME20180530121626eucas1p288656bbbace0c333decadff418e13c34@eucas1p2.samsung.com>
 <1527682561-1386-6-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1527682561-1386-6-git-send-email-m.purski@samsung.com>
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

T24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMDI6MTU6NTZQTSArMDIwMCwgTWFjaWVqIFB1cnNraSB3
cm90ZToKPiBGcm9tOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKImR0LWJp
bmRpbmdzOiBkaXNwbGF5OiAuLi4iIGlzIHByZWZlcnJlZCBzdWJqZWN0IHByZWZpeC4KCj4gCj4g
VGhlIHBhdGNoIGFkZHMgYmluZGluZ3MgdG8gQk9FIEhWMDcwLVdTQSBXU1ZHQSBwYW5lbC4KPiBC
aW5kaW5ncyBhcmUgY29tcGF0aWJsZSB3aXRoIHNpbXBsZSBwYW5lbCBiaW5kaW5ncy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IE1hY2llaiBQdXJza2kgPG0ucHVyc2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSxodjA3MHdzYS0xMDAudHh0
ICAgICAgICAgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYm9lLGh2MDcwd3NhLTEwMC50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLGh2MDcwd3NhLTEw
MC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9i
b2UsaHYwNzB3c2EtMTAwLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MC4uYmZjMjBhYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsaHYwNzB3c2EtMTAwLnR4dAo+IEBAIC0wLDAg
KzEsNyBAQAo+ICtCT0UgSFYwNzBXU0EtMTAwIDcuMDEiIFdTVkdBIFRGVCBMQ0QgcGFuZWwKPiAr
Cj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJib2Us
aHYwNzB3c2EtMTAwIgo+ICsKPiArVGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUg
c2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAo+ICtpbiBzaW1wbGUtcGFu
ZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgoKWW91IGhhdmUgdG8gc3RhdGUgZXhhY3RseSB3aGlj
aCBwcm9wZXJ0aWVzIGFwcGx5LiBEb2VzIHRoaXMgcGFuZWwgaGF2ZSBhIApiYWNrbGlnaHQ/IDEg
c3VwcGx5LCAyIHN1cHBsaWVzLCBubyBzdXBwbGllcz8KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
