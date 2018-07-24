From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 03/10] drm: mali-dp: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Tue, 24 Jul 2018 09:26:36 +0100
Message-ID: <20180724082636.GD23516@e110455-lin.cambridge.arm.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-4-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180720211509.23605-4-alexandru-cosmin.gheorghe@arm.com>
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTA6MTU6MDJQTSArMDEwMCwgQWxleGFuZHJ1IEdoZW9y
Z2hlIHdyb3RlOgoKV2l0aCBhIG1vcmUgZGV0YWlsZWQgY29tbWl0IG1lc3NhZ2U6CgpBY2tlZC1i
eTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYyB8IDcgKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCj4gaW5kZXggMjk0MDlhNjVkODY0Li40OWMzN2Y2ZGQ2
M2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+IEBAIC03OCwxMSArNzgs
OCBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfcGxhbmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUpCj4gIAlrZnJlZShzdGF0ZSk7Cj4gIAlwbGFuZS0+c3RhdGUgPSBOVUxMOwo+ICAJc3RhdGUg
PSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAtCWlmIChzdGF0ZSkgewo+
IC0JCXN0YXRlLT5iYXNlLnBsYW5lID0gcGxhbmU7Cj4gLQkJc3RhdGUtPmJhc2Uucm90YXRpb24g
PSBEUk1fTU9ERV9ST1RBVEVfMDsKPiAtCQlwbGFuZS0+c3RhdGUgPSAmc3RhdGUtPmJhc2U7Cj4g
LQl9Cj4gKwlpZiAoc3RhdGUpCj4gKwkJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChw
bGFuZSwgJnN0YXRlLT5iYXNlKTsKPiAgfQo+ICAKPiAgc3RhdGljIHN0cnVjdAo+IC0tIAo+IDIu
MTguMAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBm
aXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwK
IFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
