From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 2/4] drm/sun4i: Use the runtime_pm commit_tail variant
Date: Thu, 20 Jul 2017 15:01:17 +0200
Message-ID: <79d61e6736618dea1753d9a9b3fbde43cdee5929.1500555652.git-series.maxime.ripard@free-electrons.com>
References: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
References: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGJhY2tlbmQgKHBsYW5lcykgY29tbWl0IGNhbiBvbmx5IGhhcHBlbiB3aGVuIHRoZSBUQ09O
IChDUlRDKSBpcwplbmFibGVkLCB3aGljaCBpcyBub3QgZ3VhcmFudGVlZCB3aXRoIHRoZSBkZWZh
dWx0IGNvbW1pdF90YWlsIGhlbHBlci4KCkxldCdzIHVzZSB0aGUgcnVudGltZV9wbSB2ZXJzaW9u
IHRoYXQgaXMgZGVzaWduZWQgc3BlY2lmaWNhbGx5IHRvIGRlYWwgd2l0aAp0aGF0IGNhc2UuCgpT
aWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25z
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZnJhbWVidWZmZXIuYyB8IDYg
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZnJhbWVidWZmZXIuYwppbmRleCA5ODcyZTBmYzAzYjAuLjUzYWI2MTY2NTM5
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMKQEAgLTEwLDYg
KzEwLDcgQEAKICAqIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgogICovCiAKKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1QLmg+CkBAIC0zMSw2ICszMiwxMCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBzdW40aV9kZV9tb2RlX2NvbmZpZ19mdW5jcyA9
IHsKIAkuZmJfY3JlYXRlCQk9IGRybV9mYl9jbWFfY3JlYXRlLAogfTsKIAorc3RhdGljIHN0cnVj
dCBkcm1fbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzIHN1bjRpX2RlX21vZGVfY29uZmlnX2hlbHBl
cnMgPSB7CisJLmF0b21pY19jb21taXRfdGFpbAk9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90
YWlsX3JwbSwKK307CisKIHN0cnVjdCBkcm1fZmJkZXZfY21hICpzdW40aV9mcmFtZWJ1ZmZlcl9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRy
bSk7CkBAIC0zOSw2ICs0NCw3IEBAIHN0cnVjdCBkcm1fZmJkZXZfY21hICpzdW40aV9mcmFtZWJ1
ZmZlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJZHJtLT5tb2RlX2NvbmZpZy5tYXhf
aGVpZ2h0ID0gODE5MjsKIAogCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmc3VuNGlfZGVfbW9k
ZV9jb25maWdfZnVuY3M7CisJZHJtLT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZSA9ICZzdW40
aV9kZV9tb2RlX2NvbmZpZ19oZWxwZXJzOwogCiAJcmV0dXJuIGRybV9mYmRldl9jbWFfaW5pdChk
cm0sIDMyLCBkcm0tPm1vZGVfY29uZmlnLm51bV9jb25uZWN0b3IpOwogfQotLSAKZ2l0LXNlcmll
cyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
