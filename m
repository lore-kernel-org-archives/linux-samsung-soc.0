From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fimc: signedness bug in fimc_setup_clocks()
Date: Wed, 23 May 2018 09:33:18 +0900
Message-ID: <5B04B6CE.2010004@samsung.com>
References: <CGME20180518080527epcas1p293dfaa13795c92f9239e8c9bd95af9ad@epcas1p2.samsung.com>
 <20180518080445.GB28335@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180518080445.GB28335@mwanda>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

CgoyMDE464WEIDA17JuUIDE47J28IDE3OjA07JeQIERhbiBDYXJwZW50ZXIg7J20KOqwgCkg7JO0
IOq4gDoKPiAiaWQiIG5lZWRzIHRvIGJlIHNpZ25lZCBmb3IgdGhlIGVycm9yIGhhbmRsaW5nIHRv
IHdvcmsuCgpBcHBsaWVkIHRvIGV4eW5vcy1kcm0tZml4ZXMtdjQuMTgtcmMxLgoKVGhhbmtzLApJ
bmtpIERhZQoKPiAKPiBGaXhlczogN2EyZDVjNzdjNTU4ICgiZHJtL2V4eW5vczogZmltYzogQ29u
dmVydCBkcml2ZXIgdG8gSVBQIHYyIGNvcmUgQVBJIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmltYy5jCj4gaW5kZXggNGRmYmZjN2YzYjg0Li41Y2U4NDAyNWQxY2Ig
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMKPiBAQCAtMTIw
MCw3ICsxMjAwLDcgQEAgc3RhdGljIGludCBmaW1jX3NldHVwX2Nsb2NrcyhzdHJ1Y3QgZmltY19j
b250ZXh0ICpjdHgpCj4gIAo+ICBpbnQgZXh5bm9zX2RybV9jaGVja19maW1jX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAtCXVuc2lnbmVkIGludCBpZCA9IG9mX2FsaWFzX2dldF9p
ZChkZXYtPm9mX25vZGUsICJmaW1jIik7Cj4gKwlpbnQgaWQgPSBvZl9hbGlhc19nZXRfaWQoZGV2
LT5vZl9ub2RlLCAiZmltYyIpOwo+ICAKPiAgCWlmIChpZCA+PSAwICYmIChCSVQoaWQpICYgZmlt
Y19tYXNrKSkKPiAgCQlyZXR1cm4gMDsKPiAtLQo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1zYW1zdW5nLXNvYyIgaW4KPiB0
aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwo+IE1vcmUg
bWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8u
aHRtbAo+IAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
