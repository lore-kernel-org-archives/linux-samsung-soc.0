From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 24/26] drm/bridge: remove the .of_node member
Date: Sat, 19 May 2018 18:08:30 +0200
Message-ID: <5194502.mIuqRB9jFM@phil>
References: <20180516101510.13215-1-peda@axentia.se>
 <20180516101510.13215-25-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180516101510.13215-25-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Martin Donnelly <martin.donnelly@ge.com>, linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

QW0gTWl0dHdvY2gsIDE2LiBNYWkgMjAxOCwgMTI6MTU6MDggQ0VTVCBzY2hyaWViIFBldGVyIFJv
c2luOgo+IEl0IGlzIHVudXNlZC4KPiAKPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVu
dGlhLnNlPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9sdmRzLmMKPiBpbmRl
eCA1NTdlMDA3OWM5OGQuLmU3N2Q0YzkwOTU4MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfbHZkcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2x2ZHMuYwo+IEBAIC0zNzcsOCArMzc3LDYgQEAgc3RhdGljIGludCByb2Nr
Y2hpcF9sdmRzX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIs
Cj4gIAl9Cj4gIAlpZiAobHZkcy0+cGFuZWwpCj4gIAkJcmVtb3RlID0gbHZkcy0+cGFuZWwtPmRl
di0+b2Zfbm9kZTsKPiAtCWVsc2UgaWYgKGx2ZHMtPmJyaWRnZS0+b2Zfbm9kZSkKPiAtCQlyZW1v
dGUgPSBsdmRzLT5icmlkZ2UtPm9mX25vZGU7Cj4gIAllbHNlCj4gIAkJcmVtb3RlID0gbHZkcy0+
YnJpZGdlLT5vZGV2LT5vZl9ub2RlOwo+ICAJaWYgKG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRl
di0+b2Zfbm9kZSwgInJvY2tjaGlwLG91dHB1dCIsICZuYW1lKSkKCmZvciB0aGUgUm9ja2NoaXAt
cGFydApBY2tlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
