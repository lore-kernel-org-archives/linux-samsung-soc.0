From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 04/10] drm: atmel-hlcdc: Use
 __drm_atomic_helper_plane_reset instead of copying the logic
Date: Sat, 21 Jul 2018 08:12:58 +0200
Message-ID: <20180721081258.0853da3e@bbrezillon>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-5-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-5-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgQWxleGFuZHJ1LAoKT24gRnJpLCAyMCBKdWwgMjAxOCAyMjoxNTowMyArMDEwMApBbGV4YW5k
cnUgR2hlb3JnaGUgPGFsZXhhbmRydS1jb3NtaW4uZ2hlb3JnaGVAYXJtLmNvbT4gd3JvdGU6CgpQ
bGVhc2UgYWRkIGEgY29tbWl0IG1lc3NhZ2UgaGVyZSAoZXZlbiBpZiBpdCdzIGp1c3QgcmVwZWF0
aW5nIHdoYXQgdGhlCnN1YmplY3Qgc2F5cykuCgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBH
aGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgoKV2l0aCB0aGlzIGFk
ZHJlc3NlZDoKCkFja2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290
bGluLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNk
Y19wbGFuZS5jIHwgNSArLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNk
Yy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMKPiBpbmRleCAwNDQ0MDA2NGI5YjcuLjkzMzBhMDc2ZTE1YSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jCj4g
QEAgLTk0MiwxMCArOTQyLDcgQEAgc3RhdGljIHZvaWQgYXRtZWxfaGxjZGNfcGxhbmVfcmVzZXQo
c3RydWN0IGRybV9wbGFuZSAqcCkKPiAgCQkJCSJGYWlsZWQgdG8gYWxsb2NhdGUgaW5pdGlhbCBw
bGFuZSBzdGF0ZVxuIik7Cj4gIAkJCXJldHVybjsKPiAgCQl9Cj4gLQo+IC0JCXAtPnN0YXRlID0g
JnN0YXRlLT5iYXNlOwo+IC0JCXAtPnN0YXRlLT5hbHBoYSA9IERSTV9CTEVORF9BTFBIQV9PUEFR
VUU7Cj4gLQkJcC0+c3RhdGUtPnBsYW5lID0gcDsKPiArCQlfX2RybV9hdG9taWNfaGVscGVyX3Bs
YW5lX3Jlc2V0KHAsICZzdGF0ZS0+YmFzZSk7Cj4gIAl9Cj4gIH0KPiAgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
