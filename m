From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/8] drm/exynos: mixer: fix chroma comment in vp_video_buffer()
Date: Wed,  9 Aug 2017 13:48:50 +0200
Message-ID: <20170809114857.4945-2-tjakobi@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGN1cnJlbnQgY29tbWVudCBzb3VuZHMgbGlrZSB0aGUgZGl2aXNpb24gb3AgaXMgZG9uZSB0
bwpjb21wZW5zYXRlIGZvciBzb21lIGhhcmR3YXJlIGVycmF0dW0uIEJ1dCB0aGUgY2hyb21hIHBs
YW5lCmhhdmluZyBoYWxmIHRoZSBoZWlnaHQgb2YgdGhlIGx1bWEgcGxhbmUgaXMganVzdCB0aGUg
d2F5Ck5WMTIvTlYyMSBpcyBkZWZpbmVkLCBzbyBjbGFyaWZ5IHRoaXMgYmVoYXZpb3VyLgoKU2ln
bmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19taXhlci5jCmluZGV4IGE5OThhOGRkNzgzYy4uYzZkNmY2ZDQyOTAwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKQEAgLTUzMiw3ICs1MzIsNyBAQCBzdGF0
aWMgdm9pZCB2cF92aWRlb19idWZmZXIoc3RydWN0IG1peGVyX2NvbnRleHQgKmN0eCwKIAkvKiBz
ZXR0aW5nIHNpemUgb2YgaW5wdXQgaW1hZ2UgKi8KIAl2cF9yZWdfd3JpdGUocmVzLCBWUF9JTUdf
U0laRV9ZLCBWUF9JTUdfSFNJWkUoZmItPnBpdGNoZXNbMF0pIHwKIAkJVlBfSU1HX1ZTSVpFKGZi
LT5oZWlnaHQpKTsKLQkvKiBjaHJvbWEgaGVpZ2h0IGhhcyB0byByZWR1Y2VkIGJ5IDIgdG8gYXZv
aWQgY2hyb21hIGRpc3RvcmlvbnMgKi8KKwkvKiB0aGUgY2hyb21hIHBsYW5lIGZvciBOVjEyL05W
MjEgaXMgaGFsZiB0aGUgaGVpZ2h0IG9mIHRoZSBsdW1hIHBsYW5lICovCiAJdnBfcmVnX3dyaXRl
KHJlcywgVlBfSU1HX1NJWkVfQywgVlBfSU1HX0hTSVpFKGZiLT5waXRjaGVzWzBdKSB8CiAJCVZQ
X0lNR19WU0laRShmYi0+aGVpZ2h0IC8gMikpOwogCi0tIAoyLjEzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
