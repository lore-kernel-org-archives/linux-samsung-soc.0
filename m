From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/exynos: fix a timeout loop
Date: Thu, 13 Oct 2016 13:20:40 +0300
Message-ID: <20161013102040.GA5576@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

V2Ugd2VyZSB0cnlpbmcgdG8gcHJpbnQgYW4gZXJyb3IgbWVzc2FnZSBpZiB3ZSB0aW1lZCBvdXQg
aGVyZSwgYnV0IHRoZQpsb29wIGFjdHVhbGx5IGVuZHMgd2l0aCAidHJpZXMiIHNldCB0byBVSU5U
X01BWCBhbmQgbm90IHplcm8uICBGaXggdGhpcwpieSBjaGFuZ2luZyBmcm9tIHRyaWVzLS0gdG8g
LS10cmllcy4KCkEgZm9yIGxvb3Agd291bGQgYWN0dWFsbHkgYmUgdGhlIG1vc3QgbmF0dXJhbCB3
YXkgdG8gZG8gdGhpcy4gIE15IGZpeAptZWFucyB3ZSBvbmx5IGxvb3AgOTkgdGltZXMgaW5zdGVh
ZCBvZiAxMDAgYnV0IHRoYXQncyBwcm9iYWJseSBvay4KCkZpeGVzOiBhNjk2Mzk0YzUyMjQgKCdk
cm0vZXh5bm9zOiBtaXhlcjogc2ltcGxpZnkgbG9vcCBpbiB2cF93aW5fcmVzZXQoKScpClNpZ25l
ZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwppbmRleCBlZGIyMGEzLi5mY2M3ZTRmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKQEAgLTcwMSw3ICs3MDEsNyBAQCBzdGF0
aWMgdm9pZCB2cF93aW5fcmVzZXQoc3RydWN0IG1peGVyX2NvbnRleHQgKmN0eCkKIAl1bnNpZ25l
ZCBpbnQgdHJpZXMgPSAxMDA7CiAKIAl2cF9yZWdfd3JpdGUocmVzLCBWUF9TUkVTRVQsIFZQX1NS
RVNFVF9QUk9DRVNTSU5HKTsKLQl3aGlsZSAodHJpZXMtLSkgeworCXdoaWxlICgtLXRyaWVzKSB7
CiAJCS8qIHdhaXRpbmcgdW50aWwgVlBfU1JFU0VUX1BST0NFU1NJTkcgaXMgMCAqLwogCQlpZiAo
fnZwX3JlZ19yZWFkKHJlcywgVlBfU1JFU0VUKSAmIFZQX1NSRVNFVF9QUk9DRVNTSU5HKQogCQkJ
YnJlYWs7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
