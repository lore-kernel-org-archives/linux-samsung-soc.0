From: Sinclair Yeh <syeh@vmware.com>
Subject: Re: [PATCH v3 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 7 Aug 2018 06:25:58 -0700
Message-ID: <20180807132557.GA1160@vmware.com>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-11-alexandru-cosmin.gheorghe@arm.com>
 <20180806165752.GD17089@vmware.com>
 <20180807080327.GA32008@e114479-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180807080327.GA32008@e114479-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDk6MDM6MjdBTSArMDEwMCwgQWxleGFuZHJ1LUNvc21p
biBHaGVvcmdoZSB3cm90ZToKPiBIaSBTaW5jbGFpciwKPiAKPiBJcyBpdCBvayBpZiBJIG1lcmdl
IHRoaXMgcGF0Y2ggdGhyb3VnaCBkcm0tbWlzYy1uZXh0ID8KClN1cmUuIFRoYW5rcyBmb3IgaGFu
ZGxpbmcgdGhpcy4KClNpbmNsYWlyCgo+IFRoYW5rIHlvdSwKPiBBbGV4IEdoZW9yZ2hlCj4gCj4g
T24gTW9uLCBBdWcgMDYsIDIwMTggYXQgMDk6NTc6NTNBTSAtMDcwMCwgU2luY2xhaXIgWWVoIHdy
b3RlOgo+ID4gQWNrZWQtYnk6IFNpbmNsYWlyIFllaCA8c3llaEB2bXdhcmUuY29tPgo+ID4gCj4g
PiBPbiBTYXQsIEF1ZyAwNCwgMjAxOCBhdCAwNToxNTozMFBNICswMTAwLCBBbGV4YW5kcnUgR2hl
b3JnaGUgd3JvdGU6Cj4gPiA+IEEgbmV3IGhlbHBlciBmdW5jdGlvbihfX2RybV9hdG9taWNfaGVs
cGVyX3BsYW5lX3Jlc2V0KSBoYXMgYmVlbiBhZGRlZAo+ID4gPiBmb3IgbGlua2luZyBhIHBsYW5l
IHdpdGggaXRzIHN0YXRlIGFuZCByZXNldHRpbmcgdGhlIGNvcmUKPiA+ID4gcHJvcGVydGllcyhh
bHBoYSwgcm90YXRpb24sIGV0Yy4pIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzLgo+ID4gPiBVc2Ug
dGhhdCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZSBsb2dpYy4KPiA+ID4gCj4gPiA+IFJldmll
d2VkLWJ5OiBTaW5jbGFpciBZZWggPHN5ZWhAdm13YXJlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6
IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIHwgNCArLS0t
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4g
PiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21z
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwo+ID4gPiBpbmRleCA0YTBm
MGY0MWFmYTEuLjYxODI0ZTM2MDYxOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfa21zLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfa21zLmMKPiA+ID4gQEAgLTcyMCw5ICs3MjAsNyBAQCB2b2lkIHZtd19kdV9wbGFuZV9y
ZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiA+ID4gIAkJcmV0dXJuOwo+ID4gPiAgCX0K
PiA+ID4gIAo+ID4gPiAtCXBsYW5lLT5zdGF0ZSA9ICZ2cHMtPmJhc2U7Cj4gPiA+IC0JcGxhbmUt
PnN0YXRlLT5wbGFuZSA9IHBsYW5lOwo+ID4gPiAtCXBsYW5lLT5zdGF0ZS0+cm90YXRpb24gPSBE
Uk1fTU9ERV9ST1RBVEVfMDsKPiA+ID4gKwlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0
KHBsYW5lLCAmdnBzLT5iYXNlKTsKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiAgCj4gPiA+IC0tIAo+
ID4gPiAyLjE4LjAKPiA+ID4gCj4gCj4gLS0gCj4gQ2hlZXJzLAo+IEFsZXggRwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
