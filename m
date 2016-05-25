From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Wed, 25 May 2016 13:54:30 +0800
Message-ID: <57453E16.4060805@rock-chips.com>
References: <1464066147-22734-1-git-send-email-ykk@rock-chips.com>
 <6183955.XzKjc41sjW@phil>
 <CAD=FV=WH6xYE6UiDxVK=cLnhoHnCvecSL4tk7FUVAnkGbQ-QOg@mail.gmail.com>
 <8988677.GHLC4rSfsM@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8988677.GHLC4rSfsM@phil>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mark Yao <yzq@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

Ck9uIDA1LzI1LzIwMTYgMDI6MjMgQU0sIEhlaWtvIFN0dWVibmVyIHdyb3RlOgo+IEFtIERpZW5z
dGFnLCAyNC4gTWFpIDIwMTYsIDExOjEyOjIwIHNjaHJpZWIgRG91ZyBBbmRlcnNvbjoKPj4gSGks
Cj4+Cj4+IE9uIFR1ZSwgTWF5IDI0LCAyMDE2IGF0IDM6MTcgQU0sIEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dpeF9kcC50eHQKPj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9naXhfZHAu
dHh0Cj4+Pj4KPj4+PiBAQCAtNSw2ICs1LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyBmb3IgZHAt
Y29udHJvbGxlcjoKPj4+PiAgICAgICAgICAgICAgICBwbGF0Zm9ybSBzcGVjaWZpYyBzdWNoIGFz
Ogo+Pj4+ICAgICAgICAgICAgICAgICAqICJzYW1zdW5nLGV4eW5vczUtZHAiCj4+Pj4gICAgICAg
ICAgICAgICAgICogInJvY2tjaGlwLHJrMzI4OC1kcCIKPj4+Pgo+Pj4+ICsgICAgICAgICAgICAg
ICogInJvY2tjaGlwLHJrMzM5OS1lZHAiCj4+PiB0aGUgY2xlYW5saW5lcy1mcmVhayBpbiBteSBs
aWtlcyB0byBrbm93IGlmIHRoZXJlIGlzIGEgZGlmZmVyZW5jZQo+Pj4gYmV0d2Vlbgo+Pj4gdGhl
IHJrMzM5OSBiZWluZyBjYWxsZWQgLWVkcCBoZXJlIGFuZCAtZHAgb24gdGhlIHJrMzI4OCA6LSkK
Pj4+Cj4+PiBbLi4uXQo+PiBJZiBJIHdhcyBhIGd1ZXNzaW5nIG1hbiAod2hpY2ggSSdtIG5vdCwg
YnV0IGlmIEkgd2FzKSwgSSdkIGd1ZXNzIHRoYXQKPj4gdGhpcyBpcyBiZWNhdXNlIG9uIHJrMzI4
OCB0aGVyZSB3YXMgb25seSBvbmUgRFAgcG9ydCBhbmQgaXQgd2FzIGFuIEVEUAo+PiBwb3J0LiAg
Li4uYnV0IHNpbmNlIHRoZXJlIHdhcyBvbmx5IG9uZSBwZW9wbGUganVzdCByZWZlcnJlZCB0byBp
dCBhcwo+PiB0aGUgIkRQIiBwb3J0IGFuZCB0aGF0IHdhcyBjb2RpZmllZCBpbiB0aGUgYmluZGlu
Z3MuICBPbiByazMzOTkgdGhlcmUKPj4gYXJlIHR3byBwb3J0czogb25lIEVEUCBhbmQgb25lIERQ
LiAgQWxsIG9mIGEgc3VkZGVuIHdlIG5lZWQgdG8KPj4gZGlmZmVyZW50aWF0ZS4KPj4KPj4gQW55
IGJldHRlciBzdWdnZXN0aW9ucyBmb3IgaG93IHRvIGRlYWwgd2l0aCB0aGF0Pwo+IG5vcGUgLSBl
dmVyeXRoaW5nIGFzIGl0IHNob3VsZCBiZSBpbiB0aGF0IHJlZ2FyZCB0aGVuIC0gdGhlIHJrMzI4
OC1kcCBpcwo+IHBlcm1hbmVudCBub3cgYW55d2F5Lgo+Cj4gQnV0IGl0IGxvb2tzIGxpa2UgSSdt
IHNvcnQgb2YgYmxpbmQgYmxpbmQgYW5kIG9ubHkgbm93IGhhdmUgc2VlbiB0aGUKPiBzZXBhcmF0
ZSBEUCBjb250cm9sbGVyIGNoYXB0ZXIgaW4gdGhlIFRSTSAocHJvYmFibHkgYmVjYXVzZSBJIHNv
bWVob3cgZGlkbid0Cj4gZXhwZWN0IGEgc2Vjb25kIGNvbnRyb2xsZXIpLgpSSzMzOTkgZURQIGNv
bnRyb2xsZXIgaGF2ZSBjdXQgb2ZmIHRoZSBEUC1BdWRpbyBmdW5jdGlvbiBhbmQgRFAtSERDUCAK
ZnVuY3Rpb24sIHNvIGl0IGNhbid0IGJlIHRyZWF0ZWQgYXMgRFAgaW50ZXJmYWNlcyBhbnkgbW9y
ZSwgdGhhdCdzIHdoeSBJIApjYWxsIGl0ICJlRFAiLgo+Cj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
