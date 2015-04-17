From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: reset temporary value after write to
 register
Date: Fri, 17 Apr 2015 14:49:33 +0900
Message-ID: <55309EED.20206@samsung.com>
References: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
 <1426775270-31137-2-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1426775270-31137-2-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgR3VzdGF2bywKCk9uIDAzLzE5LzIwMTUgMTE6MjcgUE0sIEd1c3Rhdm8gUGFkb3ZhbiB3cm90
ZToKPiBGcm9tOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28u
dWs+Cj4gCj4gJ3ZhbCcgd2Fzbid0IGNsZWFuIGFmdGVyIGl0cyBsYXN0IHVzYWdlLCBzbyB3ZSBj
b3VsZCBnZXQgZ2FyYmFnZSB2YWx1ZSBhbmQKPiBzZW5kIHRoZSB3cm9uZyBjb21tYW5kIHRvIHRo
ZSBody4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3Zh
bkBjb2xsYWJvcmEuY28udWs+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X21peGVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19t
aXhlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+IGluZGV4IGE5
NWZlODQuLjdhZmY4OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfbWl4ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMK
PiBAQCAtNjg3LDcgKzY4Nyw3IEBAIHN0YXRpYyB2b2lkIG1peGVyX3dpbl9yZXNldChzdHJ1Y3Qg
bWl4ZXJfY29udGV4dCAqY3R4KQo+ICAJbWl4ZXJfcmVnX3dyaXRlKHJlcywgTVhSX0dSQVBISUNf
Q0ZHKDApLCB2YWwpOwo+ICAKPiAgCS8qIEJsZW5kIGxheWVyIDEgaW50byBsYXllciAwICovCj4g
LQl2YWwgfD0gTVhSX0dSUF9DRkdfQkxFTkRfUFJFX01VTDsKCkkga25vdyB0aGlzIGlzIG5vdCB3
cm9uZywgY3VycmVudCBjb2RlIG1lYW5zIGxheWVyIDEgbmVlZHMgYWJvdmUKcmVnaXN0ZXIgc2V0
dGluZyB2YWx1ZSBvZiBsYXllciAwIGFzIGRlZmF1bHQuCgpUaGFua3MuCgo+ICsJdmFsID0gTVhS
X0dSUF9DRkdfQkxFTkRfUFJFX01VTDsKPiAgCXZhbCB8PSBNWFJfR1JQX0NGR19QSVhFTF9CTEVO
RF9FTjsKPiAgCW1peGVyX3JlZ193cml0ZShyZXMsIE1YUl9HUkFQSElDX0NGRygxKSwgdmFsKTsK
PiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
