From: hariprasad@freedesktop.org, Kelam@freedesktop.org,
	hariprasad.kelam@gmail.com
Subject: [PATCH] gpu: drm: exynos: Remove set but unused value
Date: Wed, 21 Aug 2019 23:04:56 +0530
Message-ID: <1566408896-8212-1-git-send-email-hariprasad.kelam@gmail.com>
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+CgpmaXgg
YmVsb3cgZGVmZWN0IHJlcG9ydGVkIGJ5IGNvdmVyaXR5CkluIGV4eW5vc19kc2lfcmVhZF9mcm9t
X2ZpZm86IEEgdmFsdWUgYXNzaWduZWQgdG8gYSB2YXJpYWJsZSBpcyBuZXZlcgp1c2VkLgpmaXgg
RGVmZWN0OjE0NTE4MjYKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNh
ZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2RzaS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNjky
NmNlZS4uNTMxMDg3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwpA
QCAtMTA1MSwxMiArMTA1MSwxMSBAQCBzdGF0aWMgdm9pZCBleHlub3NfZHNpX3JlYWRfZnJvbV9m
aWZvKHN0cnVjdCBleHlub3NfZHNpICpkc2ksCiAJCX0KIAogCQlsZW5ndGggPSAocmVnID4+IDgp
ICYgMHhmZmZmOwotCQlpZiAobGVuZ3RoID4geGZlci0+cnhfbGVuKSB7CisJCWlmIChsZW5ndGgg
PiB4ZmVyLT5yeF9sZW4pCiAJCQlkZXZfZXJyKGRldiwKIAkJCQkicmVzcG9uc2UgdG9vIGxvbmcg
KCV1ID4gJXUgYnl0ZXMpLCBzdHJpcHBpbmdcbiIsCiAJCQkJeGZlci0+cnhfbGVuLCBsZW5ndGgp
OwotCQkJbGVuZ3RoID0geGZlci0+cnhfbGVuOwotCQl9IGVsc2UgaWYgKGxlbmd0aCA8IHhmZXIt
PnJ4X2xlbikKKwkJZWxzZSBpZiAobGVuZ3RoIDwgeGZlci0+cnhfbGVuKQogCQkJeGZlci0+cnhf
bGVuID0gbGVuZ3RoOwogCX0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
