From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [media] exynos_hdmi: improve MEDIA_CEC_NOTIFIER dependency
Date: Wed, 19 Apr 2017 19:00:19 +0200
Message-ID: <20170419170030.2869578-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

V2hlbiB0aGUgbWVkaWEgc3Vic3lzdGVtIGlzIGJ1aWx0IGFzIGEgbG9hZGFibGUgbW9kdWxlLCBh
IGJ1aWx0LWluCkRSTSBkcml2ZXIgY2Fubm90IHVzZSB0aGUgY2VjIG5vdGlmaWVyczoKCmRyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkubzogSW4gZnVuY3Rpb24gYGhkbWlfZ2V0X21v
ZGVzJzoKZXh5bm9zX2hkbWkuYzooLnRleHQuaGRtaV9nZXRfbW9kZXMrMHg4MCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYGNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRyX2Zyb21fZWRpZCcKZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5vOiBJbiBmdW5jdGlvbiBgaGRtaV9yZW1v
dmUnOgpleHlub3NfaGRtaS5jOigudGV4dC5oZG1pX3JlbW92ZSsweDI0KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgY2VjX25vdGlmaWVyX3NldF9waHlzX2FkZHInCmV4eW5vc19oZG1pLmM6KC50
ZXh0LmhkbWlfcmVtb3ZlKzB4MzgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZWNfbm90aWZp
ZXJfcHV0JwoKVGhpcyBhZGRzIGEgS2NvbmZpZyBkZXBlbmRlbmN5IHRvIGVuZm9yY2UgdGhlIEhE
TUkgZHJpdmVyIHRvIGFsc28KYmUgYSBsb2FkYWJsZSBtb2R1bGUgaW4gdGhpcyBjYXNlLgoKRml4
ZXM6IDI3OGM4MTFjNWQwNSAoIlttZWRpYV0gZXh5bm9zX2hkbWk6IGFkZCBDRUMgbm90aWZpZXIg
c3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25m
aWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKaW5kZXggMWQxODUzNDdjNjRjLi42
NWJhMjkyZjhlNDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKQEAgLTEsNiArMSw3IEBACiBjb25m
aWcgRFJNX0VYWU5PUwogCXRyaXN0YXRlICJEUk0gU3VwcG9ydCBmb3IgU2Ftc3VuZyBTb0MgRVhZ
Tk9TIFNlcmllcyIKIAlkZXBlbmRzIG9uIE9GICYmIERSTSAmJiAoQVJDSF9TM0M2NFhYIHx8IEFS
Q0hfRVhZTk9TIHx8IEFSQ0hfTVVMVElQTEFURk9STSkKKwlkZXBlbmRzIG9uIChNRURJQV9TVVBQ
T1JUICYmIE1FRElBX0NFQ19OT1RJRklFUikgfHwgIU1FRElBX0NFQ19OT1RJRklFUgogCXNlbGVj
dCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBWSURFT01PREVfSEVMUEVSUwogCWhlbHAKLS0gCjIu
OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
