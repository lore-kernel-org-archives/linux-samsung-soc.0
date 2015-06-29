From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH] drm/exynos: iommu: fix potential NULL pointer dereference
Date: Mon, 29 Jun 2015 15:35:44 +0900
Message-ID: <20150629153544.79046d24@hwh-ubuntu>
References: <1435237812-24959-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1435237812-24959-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

RGVhciBNYXJlaywKCk9uIFRodSwgMjUgSnVuIDIwMTUgMTU6MTA6MTIgKzAyMDAKTWFyZWsgU3p5
cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKCj4gU29tZSBkcml2ZXJz
IChsaWtlIEV4eW5vcyBtaXhlcikgY2FsbHMKPiBkcm1faW9tbXVfYXR0YWNoX2RldmljZV9pZl9w
b3NzaWJsZSBiZWZvcmUgcmVnaXN0ZXJpbmcgY3J0Yywgc28KPiBhZGRpdGlvbmFsIGNoZWNrIGZv
ciBOVUxMIGNydGMgcG9pbnRlciBpcyByZXF1aXJlZC4KCkl0IHNlZW1zIHJlYXNvbmFibGUuCgpS
ZXZpZXdlZC1ieTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5nQHNhbXN1bmcuY29tPgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pb21tdS5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lvbW11LmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pb21tdS5jIGluZGV4Cj4gZDRl
Yzc0NjVlOWNjLi5kNGViNzMwYmEyNTQgMTAwNjQ0IC0tLQo+IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2lvbW11LmMgKysrCj4gYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1faW9tbXUuYyBAQCAtMTUxLDcgKzE1MSw3IEBAIGludAo+IGRybV9pb21tdV9hdHRh
Y2hfZGV2aWNlX2lmX3Bvc3NpYmxlKHN0cnVjdCBleHlub3NfZHJtX2NydGMKPiAqZXh5bm9zX2Ny
dGMsIGludCByZXQgPSAwOyAKPiAgCWlmIChpc19kcm1faW9tbXVfc3VwcG9ydGVkKGRybV9kZXYp
KSB7Cj4gLQkJaWYgKGV4eW5vc19jcnRjLT5vcHMtPmNsZWFyX2NoYW5uZWxzKQo+ICsJCWlmIChl
eHlub3NfY3J0YyAmJiBleHlub3NfY3J0Yy0+b3BzLT5jbGVhcl9jaGFubmVscykKPiAgCQkJZXh5
bm9zX2NydGMtPm9wcy0+Y2xlYXJfY2hhbm5lbHMoZXh5bm9zX2NydGMpOwo+ICAJCXJldHVybiBk
cm1faW9tbXVfYXR0YWNoX2RldmljZShkcm1fZGV2LCBzdWJkcnZfZGV2KTsKPiAgCX0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
