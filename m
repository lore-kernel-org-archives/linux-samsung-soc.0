From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 02/10] drm/rockchip: analogix_dp: split the lcdc select
 setting into device data
Date: Wed, 8 Jun 2016 18:56:48 +0800
Message-ID: <5757F9F0.7040806@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <1464066135-22605-1-git-send-email-ykk@rock-chips.com>
 <574E411E.2040503@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <574E411E.2040503@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark yao <mark.yao@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

TWFyaywKCk9uIDA2LzAxLzIwMTYgMDk6NTcgQU0sIE1hcmsgeWFvIHdyb3RlOgo+IE9uIDIwMTbl
ubQwNeaciDI05pelIDEzOjAyLCBZYWtpciBZYW5nIHdyb3RlOgo+PiBlRFAgY29udHJvbGxlciBu
ZWVkIHRvIGRlY2xhcmUgd2hpY2ggdm9wIHByb3ZpZGUgdGhlIHZpZGVvIHNvdXJjZSwKPj4gYW5k
IGl0J3MgZGVmaW5lZCBpbiBHUkYgcmVnaXN0ZXJzLgo+Pgo+PiBCdXQgZGlmZmVyZW50IGNoaXBz
IGhhdmUgZGlmZmVyZW50IEdSRiByZWdpc3RlciBhZGRyZXNzLCBzbyB3ZSBuZWVkIHRvCj4+IGNy
ZWF0ZSBhIGRldmljZSBkYXRhIHRvIGRlY2xhcmUgdGhlIEdSRiBtZXNzYWdlcyBmb3IgZWFjaCBj
aGlwcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZzx5a2tAcm9jay1jaGlwcy5jb20+
Cj4gTG9va3MgZm9yIG1lLCBTbzoKPgo+IEFja2VkLWJ5OiBNYXJrIFlhbyA8bWFyay55YW9Acm9j
ay1jaGlwcy5jb20+Cj4KClRoYW5rcyBmb3IgeW91ciBhY2tzIDspCgotIFlha2lyCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
