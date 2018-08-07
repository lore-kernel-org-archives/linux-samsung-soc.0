From: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Subject: Re: [PATCH v3 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 7 Aug 2018 09:03:27 +0100
Message-ID: <20180807080327.GA32008@e114479-lin.cambridge.arm.com>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-11-alexandru-cosmin.gheorghe@arm.com>
 <20180806165752.GD17089@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180806165752.GD17089@vmware.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sinclair Yeh <syeh@vmware.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU2luY2xhaXIsCgpJcyBpdCBvayBpZiBJIG1lcmdlIHRoaXMgcGF0Y2ggdGhyb3VnaCBkcm0t
bWlzYy1uZXh0ID8KClRoYW5rIHlvdSwKQWxleCBHaGVvcmdoZQoKT24gTW9uLCBBdWcgMDYsIDIw
MTggYXQgMDk6NTc6NTNBTSAtMDcwMCwgU2luY2xhaXIgWWVoIHdyb3RlOgo+IEFja2VkLWJ5OiBT
aW5jbGFpciBZZWggPHN5ZWhAdm13YXJlLmNvbT4KPiAKPiBPbiBTYXQsIEF1ZyAwNCwgMjAxOCBh
dCAwNToxNTozMFBNICswMTAwLCBBbGV4YW5kcnUgR2hlb3JnaGUgd3JvdGU6Cj4gPiBBIG5ldyBo
ZWxwZXIgZnVuY3Rpb24oX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCkgaGFzIGJlZW4g
YWRkZWQKPiA+IGZvciBsaW5raW5nIGEgcGxhbmUgd2l0aCBpdHMgc3RhdGUgYW5kIHJlc2V0dGlu
ZyB0aGUgY29yZQo+ID4gcHJvcGVydGllcyhhbHBoYSwgcm90YXRpb24sIGV0Yy4pIHRvIHRoZWly
IGRlZmF1bHQgdmFsdWVzLgo+ID4gVXNlIHRoYXQgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUg
bG9naWMuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBTaW5jbGFpciBZZWggPHN5ZWhAdm13YXJlLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWluLmdoZW9y
Z2hlQGFybS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9r
bXMuYyB8IDQgKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKPiA+IGluZGV4
IDRhMGYwZjQxYWZhMS4uNjE4MjRlMzYwNjE5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2ttcy5jCj4gPiBAQCAtNzIwLDkgKzcyMCw3IEBAIHZvaWQgdm13X2R1X3BsYW5lX3Jl
c2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQo+ID4gIAkJcmV0dXJuOwo+ID4gIAl9Cj4gPiAg
Cj4gPiAtCXBsYW5lLT5zdGF0ZSA9ICZ2cHMtPmJhc2U7Cj4gPiAtCXBsYW5lLT5zdGF0ZS0+cGxh
bmUgPSBwbGFuZTsKPiA+IC0JcGxhbmUtPnN0YXRlLT5yb3RhdGlvbiA9IERSTV9NT0RFX1JPVEFU
RV8wOwo+ID4gKwlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmdnBzLT5i
YXNlKTsKPiA+ICB9Cj4gPiAgCj4gPiAgCj4gPiAtLSAKPiA+IDIuMTguMAo+ID4gCgotLSAKQ2hl
ZXJzLApBbGV4IEcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
