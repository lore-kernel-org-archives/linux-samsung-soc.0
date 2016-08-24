From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH v3 5/5] gpu: drm: exynos_hdmi: Remove duplicate initialization
 of regulator bulk consumer
Date: Wed, 24 Aug 2016 22:07:19 +0900
Message-ID: <1472044039-16536-6-git-send-email-woogyom.kim@gmail.com>
References: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Milo Kim <woogyom.kim@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGhlbHBlciwgZGV2bV9yZWd1bGF0b3JfYnVsa19nZXQoKSBpbml0aWFsaXplcyB0aGUgY29u
c3VtZXIgYXMgTlVMTCwKc28gdGhpcyBjb2RlIGNhbiBiZSBpZ25vcmVkLgoKQ2M6IEt1a2ppbiBL
aW0gPGtnZW5lQGtlcm5lbC5vcmc+CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3Nr
aUBzYW1zdW5nLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIu
c2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5j
b20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTWlsbyBLaW0gPHdvb2d5
b20ua2ltQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1p
LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYwppbmRleCAyNDljYjIzLi40ZTE3
ODc3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYwpAQCAtMTY2OSwxMCArMTY2
OSw5IEBAIHN0YXRpYyBpbnQgaGRtaV9yZXNvdXJjZXNfaW5pdChzdHJ1Y3QgaGRtaV9jb250ZXh0
ICpoZGF0YSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IEFS
UkFZX1NJWkUoc3VwcGx5KTsgKytpKSB7CisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc3Vw
cGx5KTsgKytpKQogCQloZGF0YS0+cmVndWxfYnVsa1tpXS5zdXBwbHkgPSBzdXBwbHlbaV07Ci0J
CWhkYXRhLT5yZWd1bF9idWxrW2ldLmNvbnN1bWVyID0gTlVMTDsKLQl9CisKIAlyZXQgPSBkZXZt
X3JlZ3VsYXRvcl9idWxrX2dldChkZXYsIEFSUkFZX1NJWkUoc3VwcGx5KSwgaGRhdGEtPnJlZ3Vs
X2J1bGspOwogCWlmIChyZXQpIHsKIAkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
