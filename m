From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 02/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init_passive()
Date: Wed, 24 Jul 2019 21:08:51 +0200
Message-ID: <20190724190851.GE14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122023eucas1p2ff56c00b60a676ed85d9fe159a1839f2@eucas1p2.samsung.com>
 <20190723122016.30279-3-a.swigon@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-3-a.swigon@partner.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDdQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHN0YXRpYyBmdW5jdGlvbiwgZXh5bm9zX2J1
c19wcm9maWxlX2luaXRfcGFzc2l2ZSgpLAo+IGV4dHJhY3RlZCBmcm9tIGV4eW5vc19idXNfcHJv
YmUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5l
ci5zYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYyB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgYi9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCj4g
aW5kZXggZDhmMWVmYWYyZDQ5Li5jZjZmNmNiZDBmNTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9k
ZXZmcmVxL2V4eW5vcy1idXMuYwo+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMK
PiBAQCAtNDMwLDEzICs0MzAsNTEgQEAgc3RhdGljIGludCBleHlub3NfYnVzX3Byb2ZpbGVfaW5p
dChzdHJ1Y3QgZXh5bm9zX2J1cyAqYnVzLAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3Rh
dGljIGludCBleHlub3NfYnVzX3Byb2ZpbGVfaW5pdF9wYXNzaXZlKHN0cnVjdCBleHlub3NfYnVz
ICpidXMsCj4gKwkJCQkJICAgc3RydWN0IGRldmZyZXFfZGV2X3Byb2ZpbGUgKnByb2ZpbGUpCj4g
K3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGJ1cy0+ZGV2Owo+ICsJc3RydWN0IGRldmZyZXEg
KnBhcmVudF9kZXZmcmVxOwo+ICsJc3RydWN0IGRldmZyZXFfcGFzc2l2ZV9kYXRhICpwYXNzaXZl
X2RhdGE7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwkvKiBJbml0aWFsaXplIHRoZSBzdHJ1Y3Qg
cHJvZmlsZSBhbmQgZ292ZXJub3IgZGF0YSBmb3IgcGFzc2l2ZSBkZXZpY2UgKi8KPiArCXByb2Zp
bGUtPnRhcmdldCA9IGV4eW5vc19idXNfcGFzc2l2ZV90YXJnZXQ7Cj4gKwlwcm9maWxlLT5leGl0
ID0gZXh5bm9zX2J1c19wYXNzaXZlX2V4aXQ7Cj4gKwo+ICsJLyogR2V0IHRoZSBpbnN0YW5jZSBv
ZiBwYXJlbnQgZGV2ZnJlcSBkZXZpY2UgKi8KPiArCXBhcmVudF9kZXZmcmVxID0gZGV2ZnJlcV9n
ZXRfZGV2ZnJlcV9ieV9waGFuZGxlKGRldiwgMCk7Cj4gKwlpZiAoSVNfRVJSKHBhcmVudF9kZXZm
cmVxKSkgewo+ICsJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4gKwkJZ290byBlcnI7CgpTYW1lIGFz
IGluIHByZXZpb3VzIHBhdGNoIC0gbm8gbmVlZCBmb3IgZXJyb3IgZ290by4KCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
