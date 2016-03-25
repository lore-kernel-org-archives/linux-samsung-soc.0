From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [patch 2/2] drm/exynos: mic: remove some dead code
Date: Fri, 25 Mar 2016 17:51:20 +0900
Message-ID: <56F4FC08.6090009@samsung.com>
References: <20160317103912.GB3100@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20160317103912.GB3100@mwanda>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgRGFuLAoKMjAxNuuFhCAwM+yblCAxN+ydvCAxOTozOeyXkCBEYW4gQ2FycGVudGVyIOydtCjq
sIApIOyTtCDquIA6Cj4gV2Uga25vdyAicmV0IiBpcyB6ZXJvIGFuZCB0aGUgdGVzdCBtYWtlcyBz
dGF0aWMgY2hlY2tlcnMgY29tcGxhaW4gc28KPiBsZXQncyBkZWxldGUgdGhpcyBwcmludGsuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29t
Pgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWlj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKPiBpbmRleCA4OTBj
OWIxLi4xMmRiMzUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9taWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMu
Ywo+IEBAIC0xMzAsOCArMTMwLDYgQEAgc3RhdGljIHZvaWQgbWljX3NldF9wYXRoKHN0cnVjdCBl
eHlub3NfbWljICptaWMsIGJvb2wgZW5hYmxlKQo+ICAJCXZhbCAmPSB+KE1JQzBfUkdCX01VWCB8
IE1JQzBfSTgwX01VWCB8IE1JQzBfT05fTVVYKTsKPiAgCj4gIAlyZWdtYXBfd3JpdGUobWljLT5z
eXNyZWcsIERTRF9DRkdfTVVYLCB2YWwpOwo+IC0JaWYgKHJldCkKPiAtCQlEUk1fRVJST1IoIm1p
YzogRmFpbGVkIHRvIHJlYWQgc3lzdGVtIHJlZ2lzdGVyXG4iKTsKCkkgdGhpbmsgd2UgbWlzc2Vk
IHRvIGtlZXAgcmV0dXJuIHZhbHVlIGZyb20gcmVnbWFwX3dyaXRlIGZ1bmN0aW9uLAoJcmV0ID0g
cmVnbWFwX3dyaXRlKG1pYy0+c3lzcmVnLCAuLi4uKTsKCWlmIChyZXQpCgkJLi4uCgpUaGFua3Ms
Cklua2kgRGFlCgo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IG1pY19zd19yZXNldChzdHJ1Y3QgZXh5
bm9zX21pYyAqbWljKQo+IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQg
dGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXNhbXN1bmctc29jIiBpbgo+IHRoZSBib2R5IG9m
IGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCj4gTW9yZSBtYWpvcmRvbW8g
aW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCj4gCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
