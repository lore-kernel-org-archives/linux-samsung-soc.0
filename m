From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 11/14] drm/exynos: atomic phase 2: keep track of
 framebuffer pointer
Date: Wed, 04 Feb 2015 16:53:12 +0900
Message-ID: <54D1CFE8.6070100@samsung.com>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-12-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1422990871-21355-12-git-send-email-gustavo@padovan.org>
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

SGksCgpPbiAwMi8wNC8yMDE1IDA0OjE0IEFNLCBHdXN0YXZvIFBhZG92YW4gd3JvdGU6Cj4gRnJv
bTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgo+IAo+
IFVzZSBkcm1fYXRvbWljX3NldF9mYl9mb3JfcGxhbmUoKSBpbiB0aGUgbGVnYWN5IHBhZ2VfZmxp
cCBwYXRoIHRvIGtlZXAKPiB0cmFjayBvZiB0aGUgZnJhbWVidWZmZXIgcG9pbnRlciBhbmQgcmVm
ZXJlbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRv
dmFuQGNvbGxhYm9yYS5jby51az4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2NydGMuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKPiBpbmRleCA2NjBh
ZDY0Li4yZWRjNzNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0
Yy5jCj4gQEAgLTIxMSw2ICsyMTEsOSBAQCBzdGF0aWMgaW50IGV4eW5vc19kcm1fY3J0Y19wYWdl
X2ZsaXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJCQkgICAgY3J0Y193LCBjcnRjX2gsIGNy
dGMtPngsIGNydGMtPnksCj4gIAkJCSAgICBjcnRjX3csIGNydGNfaCk7Cj4gIAo+ICsJaWYgKGNy
dGMtPnByaW1hcnktPnN0YXRlKQo+ICsJCWRybV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZShjcnRj
LT5wcmltYXJ5LT5zdGF0ZSwgZmIpOwo+ICsKCkknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgbmVl
ZHMsIGhvdyBhYm91dCBnbyB0bwpkcm1fYXRvbWljX2hlbHBlcl9wYWdlX2ZsaXA/CgpUaGFua3Mu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
