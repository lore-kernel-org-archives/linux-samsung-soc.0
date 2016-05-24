From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Tue, 24 May 2016 20:23:48 +0200
Message-ID: <8988677.GHLC4rSfsM@phil>
References: <1464066147-22734-1-git-send-email-ykk@rock-chips.com>
 <6183955.XzKjc41sjW@phil>
 <CAD=FV=WH6xYE6UiDxVK=cLnhoHnCvecSL4tk7FUVAnkGbQ-QOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=WH6xYE6UiDxVK=cLnhoHnCvecSL4tk7FUVAnkGbQ-QOg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mark Yao <yzq@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

QW0gRGllbnN0YWcsIDI0LiBNYWkgMjAxNiwgMTE6MTI6MjAgc2NocmllYiBEb3VnIEFuZGVyc29u
Ogo+IEhpLAo+IAo+IE9uIFR1ZSwgTWF5IDI0LCAyMDE2IGF0IDM6MTcgQU0sIEhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dpeF9kcC50eHQKPiA+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9n
aXhfZHAudHh0Cj4gPj4gCj4gPj4gQEAgLTUsNiArNSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMg
Zm9yIGRwLWNvbnRyb2xsZXI6Cj4gPj4gICAgICAgICAgICAgICBwbGF0Zm9ybSBzcGVjaWZpYyBz
dWNoIGFzOgo+ID4+ICAgICAgICAgICAgICAgICogInNhbXN1bmcsZXh5bm9zNS1kcCIKPiA+PiAg
ICAgICAgICAgICAgICAqICJyb2NrY2hpcCxyazMyODgtZHAiCj4gPj4gCj4gPj4gKyAgICAgICAg
ICAgICAgKiAicm9ja2NoaXAscmszMzk5LWVkcCIKPiA+IAo+ID4gdGhlIGNsZWFubGluZXMtZnJl
YWsgaW4gbXkgbGlrZXMgdG8ga25vdyBpZiB0aGVyZSBpcyBhIGRpZmZlcmVuY2UKPiA+IGJldHdl
ZW4KPiA+IHRoZSByazMzOTkgYmVpbmcgY2FsbGVkIC1lZHAgaGVyZSBhbmQgLWRwIG9uIHRoZSBy
azMyODggOi0pCj4gPiAKPiA+IFsuLi5dCj4gCj4gSWYgSSB3YXMgYSBndWVzc2luZyBtYW4gKHdo
aWNoIEknbSBub3QsIGJ1dCBpZiBJIHdhcyksIEknZCBndWVzcyB0aGF0Cj4gdGhpcyBpcyBiZWNh
dXNlIG9uIHJrMzI4OCB0aGVyZSB3YXMgb25seSBvbmUgRFAgcG9ydCBhbmQgaXQgd2FzIGFuIEVE
UAo+IHBvcnQuICAuLi5idXQgc2luY2UgdGhlcmUgd2FzIG9ubHkgb25lIHBlb3BsZSBqdXN0IHJl
ZmVycmVkIHRvIGl0IGFzCj4gdGhlICJEUCIgcG9ydCBhbmQgdGhhdCB3YXMgY29kaWZpZWQgaW4g
dGhlIGJpbmRpbmdzLiAgT24gcmszMzk5IHRoZXJlCj4gYXJlIHR3byBwb3J0czogb25lIEVEUCBh
bmQgb25lIERQLiAgQWxsIG9mIGEgc3VkZGVuIHdlIG5lZWQgdG8KPiBkaWZmZXJlbnRpYXRlLgo+
IAo+IEFueSBiZXR0ZXIgc3VnZ2VzdGlvbnMgZm9yIGhvdyB0byBkZWFsIHdpdGggdGhhdD8KCm5v
cGUgLSBldmVyeXRoaW5nIGFzIGl0IHNob3VsZCBiZSBpbiB0aGF0IHJlZ2FyZCB0aGVuIC0gdGhl
IHJrMzI4OC1kcCBpcyAKcGVybWFuZW50IG5vdyBhbnl3YXkuCgpCdXQgaXQgbG9va3MgbGlrZSBJ
J20gc29ydCBvZiBibGluZCBibGluZCBhbmQgb25seSBub3cgaGF2ZSBzZWVuIHRoZSAKc2VwYXJh
dGUgRFAgY29udHJvbGxlciBjaGFwdGVyIGluIHRoZSBUUk0gKHByb2JhYmx5IGJlY2F1c2UgSSBz
b21laG93IGRpZG4ndCAKZXhwZWN0IGEgc2Vjb25kIGNvbnRyb2xsZXIpLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
