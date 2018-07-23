From: Deepak Singh Rawat <drawat@vmware.com>
Subject: RE: [PATCH 10/10] drm/vmwgfx: Use __drm_atomic_helper_plane_reset
 instead of copying the logic
Date: Mon, 23 Jul 2018 17:16:31 +0000
Message-ID: <BYAPR05MB4181BDF5EF98126FDDCD3CB6BA560@BYAPR05MB4181.namprd05.prod.outlook.com>
References: <20180713161407.GQ20303@art_vandelay>
 <20180720211509.23605-1-alexandru-cosmin.gheorghe@arm.com>
 <20180720211509.23605-11-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180720211509.23605-11-alexandru-cosmin.gheorghe@arm.com>
Content-Language: en-US
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "airlied@linux.ie" <airlied@linux.ie>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Thomas Hellstrom <thellstrom@vmware.com>, "krzk@kernel.org" <krzk@kernel.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "wens@csie.org" <wens@csie.org>, "kgene@kernel.org" <kgene@kernel.org>, "malidp@foss.arm.com" <malidp@foss.arm.com>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>, "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "nd@arm.com" <nd@arm.com>, "Tony.Cheng@amd.com" <Tony.Cheng@amd.com>, linux-arm-kernel@lists.i
List-Id: linux-samsung-soc@vger.kernel.org

SGkgQWxleGFuZHJ1LA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaCwgZm9yIHRoZSB2bXdnZnggcGFy
dDoNCg0KUmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+DQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LQ0KPiBjb3Nt
aW4uZ2hlb3JnaGVAYXJtLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYyB8IDQgKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2ttcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMNCj4g
aW5kZXggNDY2MzM2YjM0ZmZmLi4xZTBmYjNjNzliNTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2ttcy5jDQo+IEBAIC03MjAsOSArNzIwLDcgQEAgdm9pZCB2bXdfZHVfcGxhbmVf
cmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpDQo+ICAJCXJldHVybjsNCj4gIAl9DQo+IA0K
PiAtCXBsYW5lLT5zdGF0ZSA9ICZ2cHMtPmJhc2U7DQo+IC0JcGxhbmUtPnN0YXRlLT5wbGFuZSA9
IHBsYW5lOw0KPiAtCXBsYW5lLT5zdGF0ZS0+cm90YXRpb24gPSBEUk1fTU9ERV9ST1RBVEVfMDsN
Cj4gKwlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KHBsYW5lLCAmdnBzLT5iYXNlKTsN
Cj4gIH0NCj4gDQo+IA0KPiAtLQ0KPiAyLjE4LjANCj4gDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
