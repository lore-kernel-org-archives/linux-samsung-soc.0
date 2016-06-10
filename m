From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: use logical AND in
 exynos_drm_plane_check_size()
Date: Fri, 10 Jun 2016 12:12:33 +0200
Message-ID: <575A9291.6020906@math.uni-bielefeld.de>
References: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

UGluZyEKCi0gVG9iaWFzCgpUb2JpYXMgSmFrb2JpIHdyb3RlOgo+IFRoZSBjdXJyZW50IGJpdHdp
c2UgQU5EIHNob3VsZCByZXN1bHQgaW4gdGhlIHNhbWUgYXNzZW1ibGVyCj4gYnV0IHRoaXMgaXMg
d2hhdCB0aGUgY29kZSBpcyBhY3R1YWxseSBzdXBwb3NlZCB0byBkby4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jCj4gaW5kZXggYjNmM2MyYy4uZTRhMWE2
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jCj4gQEAg
LTIyNiw3ICsyMjYsNyBAQCBleHlub3NfZHJtX3BsYW5lX2NoZWNrX3NpemUoY29uc3Qgc3RydWN0
IGV4eW5vc19kcm1fcGxhbmVfY29uZmlnICpjb25maWcsCj4gIAkgICAgc3RhdGUtPnZfcmF0aW8g
PT0gKDEgPDwgMTUpKQo+ICAJCWhlaWdodF9vayA9IHRydWU7Cj4gIAo+IC0JaWYgKHdpZHRoX29r
ICYgaGVpZ2h0X29rKQo+ICsJaWYgKHdpZHRoX29rICYmIGhlaWdodF9vaykKPiAgCQlyZXR1cm4g
MDsKPiAgCj4gIAlEUk1fREVCVUdfS01TKCJzY2FsaW5nIG1vZGUgaXMgbm90IHN1cHBvcnRlZCIp
Owo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
