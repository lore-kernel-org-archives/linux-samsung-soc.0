From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: [PATCH v2 02/10] drm/rockchip: analogix_dp: split the lcdc select
 setting into device data
Date: Wed, 1 Jun 2016 09:57:50 +0800
Message-ID: <574E411E.2040503@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <1464066135-22605-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464066135-22605-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNuW5tDA15pyIMjTml6UgMTM6MDIsIFlha2lyIFlhbmcgd3JvdGU6Cj4gZURQIGNvbnRy
b2xsZXIgbmVlZCB0byBkZWNsYXJlIHdoaWNoIHZvcCBwcm92aWRlIHRoZSB2aWRlbyBzb3VyY2Us
Cj4gYW5kIGl0J3MgZGVmaW5lZCBpbiBHUkYgcmVnaXN0ZXJzLgo+Cj4gQnV0IGRpZmZlcmVudCBj
aGlwcyBoYXZlIGRpZmZlcmVudCBHUkYgcmVnaXN0ZXIgYWRkcmVzcywgc28gd2UgbmVlZCB0bwo+
IGNyZWF0ZSBhIGRldmljZSBkYXRhIHRvIGRlY2xhcmUgdGhlIEdSRiBtZXNzYWdlcyBmb3IgZWFj
aCBjaGlwcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmc8eWtrQHJvY2stY2hpcHMuY29t
PgpMb29rcyBmb3IgbWUsIFNvOgoKQWNrZWQtYnk6IE1hcmsgWWFvIDxtYXJrLnlhb0Byb2NrLWNo
aXBzLmNvbT4KCi0tIArvvK1hcmsgWWFvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
