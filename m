From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3 5/5] gpu: drm: exynos_hdmi: Remove duplicate
 initialization of regulator bulk consumer
Date: Thu, 25 Aug 2016 09:12:44 +0200
Message-ID: <cd131b95-97f4-7ad0-8130-9a2000312bd9@samsung.com>
References: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
 <1472044039-16536-6-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1472044039-16536-6-git-send-email-woogyom.kim@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Milo Kim <woogyom.kim@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDgvMjQvMjAxNiAwMzowNyBQTSwgTWlsbyBLaW0gd3JvdGU6Cj4gVGhlIGhlbHBlciwgZGV2
bV9yZWd1bGF0b3JfYnVsa19nZXQoKSBpbml0aWFsaXplcyB0aGUgY29uc3VtZXIgYXMgTlVMTCwK
PiBzbyB0aGlzIGNvZGUgY2FuIGJlIGlnbm9yZWQuCj4KPiBDYzogS3VramluIEtpbSA8a2dlbmVA
a2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2lAc2Ftc3Vu
Zy5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogSW5raSBE
YWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IENjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNo
aW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5j
b20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTWls
byBLaW0gPHdvb2d5b20ua2ltQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tClJlZ2FyZHMKQW5kcnplago+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfaGRtaS5jCj4gaW5kZXggMjQ5Y2IyMy4uNGUxNzg3N2YgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfaGRtaS5jCj4gQEAgLTE2NjksMTAgKzE2NjksOSBAQCBzdGF0aWMgaW50
IGhkbWlfcmVzb3VyY2VzX2luaXQoc3RydWN0IGhkbWlfY29udGV4dCAqaGRhdGEpCj4gIAlpZiAo
cmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
c3VwcGx5KTsgKytpKSB7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzdXBwbHkpOyAr
K2kpCj4gIAkJaGRhdGEtPnJlZ3VsX2J1bGtbaV0uc3VwcGx5ID0gc3VwcGx5W2ldOwo+IC0JCWhk
YXRhLT5yZWd1bF9idWxrW2ldLmNvbnN1bWVyID0gTlVMTDsKPiAtCX0KPiArCj4gIAlyZXQgPSBk
ZXZtX3JlZ3VsYXRvcl9idWxrX2dldChkZXYsIEFSUkFZX1NJWkUoc3VwcGx5KSwgaGRhdGEtPnJl
Z3VsX2J1bGspOwo+ICAJaWYgKHJldCkgewo+ICAJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
