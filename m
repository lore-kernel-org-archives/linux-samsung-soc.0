From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 2/4] drm/sun4i: Use the runtime_pm commit_tail variant
Date: Thu, 13 Jul 2017 16:41:14 +0200
Message-ID: <672c009f30c3121d75eb367743f89b0c69d16f5f.1499956639.git-series.maxime.ripard@free-electrons.com>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
References: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGJhY2tlbmQgKHBsYW5lcykgY29tbWl0IGNhbiBvbmx5IGhhcHBlbiB3aGVuIHRoZSBUQ09O
IChDUlRDKSBpcwplbmFibGVkLCB3aGljaCBpcyBub3QgZ3VhcmFudGVlZCB3aXRoIHRoZSBkZWZh
dWx0IGNvbW1pdF90YWlsIGhlbHBlci4KCkxldCdzIHVzZSB0aGUgcnVudGltZV9wbSB2ZXJzaW9u
IHRoYXQgaXMgZGVzaWduZWQgc3BlY2lmaWNhbGx5IHRvIGRlYWwgd2l0aAp0aGF0IGNhc2UuCgpT
aWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25z
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZnJhbWVidWZmZXIuYyB8IDYg
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZnJhbWVidWZmZXIuYwppbmRleCA5ODcyZTBmYzAzYjAuLjE4OTA0OGQzM2Ex
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2ZyYW1lYnVmZmVyLmMKQEAgLTEwLDYg
KzEwLDcgQEAKICAqIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgogICovCiAKKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1QLmg+CkBAIC0zMSw2ICszMiwxMCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBzdW40aV9kZV9tb2RlX2NvbmZpZ19mdW5jcyA9
IHsKIAkuZmJfY3JlYXRlCQk9IGRybV9mYl9jbWFfY3JlYXRlLAogfTsKIAorc3RhdGljIHN0cnVj
dCBkcm1fbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzIHN1bjRpX2RlX21vZGVfY29uZmlnX2hlbHBl
cnMgPSB7CisJLmF0b21pY19jb21taXRfdGFpbAk9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90
YWlsX3J1bnRpbWVfcG0sCit9OworCiBzdHJ1Y3QgZHJtX2ZiZGV2X2NtYSAqc3VuNGlfZnJhbWVi
dWZmZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogewogCWRybV9tb2RlX2NvbmZpZ19y
ZXNldChkcm0pOwpAQCAtMzksNiArNDQsNyBAQCBzdHJ1Y3QgZHJtX2ZiZGV2X2NtYSAqc3VuNGlf
ZnJhbWVidWZmZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogCWRybS0+bW9kZV9jb25m
aWcubWF4X2hlaWdodCA9IDgxOTI7CiAKIAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJnN1bjRp
X2RlX21vZGVfY29uZmlnX2Z1bmNzOworCWRybS0+bW9kZV9jb25maWcuaGVscGVyX3ByaXZhdGUg
PSAmc3VuNGlfZGVfbW9kZV9jb25maWdfaGVscGVyczsKIAogCXJldHVybiBkcm1fZmJkZXZfY21h
X2luaXQoZHJtLCAzMiwgZHJtLT5tb2RlX2NvbmZpZy5udW1fY29ubmVjdG9yKTsKIH0KLS0gCmdp
dC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
