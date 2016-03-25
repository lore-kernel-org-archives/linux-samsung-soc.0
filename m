From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch 2/2] drm/exynos: mic: remove some dead code
Date: Fri, 25 Mar 2016 23:09:15 +0300
Message-ID: <20160325200915.GG30221@mwanda>
References: <20160317103912.GB3100@mwanda>
 <56F4FC08.6090009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <56F4FC08.6090009@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gRnJpLCBNYXIgMjUsIDIwMTYgYXQgMDU6NTE6MjBQTSArMDkwMCwgSW5raSBEYWUgd3JvdGU6
Cj4gSGkgRGFuLAo+IAo+IDIwMTbrhYQgMDPsm5QgMTfsnbwgMTk6Mznsl5AgRGFuIENhcnBlbnRl
ciDsnbQo6rCAKSDsk7Qg6riAOgo+ID4gV2Uga25vdyAicmV0IiBpcyB6ZXJvIGFuZCB0aGUgdGVz
dCBtYWtlcyBzdGF0aWMgY2hlY2tlcnMgY29tcGxhaW4gc28KPiA+IGxldCdzIGRlbGV0ZSB0aGlz
IHByaW50ay4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPgo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX21pYy5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X21pYy5jCj4gPiBpbmRleCA4OTBjOWIxLi4xMmRiMzUzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKPiA+IEBAIC0xMzAsOCArMTMwLDYgQEAgc3RhdGlj
IHZvaWQgbWljX3NldF9wYXRoKHN0cnVjdCBleHlub3NfbWljICptaWMsIGJvb2wgZW5hYmxlKQo+
ID4gIAkJdmFsICY9IH4oTUlDMF9SR0JfTVVYIHwgTUlDMF9JODBfTVVYIHwgTUlDMF9PTl9NVVgp
Owo+ID4gIAo+ID4gIAlyZWdtYXBfd3JpdGUobWljLT5zeXNyZWcsIERTRF9DRkdfTVVYLCB2YWwp
Owo+ID4gLQlpZiAocmV0KQo+ID4gLQkJRFJNX0VSUk9SKCJtaWM6IEZhaWxlZCB0byByZWFkIHN5
c3RlbSByZWdpc3RlclxuIik7Cj4gCj4gSSB0aGluayB3ZSBtaXNzZWQgdG8ga2VlcCByZXR1cm4g
dmFsdWUgZnJvbSByZWdtYXBfd3JpdGUgZnVuY3Rpb24sCj4gCXJldCA9IHJlZ21hcF93cml0ZSht
aWMtPnN5c3JlZywgLi4uLik7Cj4gCWlmIChyZXQpCj4gCQkuLi4KClllYWguICBZb3UncmUgcmln
aHQuCgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
