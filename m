From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: WARN_ON if a modeset driver uses legacy
 suspend/resume helpers
Date: Thu, 13 Aug 2015 23:19:08 +0200
Message-ID: <20150813211908.GF17734@phenom.ffwll.local>
References: <1439496399-25791-1-git-send-email-gustavo@padovan.org>
 <1439496399-25791-2-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1439496399-25791-2-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVGh1LCBBdWcgMTMsIDIwMTUgYXQgMDU6MDY6MzlQTSAtMDMwMCwgR3VzdGF2byBQYWRvdmFu
IHdyb3RlOgo+IEZyb206IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9y
YS5jby51az4KPiAKPiBMZWdhY3kgcy9yIGhvb2tzIGFyZSBvbmx5IHVzZWQgZm9yIHNoYWRvdy1h
dHRhY2hpbmcgZHJpdmVycywgd2Fybgo+IHdoZW4gYSBLTVMgZHJpdmVyIHRyaWVzIHRvIHVzZSB0
aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2by5wYWRvdmFu
QGNvbGxhYm9yYS5jby51az4KCkFzc3VtaW5nIHRoYXQgSW5raSBwaWNrcyB1cCB0aGUgZXh5bm9z
IHBhdGNoIEkndmUgYXBwbGllZCB0aGlzIHRvCmRybS1taXNjLgoKVGhhbmtzLCBEYW5pZWwKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiBpbmRleCBiN2JmNGNlLi40ZTc2MTkz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jCj4gQEAgLTU2Nyw2ICs1NjcsOCBAQCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtX2Rldl9hbGxvYyhzdHJ1Y3QgZHJtX2RyaXZlciAqZHJpdmVyLAo+ICAJCXJldCA9IGRy
bV9taW5vcl9hbGxvYyhkZXYsIERSTV9NSU5PUl9DT05UUk9MKTsKPiAgCQlpZiAocmV0KQo+ICAJ
CQlnb3RvIGVycl9taW5vcnM7Cj4gKwo+ICsJCVdBUk5fT04oZHJpdmVyLT5zdXNwZW5kIHx8IGRy
aXZlci0+cmVzdW1lKTsKPiAgCX0KPiAgCj4gIAlpZiAoZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShk
ZXYsIERSSVZFUl9SRU5ERVIpKSB7Cj4gLS0gCj4gMi4xLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
