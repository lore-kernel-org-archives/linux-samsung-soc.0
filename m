From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm: exynos: include linux/irq.h
Date: Tue,  5 Sep 2017 10:19:55 +0200
Message-ID: <20170905082022.1239056-1-arnd@arndb.de>
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
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-samsung-soc@vger.kernel.org

SSByYW4gaW50byBhIGJ1aWxkIGVycm9yIG9uIHg4NjoKCmRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zNTQzM19kcm1fZGVjb24uYzogSW4gZnVuY3Rpb24gJ2RlY29uX2NvbmZfaXJxJzoKZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jOjcwNjoyOiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2lycV9zZXRfc3RhdHVzX2ZsYWdzJzsg
ZGlkIHlvdSBtZWFuICdkcXVvdF9zdGF0ZV9mbGFnJz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCiAgaXJxX3NldF9zdGF0dXNfZmxhZ3MoaXJxLCBJUlFfTk9BVVRPRU4p
OwoKQWRkaW5nIHRoZSBtaXNzaW5nIGluY2x1ZGUgZml4ZXMgdGhlIGVycm9yLgoKRml4ZXM6IGIz
N2Q1M2EwMzgyYyAoImRybS9leHlub3MvZGVjb241NDMzOiBtb3ZlIFRFIGhhbmRsaW5nIHRvIERF
Q09OIikKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zNTQzM19kcm1fZGVjb24uYwppbmRleCA3MzBiOGQ5ZGIxODcuLjZiZTViNTNjM2IyNyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYwpAQCAtMTQs
NiArMTQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbXBv
bmVudC5oPgogI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgorI2luY2x1ZGUgPGxpbnV4L2lycS5o
PgogI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Ci0tIAoyLjkuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
