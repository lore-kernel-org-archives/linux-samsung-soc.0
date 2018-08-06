From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 01/10] drm/atomic: Add __drm_atomic_helper_plane_reset
Date: Mon, 06 Aug 2018 08:29:16 +0200
Message-ID: <1533536956.4204.4.camel@pengutronix.de>
References: <20180804161530.12275-1-alexandru-cosmin.gheorghe@arm.com>
 <20180804161530.12275-2-alexandru-cosmin.gheorghe@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180804161530.12275-2-alexandru-cosmin.gheorghe@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>, seanpaul@chromium.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, ville.syrjala@linux.intel.com, daniel@ffwll.ch, gustavo@padovan.org, maarten.lankhorst@linux.intel.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, harry.wentland@amd.com, andrey.grodzovsky@amd.com, Tony.Cheng@amd.com, sunpeng.li@amd.com, shirish.s@amd.com, boris.brezillon@bootlin.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, maxime.ripard@bootlin.com, wens@csie.org, eric@anholt.net
Cc: nd@arm.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gU2F0LCAyMDE4LTA4LTA0IGF0IDE3OjE1ICswMTAwLCBBbGV4YW5kcnUgR2hlb3JnaGUgd3Jv
dGU6Cj4gVGhlcmUgYXJlIGEgbG90IG9mIGRyaXZlcnMgdGhhdCBzdWJjbGFzcyBkcm1fcGxhbmVf
c3RhdGUsIGFsbCBvZiB0aGVtCj4gZHVwbGljYXRlIHRoZSBjb2RlIHRoYXQgbGlua3MgdG9nZXRo
ZXIgdGhlIHBsYW5lIHdpdGggcGxhbmVfc3RhdGUuCj4gCj4gT24gdG9wIG9mIHRoYXQsIGRyaXZl
cnMgdGhhdCBlbmFibGUgY29yZSBwcm9wZXJ0aWVzIGFsc28gaGF2ZSB0bwo+IGR1cGxpY2F0ZSB0
aGUgY29kZSBmb3IgaW5pdGlhbGl6aW5nIHRoZSBwcm9wZXJ0aWVzIHRvIHRoZWlyIGRlZmF1bHQK
PiB2YWx1ZXMsIHdoaWNoIGluIGFsbCBjYXNlcyBhcmUgdGhlIHNhbWUgYXMgdGhlIGRlZmF1bHRz
IGZyb20gY29yZS4KPiAKPiBDaGFuZ2Ugc2luY2UgdjE6Cj4gLSBNYWtlIGl0IGNvbnNpc3RlbnQg
d2l0aCB0aGUgb3RoZXIgaGVscGVycyBhbmQgcmVxdWlyZSB0aGF0IGJvdGgKPiAgIHBsYW5lIGFu
ZCBzdGF0ZSBub3QgYmUgTlVMTCwgc3VnZ2VzdGVkIGJ5IEJvcmlzIEJyZXppbGxvbiBhbmQKPiAg
IFBoaWxpcHAgWmFiZWwuCj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUg
R2hlb3JnaGUgPGFsZXhhbmRydS1jb3NtaW4uZ2hlb3JnaGVAYXJtLmNvbT4KClJldmlld2VkLWJ5
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBw
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
