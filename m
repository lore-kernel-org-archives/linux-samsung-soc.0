From: Eric Engestrom <eric.engestrom@imgtec.com>
Subject: Re: [PATCH] drm/exynos: use logical AND in
 exynos_drm_plane_check_size()
Date: Fri, 10 Jun 2016 11:54:50 +0100
Message-ID: <20160610105450.GJ9217@imgtec.com>
References: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkLCBNYXkgMjUsIDIwMTYgYXQgMDI6MzA6MDdQTSArMDIwMCwgVG9iaWFzIEpha29iaSB3
cm90ZToKPiBUaGUgY3VycmVudCBiaXR3aXNlIEFORCBzaG91bGQgcmVzdWx0IGluIHRoZSBzYW1l
IGFzc2VtYmxlcgo+IGJ1dCB0aGlzIGlzIHdoYXQgdGhlIGNvZGUgaXMgYWN0dWFsbHkgc3VwcG9z
ZWQgdG8gZG8uCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRo
LnVuaS1iaWVsZWZlbGQuZGU+CgpSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20gPGVyaWMuZW5n
ZXN0cm9tQGltZ3RlYy5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fcGxhbmUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5l
LmMKPiBpbmRleCBiM2YzYzJjLi5lNGExYTYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX3BsYW5lLmMKPiBAQCAtMjI2LDcgKzIyNiw3IEBAIGV4eW5vc19kcm1fcGxh
bmVfY2hlY2tfc2l6ZShjb25zdCBzdHJ1Y3QgZXh5bm9zX2RybV9wbGFuZV9jb25maWcgKmNvbmZp
ZywKPiAgCSAgICBzdGF0ZS0+dl9yYXRpbyA9PSAoMSA8PCAxNSkpCj4gIAkJaGVpZ2h0X29rID0g
dHJ1ZTsKPiAgCj4gLQlpZiAod2lkdGhfb2sgJiBoZWlnaHRfb2spCj4gKwlpZiAod2lkdGhfb2sg
JiYgaGVpZ2h0X29rKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCURSTV9ERUJVR19LTVMoInNjYWxp
bmcgbW9kZSBpcyBub3Qgc3VwcG9ydGVkIik7Cj4gLS0gCj4gMi43LjMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
