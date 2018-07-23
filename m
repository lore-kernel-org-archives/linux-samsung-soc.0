From: Ayan Halder <ayan.halder@arm.com>
Subject: Re: [PATCH 03/10] drm: mali-dp: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 23 Jul 2018 10:35:51 +0100
Message-ID: <20180723093335.GA26447@arm.com>
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, thellstrom@vmware.com, krzk@kernel.org, maxime.ripard@bootlin.com, wens@csie.org, kgene@kernel.org, malidp@foss.arm.com, linux-graphics-maintainer@vmware.com, sunpeng.li@amd.com, boris.brezillon@bootlin.com, linux-samsung-soc@vger.kernel.org, nd@arm.com, Tony.Cheng@amd.com, linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com, nicolas.ferre@microchip.com, shirish.s@amd.com, kyungmin.park@samsung.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTA6MTU6MDJQTSArMDEwMCwgQWxleGFuZHJ1IEdoZW9y
Z2hlIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1
LWNvc21pbi5naGVvcmdoZUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21h
bGlkcF9wbGFuZXMuYyB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9wbGFuZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCj4g
aW5kZXggMjk0MDlhNjVkODY0Li40OWMzN2Y2ZGQ2M2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21h
bGlkcF9wbGFuZXMuYwo+IEBAIC03OCwxMSArNzgsOCBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfcGxh
bmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAlrZnJlZShzdGF0ZSk7Cj4gIAlw
bGFuZS0+c3RhdGUgPSBOVUxMOwo+ICAJc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBH
RlBfS0VSTkVMKTsKPiAtCWlmIChzdGF0ZSkgewo+IC0JCXN0YXRlLT5iYXNlLnBsYW5lID0gcGxh
bmU7Cj4gLQkJc3RhdGUtPmJhc2Uucm90YXRpb24gPSBEUk1fTU9ERV9ST1RBVEVfMDsKPiAtCQlw
bGFuZS0+c3RhdGUgPSAmc3RhdGUtPmJhc2U7Cj4gLQl9Cj4gKwlpZiAoc3RhdGUpCj4gKwkJX19k
cm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5iYXNlKTsKPiAgfQo+
ICAKPiAgc3RhdGljIHN0cnVjdAo+IC0tIAo+IDIuMTguMAo+CkEgY29tbWl0IGRlc2NyaXB0aW9u
IGxpa2UgdGhlIGZvbGxvd2luZyBtaWdodCBiZSB1c2VmdWwgKHRob3VnaCB0aGUKcGF0Y2ggaXMg
YSBwYXJ0IG9mIHNlcmllcykgOi0KSW52b2tlIGEgbmV3bHkgYWRkZWQgZHJtIGF0b21pYyBoZWxw
ZXIgZnVuY3Rpb24KKF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQpIHRvIHJlc2V0IHRo
ZSAnZHJtX3BsYW5lX3N0YXRlJyB0bwppdHMgZGVmYXVsdCB2YWx1ZXMgZm9yIHJvdGF0aW9uLCBh
bHBoYSBhbmQgcGxhbmUuCgpPdGhlcndpc2UsIHdpdGggbXkgbGltaXRlZCBrbm93bGVkZ2Ugb24g
RFJNLCB0aGlzIGxvb2tzIE9LIHRvIG1lOi0KUmV2aWV3ZWQtYnkgOi0gQXlhbiBLdW1hciBoYWxk
ZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
