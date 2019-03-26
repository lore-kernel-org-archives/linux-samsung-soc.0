From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 08/21] drm/exynos: Use drm_fb_helper_fill_info
Date: Tue, 26 Mar 2019 15:27:15 +0100
Message-ID: <d60c9546-0041-1972-86e0-54cecdb59b1b@tronnes.org>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
 <20190326132008.11781-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-8-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc@vger.kernel.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

CgpEZW4gMjYuMDMuMjAxOSAxNC4xOSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBUaGlzIHdpbGwg
Z2l2ZSB0aGUgZXh5bm9zIGZiZGV2IGEgbmFtZSEKPiAKPiB2MjogUmViYXNlCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDky
Mi5zaGltQHNhbXN1bmcuY29tPgo+IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1
bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgo+
IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+IENjOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KClJl
dmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
