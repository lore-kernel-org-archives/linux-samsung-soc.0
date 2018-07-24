From: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
Subject: Re: [PATCH 09/10] drm/vc4: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 09:11:21 +0100
Message-ID: <20180724081121.GA22689@e114479-lin.cambridge.arm.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-10-alexandru-cosmin.gheorghe@arm.com>
 <20180724065720.5bhepamdo57it7nl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180724065720.5bhepamdo57it7nl@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWF4aW1lLAoKT24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDg6NTc6MjBBTSArMDIwMCwgTWF4
aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBGcmksIEp1bCAyMCwgMjAxOCBhdCAxMDoxNTowOFBNICsw
MTAwLCBBbGV4YW5kcnUgR2hlb3JnaGUgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cnUgR2hlb3JnaGUgPGFsZXhhbmRydS1jb3NtaW4uZ2hlb3JnaGVAYXJtLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgfCA0ICstLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfcGxhbmUuYwo+ID4gaW5kZXggOWQ3YTM2ZjE0OGNmLi42ODhhZDliYjBmMDggMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCj4gPiBAQCAtMjAwLDkgKzIwMCw3IEBAIHN0YXRp
YyB2b2lkIHZjNF9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiA+ICAJaWYg
KCF2YzRfc3RhdGUpCj4gPiAgCQlyZXR1cm47Cj4gPiAgCj4gPiAtCXBsYW5lLT5zdGF0ZSA9ICZ2
YzRfc3RhdGUtPmJhc2U7Cj4gPiAtCXBsYW5lLT5zdGF0ZS0+YWxwaGEgPSBEUk1fQkxFTkRfQUxQ
SEFfT1BBUVVFOwo+ID4gLQl2YzRfc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFuZTsKPiA+ICsJX19k
cm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnZjNF9zdGF0ZS0+YmFzZSk7Cj4g
Cj4gRm9yIHZjNCwgcmNhci1kdSwgYXRtZWwtaGxjZGMgYW5kIHN1bjRpLCB5b3UncmUgY2hhbmdp
bmcgdGhlIHJlc2V0Cj4gdmFsdWUgb2YgYWxwaGEgZnJvbSBEUk1fQkxFTkRfQUxQSEFfT1BBUVVF
IHRvCj4gcGxhbmUtPmFscGhhX3Byb3BlcnR5LT52YWx1ZXNbMV0uCgpwbGFuZS0+YWxwaGFfcHJv
cGVydHktPnZhbHVlc1sxXSBob2xkcyB0aGUgbWF4IHZhbHVlIGZvciBhbHBoYSwgYW5kCml0J3Mg
aW5pdGlhbGl6ZWQgYnkgdGhlIGNvcmUgdG8gRFJNX0JMRU5EX0FMUEhBX09QQVFVRS4KCj4gCj4g
VGhpcyBtaWdodCBvciBtaWdodCBub3QgYmUgYSBnb29kIGlkZWEsIGJ1dCB5b3Ugc2hvdWxkIGRl
ZmluaXRlbHkKPiBleHBsYWluIHdoeS4KCldvdWxkIGEgY29tbWl0IG1lc3NhZ2Ugc3VmZmljZT8g
T3IgZG8geW91IGhhdmUgb3RoZXIgaWRlYXM/Cgo+IAo+IE1heGltZQo+IAo+IC0tIAo+IE1heGlt
ZSBSaXBhcmQsIEJvb3RsaW4gKGZvcm1lcmx5IEZyZWUgRWxlY3Ryb25zKQo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIApD
aGVlcnMsCkFsZXggRwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
