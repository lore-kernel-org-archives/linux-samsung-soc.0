From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: dsi: Remove bridge node reference in
 removal
Date: Fri, 26 May 2017 10:07:26 +0900
Message-ID: <59277FCE.9010502@samsung.com>
References: <CGME20170526010217epcas1p3bfb8d9f733bcdafb4209d917fdf28dd8@epcas1p3.samsung.com>
 <1495760521-330-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1495760521-330-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

CgoyMDE364WEIDA17JuUIDI27J28IDEwOjAy7JeQIEhvZWdldW4gS3dvbiDsnbQo6rCAKSDsk7Qg
6riAOgo+IFNpbmNlIGJyaWRnZSBub2RlIGlzIHJlZmVyZW5jZWQgZHVyaW5nIGluIHRoZSBwcm9i
ZSwgaXQgc2hvdWxkIGJlCj4gcmVsZWFzZWQgb24gcmVtb3ZhbC4KPiAKPiBTdWdnZXN0ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSG9l
Z2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+Cj4gLS0tCj4gSGkgSW5raSwKPiAK
PiBUaGlzIHBhdGNoIHNlZW1zIHRvIGhhdmUgYmVlbiBmb3Jnb3R0ZW4uLi4gOikKClllYWgsIGZv
cmdvdCB0aGlzLiBNZXJnZWQuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IENoYW5nZXMgZm9yIFYy
Ogo+IAo+IC0gQ2hlY2tlZCBmb3IgcmViYXNlIDQuMTItcmMyCj4gCj4gQmVzdCByZWdhcmRzLAo+
IEhvZWdldW4KPiAKPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIHwg
NCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCj4gaW5kZXggNjk4YTgyNC4uYTExYjc5NSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTgwNSw2ICsx
ODA1LDEwIEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAKPiAgc3RhdGljIGludCBleHlub3NfZHNpX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gKwlzdHJ1Y3QgZXh5bm9zX2RzaSAqZHNpID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gKwo+ICsJb2Zfbm9kZV9wdXQoZHNpLT5icmlkZ2Vf
bm9kZSk7Cj4gKwo+ICAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+ICAKPiAgCWNv
bXBvbmVudF9kZWwoJnBkZXYtPmRldiwgJmV4eW5vc19kc2lfY29tcG9uZW50X29wcyk7Cj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
