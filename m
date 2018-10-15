From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: checking for NULL instead of IS_ERR()
Date: Mon, 15 Oct 2018 09:47:30 +0200
Message-ID: <20181015074732eucas1p2b5da071e315bcfe1d9d97c9e885190f4~duKGtwV283138531385eucas1p2j@eucas1p2.samsung.com>
References: <20181013102140.GB16086@mwanda>
 <CGME20181015074732eucas1p2b5da071e315bcfe1d9d97c9e885190f4@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181013102140.GB16086@mwanda>
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
To: Dan Carpenter <dan.carpenter@oracle.com>, Inki Dae <inki.dae@samsung.com>, Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTMuMTAuMjAxOCAxMjoyMSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBUaGUgb2ZfZHJtX2Zp
bmRfcGFuZWwoKSBmdW5jdGlvbiByZXR1cm5zIGVycm9yIHBvaW50ZXJzIGFuZCBuZXZlciBOVUxM
Cj4gYnV0IHdlIHRoZSBkcml2ZXIgYXNzdW1lcyB0aGF0IC0+cGFuZWwgaXMgTlVMTCB3aGVuIGl0
J3Mgbm90IHByZXNlbnQuCj4gCj4gRml4ZXM6IDZhZmI3NzIxZTJhMCAoImRybS9leHlub3M6IG1v
dmUgY29ubmVjdG9yIGNyZWF0aW9uIHRvIGF0dGFjaCBjYWxsYmFjayIpCj4gU2lnbmVkLW9mZi1i
eTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKVGhhbmtzIGZvciBz
cG90dGluZyBpdCAoYW5kIHNvcnJ5IGZvciBwcmV2aW91cyByZXBseSBtaXN0YWtlKS4KClJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKIC0tClJlZ2FyZHMK
QW5kcnplagoKCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+IGlu
ZGV4IDA3YWY3NzU4MDY2ZC4uMzJmMjU2NzQ5Nzg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kc2kuYwo+IEBAIC0xNTI3LDcgKzE1MjcsOSBAQCBzdGF0aWMgaW50IGV4
eW5vc19kc2lfaG9zdF9hdHRhY2goc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCj4gIAkJfQo+
ICAKPiAgCQlkc2ktPnBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFuZWwoZGV2aWNlLT5kZXYub2Zfbm9k
ZSk7Cj4gLQkJaWYgKGRzaS0+cGFuZWwpIHsKPiArCQlpZiAoSVNfRVJSKGRzaS0+cGFuZWwpKSB7
Cj4gKwkJCWRzaS0+cGFuZWwgPSBOVUxMOwo+ICsJCX0gZWxzZSB7Cj4gIAkJCWRybV9wYW5lbF9h
dHRhY2goZHNpLT5wYW5lbCwgJmRzaS0+Y29ubmVjdG9yKTsKPiAgCQkJZHNpLT5jb25uZWN0b3Iu
c3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7Cj4gIAkJfQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
