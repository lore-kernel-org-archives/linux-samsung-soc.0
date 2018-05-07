From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 03/13] drm/kms/mode/exynos-dsi: using helper func
 drm_display_mode_to_videomode for calculating timing parameters
Date: Mon, 7 May 2018 11:33:32 +0200
Message-ID: <000252e2-af94-f0af-d943-0c28aedc91f5@samsung.com>
References: <920ac8d1-8d2d-1332-256d-21472f69fca5@arm.com>
 <CGME20180507033238epcas5p2601b5ccbba8fa02cdde4f1375e90abe9@epcas5p2.samsung.com>
 <1525663938-4172-1-git-send-email-satendra.t@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1525663938-4172-1-git-send-email-satendra.t@samsung.com>
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
To: Satendra Singh Thakur <satendra.t@samsung.com>, robin.murphy@arm.com, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hemanshu Srivastava <hemanshu.s@samsung.com>, sst2005@gmail.com, madhur.verma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU2F0ZW5kcmEgU2luZ2ggVGhha3VyLAoKT24gMDcuMDUuMjAxOCAwNTozMiwgU2F0ZW5kcmEg
U2luZ2ggVGhha3VyIHdyb3RlOgo+IFRvIGF2b2lkIGR1cGxpY2F0ZSBsb2dpYyBmb3IgdGhlIHNh
bWUKPgo+IFNpZ25lZC1vZmYtYnk6IFNhdGVuZHJhIFNpbmdoIFRoYWt1ciA8c2F0ZW5kcmEudEBz
YW1zdW5nLmNvbT4KPiBBY2tlZC1ieTogTWFkaHVyIFZlcm1hIDxtYWRodXIudmVybWFAc2Ftc3Vu
Zy5jb20+Cj4gQ2M6IEhlbWFuc2h1IFNyaXZhc3RhdmEgPGhlbWFuc2h1LnNAc2Ftc3VuZy5jb20+
CgpXaG9sZSBleHlub3NfZHNpX21vZGVfc2V0IGNhbGxiYWNrIGlzIHJlZHVuZGFudCwgc28gSSBo
YXZlIHBvc3RlZCBwYXRjaApyZW1vdmluZyBpdCBbMV0sIHNvIHRoaXMgcGF0Y2ggY2FuIGJlIGRy
b3BwZWQuCgpbMV06IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWRyaS1kZXZlbCZtPTE1MjU2ODUzODQw
MDcxMgoKClJlZ2FyZHMKQW5kcnplagoKPiAtLS0KPgo+ICB2MjogUmVtb3ZlZCBNciBSb2JpbiBm
cm9tIHJldmlld2VkLWJ5IGZpZWxkCQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kc2kuYyB8IDEzICsrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2RzaS5jCj4gaW5kZXggNzkwNGZmYS4uN2ZlODRmZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTQ5MCwxNyArMTQ5MCw4IEBAIHN0YXRpYyB2
b2lkIGV4eW5vc19kc2lfbW9kZV9zZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAJ
CQkJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUpCj4gIHsKPiAgCXN0cnVj
dCBleHlub3NfZHNpICpkc2kgPSBlbmNvZGVyX3RvX2RzaShlbmNvZGVyKTsKPiAtCXN0cnVjdCB2
aWRlb21vZGUgKnZtID0gJmRzaS0+dm07Cj4gLQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbSA9
IGFkanVzdGVkX21vZGU7Cj4gLQo+IC0Jdm0tPmhhY3RpdmUgPSBtLT5oZGlzcGxheTsKPiAtCXZt
LT52YWN0aXZlID0gbS0+dmRpc3BsYXk7Cj4gLQl2bS0+dmZyb250X3BvcmNoID0gbS0+dnN5bmNf
c3RhcnQgLSBtLT52ZGlzcGxheTsKPiAtCXZtLT52YmFja19wb3JjaCA9IG0tPnZ0b3RhbCAtIG0t
PnZzeW5jX2VuZDsKPiAtCXZtLT52c3luY19sZW4gPSBtLT52c3luY19lbmQgLSBtLT52c3luY19z
dGFydDsKPiAtCXZtLT5oZnJvbnRfcG9yY2ggPSBtLT5oc3luY19zdGFydCAtIG0tPmhkaXNwbGF5
Owo+IC0Jdm0tPmhiYWNrX3BvcmNoID0gbS0+aHRvdGFsIC0gbS0+aHN5bmNfZW5kOwo+IC0Jdm0t
PmhzeW5jX2xlbiA9IG0tPmhzeW5jX2VuZCAtIG0tPmhzeW5jX3N0YXJ0Owo+ICsKPiArCWRybV9k
aXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlKGFkanVzdGVkX21vZGUsICZkc2ktPnZtKTsKPiAgfQo+
ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgZXh5bm9z
X2RzaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
