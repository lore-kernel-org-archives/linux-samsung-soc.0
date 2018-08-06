From: Sinclair Yeh <syeh@vmware.com>
Subject: Re: [PATCH v3 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 6 Aug 2018 09:57:53 -0700
Message-ID: <20180806165752.GD17089@vmware.com>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-11-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180804161530.12275-11-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

QWNrZWQtYnk6IFNpbmNsYWlyIFllaCA8c3llaEB2bXdhcmUuY29tPgoKT24gU2F0LCBBdWcgMDQs
IDIwMTggYXQgMDU6MTU6MzBQTSArMDEwMCwgQWxleGFuZHJ1IEdoZW9yZ2hlIHdyb3RlOgo+IEEg
bmV3IGhlbHBlciBmdW5jdGlvbihfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KSBoYXMg
YmVlbiBhZGRlZAo+IGZvciBsaW5raW5nIGEgcGxhbmUgd2l0aCBpdHMgc3RhdGUgYW5kIHJlc2V0
dGluZyB0aGUgY29yZQo+IHByb3BlcnRpZXMoYWxwaGEsIHJvdGF0aW9uLCBldGMuKSB0byB0aGVp
ciBkZWZhdWx0IHZhbHVlcy4KPiBVc2UgdGhhdCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZSBs
b2dpYy4KPiAKPiBSZXZpZXdlZC1ieTogU2luY2xhaXIgWWVoIDxzeWVoQHZtd2FyZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWluLmdoZW9yZ2hlQGFybS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIHwgNCArLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwo+IGluZGV4IDRhMGYwZjQxYWZhMS4uNjE4MjRl
MzYwNjE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKPiBAQCAtNzIwLDkg
KzcyMCw3IEBAIHZvaWQgdm13X2R1X3BsYW5lX3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
KQo+ICAJCXJldHVybjsKPiAgCX0KPiAgCj4gLQlwbGFuZS0+c3RhdGUgPSAmdnBzLT5iYXNlOwo+
IC0JcGxhbmUtPnN0YXRlLT5wbGFuZSA9IHBsYW5lOwo+IC0JcGxhbmUtPnN0YXRlLT5yb3RhdGlv
biA9IERSTV9NT0RFX1JPVEFURV8wOwo+ICsJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNl
dChwbGFuZSwgJnZwcy0+YmFzZSk7Cj4gIH0KPiAgCj4gIAo+IC0tIAo+IDIuMTguMAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
