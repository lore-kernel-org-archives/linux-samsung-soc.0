From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/7] drm/exynos: g2d: remove style error
Date: Mon, 15 Apr 2019 18:00:48 +0900
Message-ID: <a3c2c6c1-4ef7-13e2-2734-ede0fd53d076@samsung.com>
References: <1555318456-23397-1-git-send-email-inki.dae@samsung.com>
 <CGME20190415085353epcas1p44b4b80afe9bdae2501f1f63ba163ed58@epcas1p4.samsung.com>
 <1555318456-23397-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1555318456-23397-2-git-send-email-inki.dae@samsung.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T29wcy4gVGhlcmUgd2FzIG15IG1pc3Rha2UuIFRoaXMgcGF0Y2ggaXMgYWxyZWFkeSBtZXJnZWQg
dG8gZXh5bm9zLWRybS1maXhlcy4KUGxlYXNlIGlnbm9yZSB0aGlzIG9uZS4KClRoYW5rcywKSW5r
aSBEYWUKCjE5LiA0LiAxNS4g7Jik7ZuEIDU6NTTsl5AgSW5raSBEYWUg7J20KOqwgCkg7JO0IOq4
gDoKPiBGcm9tOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+IAo+IFJl
bW92ZSBjaGVja3BhdGNoIGVycm9yLCAiZm9vKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiBpbmRleCAyNGM1MzZkLi5hOWMyNmIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwo+IEBAIC04NDUsNyArODQ1
LDcgQEAgc3RhdGljIHZvaWQgZzJkX2ZyZWVfcnVucXVldWVfbm9kZShzdHJ1Y3QgZzJkX2RhdGEg
KmcyZCwKPiAgICoKPiAgICogSGFzIHRvIGJlIGNhbGxlZCB1bmRlciBydW5xdWV1ZSBsb2NrLgo+
ICAgKi8KPiAtc3RhdGljIHZvaWQgZzJkX3JlbW92ZV9ydW5xdWV1ZV9ub2RlcyhzdHJ1Y3QgZzJk
X2RhdGEgKmcyZCwgc3RydWN0IGRybV9maWxlKiBmaWxlKQo+ICtzdGF0aWMgdm9pZCBnMmRfcmVt
b3ZlX3J1bnF1ZXVlX25vZGVzKHN0cnVjdCBnMmRfZGF0YSAqZzJkLCBzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbGUpCj4gIHsKPiAgCXN0cnVjdCBnMmRfcnVucXVldWVfbm9kZSAqbm9kZSwgKm47Cj4gIAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
