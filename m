From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: Don't power bridge in
 analogix_dp_bind
Date: Mon, 05 Mar 2018 13:39:29 +0100
Message-ID: <8401762.TthTLs8B3o@diego>
References: <20180305085741.18896-1-m.szyprowski@samsung.com>
 <CGME20180305085804eucas1p10709830a36b02a28a6cb74827968f64d@eucas1p1.samsung.com>
 <20180305085741.18896-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180305085741.18896-2-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Douglas Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Lin Huang <hl@rock-chips.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>, linux-rockchip@lists.infradead.org, Thierry Escande <thierry.escande@collabora.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Caesar Wang <wxt@rock-chips.com>, Zain Wang <wzz@rock-chips.com>, Haixia Shi <hshi@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

QW0gTW9udGFnLCA1LiBNw6RyeiAyMDE4LCAwOTo1NzozOSBDRVQgc2NocmllYiBNYXJlayBTenlw
cm93c2tpOgo+IEZyb206IHphaW4gd2FuZyA8d3p6QHJvY2stY2hpcHMuY29tPgo+IAo+IFRoZSBi
cmlkZ2UgZG9lcyBub3QgbmVlZCB0byBiZSBwb3dlcmVkIGluIGFuYWxvZ2l4X2RwX2JpbmQoKSwg
c28KPiByZW1vdmUgdGhlIGNhbGxzIHRvIHBtX3J1bnRpbWVfZ2V0KCkvcGh5X3Bvd2VyX29uKCkv
YW5hbG9naXhfZHBfaW5pdF9kcCgpCj4gYXMgd2VsbCBhcyB0aGVpciBwb3dlci1vZmYgY291bnRl
cnBhcnRzLgo+IAo+IENjOiBTdMOpcGhhbmUgTWFyY2hlc2luIDxtYXJjaGV1QGNocm9taXVtLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiB6YWluIHdhbmcgPHd6ekByb2NrLWNoaXBzLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDYWVzYXIgV2FuZyA8d3h0QHJvY2stY2hpcHMuY29tPgo+IFt0aGUgcGF0Y2gg
b3JpZ2luYWxseSBqdXN0IHJlbW92ZWQgdGhlIHBvd2VyX29uIHBvcnRpb24sIHNlYW5wYXVsIHJl
bW92ZWQKPiB0aGUgcG93ZXIgb2ZmIGNvZGUgYXMgd2VsbCBhcyBpbXByb3ZlZCB0aGUgY29tbWl0
IG1lc3NhZ2VdCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBFc2NhbmRlIDx0aGllcnJ5LmVzY2FuZGVAY29s
bGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dz
a2lAc2Ftc3VuZy5jb20+CgpvbiB0b3Agb2YgY3VycmVudCBkcm0tbWlzYy1uZXh0IG9uIHJrMzI4
OCBhbmQgcmszMzk5ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
CmFuZCB0aGUgYWN0dWFsIGNoYW5nZSBhbHNvIGxvb2tzIHNhbmUgb2YgY291cnNlLCBzbwpSZXZp
ZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
