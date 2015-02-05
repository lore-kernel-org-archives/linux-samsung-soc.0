From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] GPU-DRM-Exynos: Delete unnecessary checks before two
 function calls
Date: Thu, 05 Feb 2015 17:29:04 +0900
Message-ID: <54D329D0.7050006@samsung.com>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D28870.3060400@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <54D28870.3060400@users.sourceforge.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAwMi8wNS8yMDE1IDA2OjAwIEFNLCBTRiBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiBG
cm9tOiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gRGF0
ZTogV2VkLCA0IEZlYiAyMDE1IDIxOjU0OjQ1ICswMTAwCj4gCj4gVGhlIGZ1bmN0aW9ucyBwaHlf
cG93ZXJfb24oKSBhbmQgdnVubWFwKCkgcGVyZm9ybSBhbHNvIGlucHV0Cj4gcGFyYW1ldGVyIHZh
bGlkYXRpb24uIFRodXMgdGhlIHRlc3QgYXJvdW5kIHRoZWlyIGNhbGxzIGlzIG5vdCBuZWVkZWQu
Cj4gCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29m
dHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMu
c291cmNlZm9yZ2UubmV0Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cF9jb3JlLmMgICB8IDYgKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9mYmRldi5jIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBfY29yZS5jCj4g
aW5kZXggMzRkNDZhYS4uMzA2Y2YxZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcF9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcF9jb3JlLmMKPiBAQCAtMTA1NywxNCArMTA1NywxMiBAQCBzdGF0aWMgaW50IGV4eW5vc19k
cF9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBleHlub3NfZHJtX2Rpc3BsYXkgKmRpc3BsYXksCj4g
IAo+ICBzdGF0aWMgdm9pZCBleHlub3NfZHBfcGh5X2luaXQoc3RydWN0IGV4eW5vc19kcF9kZXZp
Y2UgKmRwKQo+ICB7Cj4gLQlpZiAoZHAtPnBoeSkKPiAtCQlwaHlfcG93ZXJfb24oZHAtPnBoeSk7
Cj4gKwlwaHlfcG93ZXJfb24oZHAtPnBoeSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGV4eW5v
c19kcF9waHlfZXhpdChzdHJ1Y3QgZXh5bm9zX2RwX2RldmljZSAqZHApCj4gIHsKPiAtCWlmIChk
cC0+cGh5KQo+IC0JCXBoeV9wb3dlcl9vZmYoZHAtPnBoeSk7Cj4gKwlwaHlfcG93ZXJfb2ZmKGRw
LT5waHkpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBleHlub3NfZHBfcG93ZXJvbihzdHJ1Y3Qg
ZXh5bm9zX2RybV9kaXNwbGF5ICpkaXNwbGF5KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9mYmRldi5jCj4gaW5kZXggZTEyZWE5MC4uMGRkNDQ4YSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCj4gQEAgLTMxMyw3ICszMTMsNyBAQCBz
dGF0aWMgdm9pZCBleHlub3NfZHJtX2ZiZGV2X2Rlc3Ryb3koc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKPiAgCXN0cnVjdCBleHlub3NfZHJtX2dlbV9vYmogKmV4eW5vc19nZW1fb2JqID0gZXh5bm9z
X2ZiZC0+ZXh5bm9zX2dlbV9vYmo7Cj4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKPiAg
Cj4gLQlpZiAoaXNfZHJtX2lvbW11X3N1cHBvcnRlZChkZXYpICYmIGV4eW5vc19nZW1fb2JqLT5i
dWZmZXItPmt2YWRkcikKPiArCWlmIChpc19kcm1faW9tbXVfc3VwcG9ydGVkKGRldikpCj4gIAkJ
dnVubWFwKGV4eW5vc19nZW1fb2JqLT5idWZmZXItPmt2YWRkcik7Cj4gIAo+ICAJLyogcmVsZWFz
ZSBkcm0gZnJhbWVidWZmZXIgYW5kIHJlYWwgYnVmZmVyICovCj4gCgpBY2tlZC1ieTogSm9vbnlv
dW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgoKVGhhbmtzLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
