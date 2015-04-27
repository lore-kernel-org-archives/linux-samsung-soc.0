From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 4/4] drm/exynos: mixer: also allow NV21 for the video
 processor
Date: Mon, 27 Apr 2015 23:10:16 +0200
Message-ID: <1430169016-4966-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1430169016-4966-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1430169016-4966-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

QWxsIHRoZSBuZWNlc3NhcnkgY29kZSBpcyBhbHJlYWR5IHRoZXJlLCBqdXN0IG5lZWQgdG8KaGFu
ZGxlIHRoZSBmb3JtYXQgaW4gdGhlIHN3aXRjaCBzdGF0ZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBU
b2JpYXMgSmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19taXhlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwppbmRleCA5
NzBiMjkzLi4xYmNiY2ZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19taXhlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKQEAg
LTM5OSw2ICszOTksOSBAQCBzdGF0aWMgdm9pZCB2cF92aWRlb19idWZmZXIoc3RydWN0IG1peGVy
X2NvbnRleHQgKmN0eCwgaW50IHdpbikKIAljYXNlIERSTV9GT1JNQVRfTlYxMjoKIAkJY3JjYl9t
b2RlID0gZmFsc2U7CiAJCWJyZWFrOworCWNhc2UgRFJNX0ZPUk1BVF9OVjIxOgorCQljcmNiX21v
ZGUgPSB0cnVlOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlEUk1fRVJST1IoInBpeGVsIGZvcm1h
dCBmb3IgdnAgaXMgd3JvbmcgWyVkXS5cbiIsCiAJCQkJcGxhbmUtPnBpeGVsX2Zvcm1hdCk7Ci0t
IAoyLjAuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
