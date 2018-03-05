From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] drm/bridge: analogix_dp: Don't create useless
 connectors
Date: Mon, 05 Mar 2018 13:46:45 +0100
Message-ID: <4078320.nnEcCJcJit@diego>
References: <20180305085741.18896-1-m.szyprowski@samsung.com>
 <CGME20180305085806eucas1p2156c70fa406dd25814b12a873dac5281@eucas1p2.samsung.com>
 <20180305085741.18896-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180305085741.18896-4-m.szyprowski@samsung.com>
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Lin Huang <hl@rock-chips.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>, linux-rockchip@lists.infradead.org, Thierry Escande <thierry.escande@collabora.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Zain Wang <wzz@rock-chips.com>, Haixia Shi <hshi@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

QW0gTW9udGFnLCA1LiBNw6RyeiAyMDE4LCAwOTo1Nzo0MSBDRVQgc2NocmllYiBNYXJlayBTenlw
cm93c2tpOgo+IElmIHRoZXJlIGlzIGFub3RoZXIgYnJpZGdlIGFmdGVyIGFuYWxvZ2l4X2RwLCB0
aGVuIHRoZSBjb25uZWN0b3Igb2JqZWN0Cj4gc2hvdWxkIG5vdCBiZSBjcmVhdGVkLiBUaGlzIGZp
eGVzIGZvbGxvd2luZyB0aW1lb3V0cyBvbiBFeHlub3M1NDIwLWJhc2VkCj4gQ2hyb21lYm9vazIg
UGVhY2gtUElUIGJvYXJkIGR1cmluZyBib290Ogo+IAo+IGV4eW5vcy1kcCAxNDViMDAwMC5kcC1j
b250cm9sbGVyOiBBVVggQ0ggY21kIHJlcGx5IHRpbWVvdXQhCj4gZXh5bm9zLWRwIDE0NWIwMDAw
LmRwLWNvbnRyb2xsZXI6IEFVWCBDSCBlbmFibGUgdGltZW91dCEKPiBleHlub3MtZHAgMTQ1YjAw
MDAuZHAtY29udHJvbGxlcjogQVVYIENIIGVuYWJsZSB0aW1lb3V0IQo+IGV4eW5vcy1kcCAxNDVi
MDAwMC5kcC1jb250cm9sbGVyOiBBVVggQ0ggZW5hYmxlIHRpbWVvdXQhCj4gZXh5bm9zLWRwIDE0
NWIwMDAwLmRwLWNvbnRyb2xsZXI6IEFVWCBDSCBlbmFibGUgdGltZW91dCEKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CgpvbiB0
b3Agb2YgY3VycmVudCBkcm0tbWlzYy1uZXh0IG9uIHJrMzI4OCBhbmQgcmszMzk5ClRlc3RlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KClRoZSBjaGFuZ2UgaXRzZWxmIGFs
c28gbG9va3Mgc2FuZSB0byBtZSwgYnV0IG15IGtub3dsZWRnZSBhYm91dApkcm0taW50ZXJuYWxz
IGlzIHN0aWxsIG5vdyB0aGF0IGhpZ2gsIHNvIEkgY2FuJ3QgcmVhbGx5IHNheSBpZiBJJ20gbWlz
c2luZwpzb21ldGhpbmcuCgoKSGVpa28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
