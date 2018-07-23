From: Sinclair Yeh <syeh@vmware.com>
Subject: Re: [PATCH 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 23 Jul 2018 11:02:07 -0700
Message-ID: <20180723180206.GA4877@promb-2n-dhcp82.eng.vmware.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-11-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180720211509.23605-11-alexandru-cosmin.gheorghe@arm.com>
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

SGVsbG8gQWxleCwKCm90aGVyIHRoYW4gYWRkaW5nIGEgYnJpZWYgY29tbWl0IG1lc3NhZ2UgdG8g
dGhpcyBwYXRjaCwKClJldmlld2VkLWJ5OiBTaW5jbGFpciBZZWggPHN5ZWhAdm13YXJlLmNvbT4K
Ck9uIEZyaSwgSnVsIDIwLCAyMDE4IGF0IDEwOjE1OjA5UE0gKzAxMDAsIEFsZXhhbmRydSBHaGVv
cmdoZSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgR2hlb3JnaGUgPGFsZXhhbmRy
dS1jb3NtaW4uZ2hlb3JnaGVAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfa21zLmMgfCA0ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCj4gaW5k
ZXggNDY2MzM2YjM0ZmZmLi4xZTBmYjNjNzliNTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYwo+IEBAIC03MjAsOSArNzIwLDcgQEAgdm9pZCB2bXdfZHVfcGxhbmVfcmVzZXQo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAkJcmV0dXJuOwo+ICAJfQo+ICAKPiAtCXBsYW5l
LT5zdGF0ZSA9ICZ2cHMtPmJhc2U7Cj4gLQlwbGFuZS0+c3RhdGUtPnBsYW5lID0gcGxhbmU7Cj4g
LQlwbGFuZS0+c3RhdGUtPnJvdGF0aW9uID0gRFJNX01PREVfUk9UQVRFXzA7Cj4gKwlfX2RybV9h
dG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmdnBzLT5iYXNlKTsKPiAgfQo+ICAKPiAg
Cj4gLS0gCj4gMi4xOC4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
