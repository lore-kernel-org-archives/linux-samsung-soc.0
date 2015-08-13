From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] drm/exynos: Staticize local function in exynos_drm_gem.c
Date: Thu, 13 Aug 2015 11:03:32 +0900
Message-ID: <1439431412-20023-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGV4eW5vc19kcm1fZ2VtX21tYXBfYnVmZmVyKCkgaXMgbm90IHVzZWQgb3V0c2lkZSBzbyBt
YWtlIGl0IHN0YXRpYy4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGsua296
bG93c2tpQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9nZW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwppbmRleCAwZDViOTY5
OGQzODQuLmQ5ZjZkZTAxMjIzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9n
ZW0uYwpAQCAtMzE4LDcgKzMxOCw3IEBAIHZvaWQgZXh5bm9zX2RybV9nZW1fcHV0X2RtYV9hZGRy
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJZHJtX2dlbV9vYmplY3RfdW5yZWZlcmVuY2VfdW5s
b2NrZWQob2JqKTsKIH0KIAotaW50IGV4eW5vc19kcm1fZ2VtX21tYXBfYnVmZmVyKHN0cnVjdCBl
eHlub3NfZHJtX2dlbV9vYmogKmV4eW5vc19nZW1fb2JqLAorc3RhdGljIGludCBleHlub3NfZHJt
X2dlbV9tbWFwX2J1ZmZlcihzdHJ1Y3QgZXh5bm9zX2RybV9nZW1fb2JqICpleHlub3NfZ2VtX29i
aiwKIAkJCQkgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiA9IGV4eW5vc19nZW1fb2JqLT5iYXNlLmRldjsKLS0gCjEuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
