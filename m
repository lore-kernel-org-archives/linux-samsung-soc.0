From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/6] drm/exynos: g2d: rework sleep and runtime PM
Date: Wed, 28 Sep 2016 16:20:34 +0200
Message-ID: <94315e2e-53b8-d78c-f10d-af632d58031d@samsung.com>
References: <CGME20160927155025eucas1p2ccb53d883393322dc40433a1af91a75a@eucas1p2.samsung.com>
 <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RGVhciBUb2JpYXMsCgoKT24gMjAxNi0wOS0yNyAxNzo1MCwgVG9iaWFzIEpha29iaSB3cm90ZToK
PiBIZWxsbyBldmVyeW9uZSwKPgo+IGFzIGRpc2N1c3NlZCB3aXRoIE1hcmVrIEkgaGF2ZSBicm9r
ZW4gZG93biBteSBpbml0aWFsIHBhdGNoIGludG8gc21hbGxlciBwaWVjZXIuCj4KPiBBbnl3YXks
IHRoaXMgc2VyaWVzIGZpeGVzIGEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IGNvbW1pdAo+IGIw
NTk4NGUyMWE3ZTAwMGJmNTA3NGFjZTAwZDdhNTc0OTQ0YjJjMTYuCj4KPiBXaXRoIGJlc3Qgd2lz
aGVzLAo+IFRvYmlhcwoKUGF0Y2hlcyBsb29rcyByZWFsbHkgbmljZSEgSG93ZXZlciBJIGRpZG4n
dCBoYXZlIHRpbWUgdG8gdGVzdCB0aGVtIG9uIAp0aGUgcmVhbApoYXJkd2FyZS4KCllvdSBjYW4g
YWRkIG15OgpBY2tlZC1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcu
Y29tPgoKPiBUb2JpYXMgSmFrb2JpICg2KToKPiAgICBSZXZlcnQgImRybS9leHlub3M6IGcyZDog
Zml4IHN5c3RlbSBhbmQgcnVudGltZSBwbSBpbnRlZ3JhdGlvbiIKPiAgICBkcm0vZXh5bm9zOiBn
MmQ6IG1vdmUgUE0gbWFuYWdlbWVudCB0byBydW5xdWV1ZSB3b3JrZXIKPiAgICBkcm0vZXh5bm9z
OiBnMmQ6IHJlbW92ZSBydW5xdWV1ZSBub2RlcyBpbiBnMmRfe2Nsb3NlLHJlbW92ZX0oKQo+ICAg
IGRybS9leHlub3M6IGcyZDogd2FpdCBmb3IgZW5naW5lIHRvIGZpbmlzaAo+ICAgIGRybS9leHlu
b3M6IGcyZDogdXNlIGF1dG9zdXNwZW5kIG1vZGUgZm9yIFBNIHJ1bnRpbWUKPiAgICBkcm0vZXh5
bm9zOiBnMmQ6IHNpbXBsaWZ5IGcyZF9mcmVlX3J1bnF1ZXVlX25vZGUoKQo+Cj4gICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgfCAyMzcgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgNDkg
ZGVsZXRpb25zKC0pCj4KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNh
bXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
