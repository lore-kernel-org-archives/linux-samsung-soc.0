From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] drm/exynos: gem: Switch to
 drm_gem_object_put_unlocked() helper
Date: Thu, 07 Jun 2018 15:36:09 +0200
Message-ID: <20180607133609.28397-5-m.szyprowski@samsung.com>
References: <20180607133609.28397-1-m.szyprowski@samsung.com>
 <CGME20180607133617eucas1p11a0b97f50b125b2167b05e5f7a60fc8f@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180607133609.28397-1-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

ZHJtX2dlbV9vYmplY3RfdW5yZWZlcmVuY2UoKSBmdW5jdGlvbiBpcyBqdXN0IGEgY29tcGF0aWJp
bGl0eSBhbGlhcyBmb3IKZHJtX2dlbV9vYmplY3RfcHV0KCkgYW5kIHNob3VsZCBub3QgYmUgdXNl
ZCBieSB0aGUgbmV3IGNvZGUsIHNvIGNvbnZlcnQKYWxsIHVzZXJzIG9mIGNvbXBhdGliaWxpdHkg
ZnVuY3Rpb25zIHRvIHVzZSB0aGUgbmV3IEFQSS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXBy
b3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dl
bS5jCmluZGV4IDBiOGM2ZjhmYzQ4YS4uMzRhY2U4NWZlYjY4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2dlbS5jCkBAIC0xNDMsNyArMTQzLDcgQEAgc3RhdGljIGludCBleHlu
b3NfZHJtX2dlbV9oYW5kbGVfY3JlYXRlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAogCURS
TV9ERUJVR19LTVMoImdlbSBoYW5kbGUgPSAweCV4XG4iLCAqaGFuZGxlKTsKIAogCS8qIGRyb3Ag
cmVmZXJlbmNlIGZyb20gYWxsb2NhdGUgLSBoYW5kbGUgaG9sZHMgaXQgbm93LiAqLwotCWRybV9n
ZW1fb2JqZWN0X3VucmVmZXJlbmNlX3VubG9ja2VkKG9iaik7CisJZHJtX2dlbV9vYmplY3RfcHV0
X3VubG9ja2VkKG9iaik7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTMzNSw3ICszMzUsNyBAQCBpbnQg
ZXh5bm9zX2RybV9nZW1fZ2V0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsCiAJYXJncy0+ZmxhZ3MgPSBleHlub3NfZ2VtLT5mbGFnczsKIAlhcmdzLT5zaXplID0gZXh5
bm9zX2dlbS0+c2l6ZTsKIAotCWRybV9nZW1fb2JqZWN0X3VucmVmZXJlbmNlX3VubG9ja2VkKG9i
aik7CisJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7CiAKIAlyZXR1cm4gMDsKIH0K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
