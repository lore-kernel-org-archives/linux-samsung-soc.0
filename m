From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] drm/exynos: use logical AND in exynos_drm_plane_check_size()
Date: Wed, 25 May 2016 14:30:07 +0200
Message-ID: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGN1cnJlbnQgYml0d2lzZSBBTkQgc2hvdWxkIHJlc3VsdCBpbiB0aGUgc2FtZSBhc3NlbWJs
ZXIKYnV0IHRoaXMgaXMgd2hhdCB0aGUgY29kZSBpcyBhY3R1YWxseSBzdXBwb3NlZCB0byBkby4K
ClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51bmktYmllbGVmZWxk
LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYwppbmRleCBiM2YzYzJjLi5lNGExYTYz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYwpAQCAtMjI2LDcg
KzIyNiw3IEBAIGV4eW5vc19kcm1fcGxhbmVfY2hlY2tfc2l6ZShjb25zdCBzdHJ1Y3QgZXh5bm9z
X2RybV9wbGFuZV9jb25maWcgKmNvbmZpZywKIAkgICAgc3RhdGUtPnZfcmF0aW8gPT0gKDEgPDwg
MTUpKQogCQloZWlnaHRfb2sgPSB0cnVlOwogCi0JaWYgKHdpZHRoX29rICYgaGVpZ2h0X29rKQor
CWlmICh3aWR0aF9vayAmJiBoZWlnaHRfb2spCiAJCXJldHVybiAwOwogCiAJRFJNX0RFQlVHX0tN
Uygic2NhbGluZyBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQiKTsKLS0gCjIuNy4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
