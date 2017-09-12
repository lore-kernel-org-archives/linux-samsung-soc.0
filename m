From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 10/10] drm/exynos/mixer: enable support for 1024x768 and
 1280x1024 modes
Date: Tue, 12 Sep 2017 15:37:37 +0200
Message-ID: <ccc59a1f-c66e-dd8d-ce43-c6800e3c3dbe@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
 <CGME20170906103732eucas1p16966a1fd86daf50dc2b5217dfb90785d@eucas1p1.samsung.com>
 <1504694220-15818-11-git-send-email-a.hajda@samsung.com>
 <d0798187-795d-7b06-ef08-bfad3a9cebc9@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <d0798187-795d-7b06-ef08-bfad3a9cebc9@math.uni-bielefeld.de>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Drake <drake@endlessm.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTIuMDkuMjAxNyAxNDo1MCwgVG9iaWFzIEpha29iaSB3cm90ZToKPiBIZWxsbyBBbmRyemVq
LAo+Cj4KPiBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBTaW5jZSBIRE1JIGNhbiBoYW5kbGUgdGhl
c2UgbW9kZXMgZGVzcGl0ZSBvZiBNSVhFUiBsaW1pdGF0aW9ucyBsZXRzCj4+IGVuYWJsZSB0aGVt
Lgo+IGxldHMgLS0+IGxldCdzCj4KPiBSZXZpZXdlZC1ieTogVG9iaWFzIEpha29iaSA8dGpha29i
aUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+CgoKVGhhbmtzIGZvciByZXZpZXcsIEkgd2lsbCBhcHBs
eSBhbGwgeW91ciBncmFtbWFyL3N0eWxlIHN1Z2dlc3Rpb25zIGluCm5leHQgaXRlcmF0aW9uLgoK
UmVnYXJkcwpBbmRyemVqCgo+Cj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5o
YWpkYUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19taXhlci5jIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCj4+IGluZGV4IDVhYWU4MmIuLjEw
OGRjY2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVy
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+PiBAQCAt
MTAxNCw2ICsxMDE0LDkgQEAgc3RhdGljIGludCBtaXhlcl9tb2RlX3ZhbGlkKHN0cnVjdCBleHlu
b3NfZHJtX2NydGMgKmNydGMsCj4+ICAJCSh3ID49IDE2NjQgJiYgdyA8PSAxOTIwICYmIGggPj0g
OTM2ICYmIGggPD0gMTA4MCkpCj4+ICAJCXJldHVybiBNT0RFX09LOwo+PiAgCj4+ICsJaWYgKCh3
ID09IDEwMjQgJiYgaCA9PSA3NjgpIHx8ICh3ID09IDEyODAgJiYgaCA9PSAxMDI0KSkKPj4gKwkJ
cmV0dXJuIE1PREVfT0s7Cj4+ICsKPj4gIAlyZXR1cm4gTU9ERV9CQUQ7Cj4+ICB9Cj4+ICAKPj4K
Pgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
