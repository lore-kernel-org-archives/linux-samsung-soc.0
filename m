From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3] drm/exynos/dsi: Remove error handling for bridge_node DT
 parsing
Date: Wed, 21 Jun 2017 15:33:32 +0900
Message-ID: <1498026812-18539-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170621063347epcas1p46d2ccf5edbedc5386222c0fce3b2523a@epcas1p4.samsung.com>
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
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, tjakobi@math.uni-bielefeld.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

UmVtb3ZlIHRoZSBlcnJvciBoYW5kbGluZyBvZiBicmlkZ2Vfbm9kZSBiZWNhdXNlIHRoZSBicmlk
Z2Vfbm9kZSBpcwpvcHRpb25hbGx5LgoKRm9yIGV4YW1wbGUsIEluIGNhc2Ugb2YgRXh5bm9zIFNv
QywgYSBicmlkZ2UgZGV2aWNlIHN1Y2ggYXMgbUROSWUgYW5kCk1JQyBjb3VsZCBiZSBwbGFjZWQg
YmV0d2VlbiBEaXNwbGF5IENvbnRyb2xsZXIgYW5kIE1JUEkgRFNJIGRldmljZSBidXQKdGhlIGJy
aWRnZSBkZXZpY2UgaXMgb3B0aW9uYWxseS4KClNpZ25lZC1vZmYtYnk6IEhvZWdldW4gS3dvbiA8
aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgotLS0KCkhpIGFsbCwKCkNoYW5nZXMgZm9yIFYzOgot
IFJlbW92ZWQgdGhlIHdvcmQoJ3JlcXVpcmVkJykgZnJvbSBjb21taXQgbWVzc2FnZS4KCkNoYW5n
ZXMgZm9yIFYyOgotIE1vZGlmaWVkIHRoZSBjb21taXQgbWVzc2FnZSBpbiBtb3JlIGRldGFpbCB0
aGFuIGJlZm9yZS4KCkJlc3QgcmVnYXJkcywKSG9lZ2V1bgoKIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kc2kuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwppbmRleCBhMTFiNzk1Li42
ZWUwZGFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNp
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCkBAIC0xNjUx
LDggKzE2NTEsNiBAQCBzdGF0aWMgaW50IGV4eW5vc19kc2lfcGFyc2VfZHQoc3RydWN0IGV4eW5v
c19kc2kgKmRzaSkKIAkJcmV0dXJuIHJldDsKIAogCWRzaS0+YnJpZGdlX25vZGUgPSBvZl9ncmFw
aF9nZXRfcmVtb3RlX25vZGUobm9kZSwgRFNJX1BPUlRfSU4sIDApOwotCWlmICghZHNpLT5icmlk
Z2Vfbm9kZSkKLQkJcmV0dXJuIC1FSU5WQUw7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjEuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
