From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 4/9] drm/exynos: mixer: simplify mixer_graph_buffer()
Date: Tue, 22 Aug 2017 16:19:39 +0200
Message-ID: <20170822141944.8138-5-tjakobi@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
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

RFJNIGNvcmUgYWxyZWFkeSBjaGVja3MgaW4gZHJtX2F0b21pY19wbGFuZV9jaGVjaygpIGlmIHRo
ZQpwaXhlbGZvcm1hdCBpcyB2YWxpZC4gSGVuY2Ugd2UgY2FuIGNvbGxhcHNlIHRoZSBkZWZhdWx0
IGNhc2UKb2YgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgd2l0aCB0aGUgWFJHQjg4ODggY2FzZS4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29i
aUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfbWl4ZXIuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19t
aXhlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwppbmRleCBiZWVm
NGQ2YzQxY2EuLjhkNjhkZTg1YmFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfbWl4ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhl
ci5jCkBAIC02MDYsMTIgKzYwNiw5IEBAIHN0YXRpYyB2b2lkIG1peGVyX2dyYXBoX2J1ZmZlcihz
dHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4LAogCiAJY2FzZSBEUk1fRk9STUFUX1hSR0I4ODg4Ogog
CWNhc2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoKKwlkZWZhdWx0OgogCQlmbXQgPSBNWFJfRk9STUFU
X0FSR0I4ODg4OwogCQlicmVhazsKLQotCWRlZmF1bHQ6Ci0JCURSTV9ERUJVR19LTVMoInBpeGVs
Zm9ybWF0IHVuc3VwcG9ydGVkIGJ5IG1peGVyXG4iKTsKLQkJcmV0dXJuOwogCX0KIAogCS8qIHJh
dGlvIGlzIGFscmVhZHkgY2hlY2tlZCBieSBjb21tb24gcGxhbmUgY29kZSAqLwotLSAKMi4xMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
