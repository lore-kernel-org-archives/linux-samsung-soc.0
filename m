From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Tue, 24 May 2016 11:12:20 -0700
Message-ID: <CAD=FV=WH6xYE6UiDxVK=cLnhoHnCvecSL4tk7FUVAnkGbQ-QOg@mail.gmail.com>
References: <1464066147-22734-1-git-send-email-ykk@rock-chips.com>
 <1464073043-4931-1-git-send-email-ykk@rock-chips.com>
 <6183955.XzKjc41sjW@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6183955.XzKjc41sjW@phil>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mark Yao <yzq@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiBUdWUsIE1heSAyNCwgMjAxNiBhdCAzOjE3IEFNLCBIZWlrbyBTdHVlYm5lciA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9naXhfZHAudHh0Cj4+
IEBAIC01LDYgKzUsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIGZvciBkcC1jb250cm9sbGVyOgo+
PiAgICAgICAgICAgICAgIHBsYXRmb3JtIHNwZWNpZmljIHN1Y2ggYXM6Cj4+ICAgICAgICAgICAg
ICAgICogInNhbXN1bmcsZXh5bm9zNS1kcCIKPj4gICAgICAgICAgICAgICAgKiAicm9ja2NoaXAs
cmszMjg4LWRwIgo+PiArICAgICAgICAgICAgICAqICJyb2NrY2hpcCxyazMzOTktZWRwIgo+Cj4g
dGhlIGNsZWFubGluZXMtZnJlYWsgaW4gbXkgbGlrZXMgdG8ga25vdyBpZiB0aGVyZSBpcyBhIGRp
ZmZlcmVuY2UgYmV0d2Vlbgo+IHRoZSByazMzOTkgYmVpbmcgY2FsbGVkIC1lZHAgaGVyZSBhbmQg
LWRwIG9uIHRoZSByazMyODggOi0pCj4KPiBbLi4uXQoKSWYgSSB3YXMgYSBndWVzc2luZyBtYW4g
KHdoaWNoIEknbSBub3QsIGJ1dCBpZiBJIHdhcyksIEknZCBndWVzcyB0aGF0CnRoaXMgaXMgYmVj
YXVzZSBvbiByazMyODggdGhlcmUgd2FzIG9ubHkgb25lIERQIHBvcnQgYW5kIGl0IHdhcyBhbiBF
RFAKcG9ydC4gIC4uLmJ1dCBzaW5jZSB0aGVyZSB3YXMgb25seSBvbmUgcGVvcGxlIGp1c3QgcmVm
ZXJyZWQgdG8gaXQgYXMKdGhlICJEUCIgcG9ydCBhbmQgdGhhdCB3YXMgY29kaWZpZWQgaW4gdGhl
IGJpbmRpbmdzLiAgT24gcmszMzk5IHRoZXJlCmFyZSB0d28gcG9ydHM6IG9uZSBFRFAgYW5kIG9u
ZSBEUC4gIEFsbCBvZiBhIHN1ZGRlbiB3ZSBuZWVkIHRvCmRpZmZlcmVudGlhdGUuCgpBbnkgYmV0
dGVyIHN1Z2dlc3Rpb25zIGZvciBob3cgdG8gZGVhbCB3aXRoIHRoYXQ/CgoKLURvdWcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
