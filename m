From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 03/13] drm/kms/mode/exynos-dsi: using helper func
 drm_display_mode_to_videomode for calculating timing parameters
Date: Thu, 3 May 2018 13:21:33 +0100
Message-ID: <00b4a624-d2b6-dc6a-71c0-9c7642480a44@arm.com>
References: <cover.1525087679.git.satendra.t@samsung.com>
 <CGME20180503083956epcas5p1eb97f7bd534e58e7154f5f11733e7aa0@epcas5p1.samsung.com>
 <e21d94cdd60e8c83140c5a917c255baf88f0e90a.1525087679.git.satendra.t@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <e21d94cdd60e8c83140c5a917c255baf88f0e90a.1525087679.git.satendra.t@samsung.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Satendra Singh Thakur <satendra.t@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hemanshu Srivastava <hemanshu.s@samsung.com>, Madhur Verma <madhur.verma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDMvMDUvMTggMDk6MzksIFNhdGVuZHJhIFNpbmdoIFRoYWt1ciB3cm90ZToKPiBUbyBhdm9p
ZCBkdXBsaWNhdGUgbG9naWMgZm9yIHRoZSBzYW1lCj4gCj4gU2lnbmVkLW9mZi1ieTogU2F0ZW5k
cmEgU2luZ2ggVGhha3VyIDxzYXRlbmRyYS50QHNhbXN1bmcuY29tPgo+IENjOiBNYWRodXIgVmVy
bWEgPG1hZGh1ci52ZXJtYUBzYW1zdW5nLmNvbT4KPiBDYzogSGVtYW5zaHUgU3JpdmFzdGF2YSA8
aGVtYW5zaHUuc0BzYW1zdW5nLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9kc2kuYyB8IDkgKy0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kc2kuYwo+IGluZGV4IDc5MDRmZmEuLjkzOTdlNWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCj4gQEAgLTE0OTMsMTQgKzE0OTMsNyBAQCBzdGF0aWMg
dm9pZCBleHlub3NfZHNpX21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAg
IAlzdHJ1Y3QgdmlkZW9tb2RlICp2bSA9ICZkc2ktPnZtOwo+ICAgCXN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptID0gYWRqdXN0ZWRfbW9kZTsKCkZXSVcgeW91IGNvdWxkIGp1c3QgcGFzcyAmZHNp
LT52bSBhbmQgYWRqdXN0ZWRfbW9kZSBkaXJlY3RseSB0byB0aGUgCmhlbHBlciBhbmQgZ2V0IHJp
ZCBvZiB0aGVzZSBsb2NhbHMgdG9vLgoKUm9iaW4uCgo+ICAgCj4gLQl2bS0+aGFjdGl2ZSA9IG0t
PmhkaXNwbGF5Owo+IC0Jdm0tPnZhY3RpdmUgPSBtLT52ZGlzcGxheTsKPiAtCXZtLT52ZnJvbnRf
cG9yY2ggPSBtLT52c3luY19zdGFydCAtIG0tPnZkaXNwbGF5Owo+IC0Jdm0tPnZiYWNrX3BvcmNo
ID0gbS0+dnRvdGFsIC0gbS0+dnN5bmNfZW5kOwo+IC0Jdm0tPnZzeW5jX2xlbiA9IG0tPnZzeW5j
X2VuZCAtIG0tPnZzeW5jX3N0YXJ0Owo+IC0Jdm0tPmhmcm9udF9wb3JjaCA9IG0tPmhzeW5jX3N0
YXJ0IC0gbS0+aGRpc3BsYXk7Cj4gLQl2bS0+aGJhY2tfcG9yY2ggPSBtLT5odG90YWwgLSBtLT5o
c3luY19lbmQ7Cj4gLQl2bS0+aHN5bmNfbGVuID0gbS0+aHN5bmNfZW5kIC0gbS0+aHN5bmNfc3Rh
cnQ7Cj4gKwlkcm1fZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9kZShtLCB2bSk7Cj4gICB9Cj4gICAK
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGV4eW5vc19k
c2lfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
