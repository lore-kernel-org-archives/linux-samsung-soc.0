From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCHv5 04/11] exynos_hdmi: add CEC notifier support
Date: Fri, 31 Mar 2017 10:05:25 +0200
Message-ID: <b4c6a816-fd67-35f2-c740-6abf77d5d9b6@xs4all.nl>
References: <20170329141543.32935-1-hverkuil@xs4all.nl>
 <20170329141543.32935-5-hverkuil@xs4all.nl>
 <20170330223527.GK7909@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170330223527.GK7909@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMzEvMDMvMTcgMDA6MzUsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCB3cm90ZToKPiBPbiBX
ZWQsIE1hciAyOSwgMjAxNyBhdCAwNDoxNTozNlBNICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6
Cj4+ICsJY2VjX25vdGlmaWVyX3NldF9waHlzX2FkZHIoaGRhdGEtPm5vdGlmaWVyLAo+PiArCQkJ
CSAgIGNlY19nZXRfZWRpZF9waHlzX2FkZHIoZWRpZCkpOwo+IAo+IFRoaXMgcGF0dGVybiBjYXVz
ZXMgcHJvYmxlbXMgLSBjYW4gd2UgaGF2ZSB0aGUgbm90aWZpZXIgdGFraW5nIHRoZSBFRElECj4g
cGxlYXNlLCBhbmQgc3R1YnMgaW4gY2VjLW5vdGlmaWVyLmggdG8gc3R1YiB0aGF0IG91dD8KPiAK
PiBNYXliZSBzb21ldGhpbmcgbGlrZSBjZWNfbm90aWZpZXJfc2V0X3BoeXNfYWRkcl9mcm9tX2Vk
aWQoZWRpZCkgPwoKR29vZCBwb2ludC4gSSd2ZSBhZGRlZCB0aGlzLCBhbmQgYXMgYW4gZXh0cmEg
Ym9udXMgdGhpcyBhbGxvd2VkIG1lIHRvIGRyb3AKdGhlIGZpcnN0IGNlYy1lZGlkIHBhdGNoLgoK
PiAKPiBIYXZpbmcgY29udmVydGVkIHRoZSB0ZGE5OTh4IGNvZGUgb3ZlciB0byB5b3VyIG5ldyBu
b3RpZmllciwgdGhlIDAtZGF5Cj4gYnVpbGRlciByZXBvcnRlZCB0aGlzIHRvbmlnaHQ6Cj4gCj4+
PiBFUlJPUjogImNlY19nZXRfZWRpZF9waHlzX2FkZHIiIFtkcml2ZXJzL2dwdS9kcm0vaTJjL3Rk
YTk5OHgua29dIHVuZGVmaW5lZCEKPiAKPiB3aGljaCBpcyBjYXVzZWQgZXhhY3RseSBieSB0aGlz
IHByb2JsZW0uICBJIGNhbiBhZGQgI2lmZGVmcyBpbnRvIHRoZQo+IHRkYTk5OHggZHJpdmVyLCBi
dXQgYXMgeW91J3JlIGFscmVhZHkgc3R1YmJpbmcgb3V0Cj4gY2VjX25vdGlmaWVyX3NldF9waHlz
X2FkZHIoKSBpbiBjZWMtbm90aWZpZXIuaCwgaXQgd291bGQgYmUgc3R1cGlkIHRvCj4gaGF2ZSB0
byByZXNvcnQgdG8gI2lmZGVmcyBpbiBkcml2ZXIgY29kZSB0byBzb2x2ZSB0aGlzIGlzc3VlLgoK
V2lsbCBwb3N0IGEgbmV3IHNlcmllcyB0b2RheS4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91
dC4KCkEgZ2VuZXJhbCBub3RlOiBJIGFtIGNvbnNpZGVyaW5nIG1lcmdpbmcgY2VjLW5vdGlmaWVy
IGFuZCBjZWMtZWRpZCBpbnRvIHRoZQpDRUMgbW9kdWxlIGl0c2VsZi4gSG93ZXZlciwgSSB3YW50
IHRvIGdldCB0aGlzIHNlcmllcyBpbiBmaXJzdCBiZWZvcmUgSSBzdGFydAptb3ZpbmcgdGhpbmdz
IGFyb3VuZC4gSXQncyBiZWVuIGRlbGF5ZWQgbG9uZyBlbm91Z2ggYWxyZWFkeS4KClJlZ2FyZHMs
CgoJSGFucwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
