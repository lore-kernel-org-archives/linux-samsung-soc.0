From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/3] drm/rockchip: lvds: avoid duplicating
 drm_bridge_attach
Date: Sun, 20 May 2018 13:48:39 +0200
Message-ID: <2076868.NHBhtu2M9j@phil>
References: <20180502074025.12421-1-peda@axentia.se>
 <20180502074025.12421-3-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180502074025.12421-3-peda@axentia.se>
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

QW0gTWl0dHdvY2gsIDIuIE1haSAyMDE4LCAwOTo0MDoyNCBDRVNUIHNjaHJpZWIgUGV0ZXIgUm9z
aW46Cj4gZHJtX2JyaWRnZV9hdHRhY2ggdGFrZXMgY2FyZSBvZiB0aGVzZSBhc3NpZ25tZW50cywg
c28gdGhlcmUgaXMgbm8gbmVlZAo+IHRvIG9wZW4tY29kZSB0aGVtIGEgc2Vjb25kIHRpbWUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KCmFwcGxpZWQg
dG8gZHJtLW1pc2MtbmV4dAoKClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
