From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/13] drm/sti: Store correct CRTC index in events
Date: Tue, 16 Dec 2014 17:53:29 +0100
Message-ID: <1418748815-15434-7-git-send-email-thierry.reding@gmail.com>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Mark Yao <mark.yao@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkEgbmVnYXRpdmUgcGlw
ZSBjYXVzZXMgYSBzcGVjaWFsIGNhc2UgdG8gYmUgdHJpZ2dlcmVkIGZvciBkcml2ZXJzIHRoYXQK
ZG9uJ3QgaGF2ZSBwcm9wZXIgVkJMQU5LIHN1cHBvcnQuIFNUaSBkb2VzIHN1cHBvcnQgVkJMQU5L
cywgc28gdGhlcmUgaXMKbm8gbmVlZCBmb3IgdGhlIGZhbGxiYWNrIGNvZGUuCgpDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3N0aS9zdGlfZHJtX2NydGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Ry
bV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcm1fY3J0Yy5jCmluZGV4IGU2ZjZl
ZjdjNDg2Ni4uMTNiZmU3YmNiMTY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9kcm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2RybV9jcnRjLmMKQEAg
LTMzMiw3ICszMzIsNyBAQCBpbnQgc3RpX2RybV9jcnRjX3ZibGFua19jYihzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgKm5iLAogCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmRybV9kZXYtPmV2ZW50X2xvY2ss
IGZsYWdzKTsKIAlpZiAoY29tcG8tPm1peGVyWypjcnRjXS0+cGVuZGluZ19ldmVudCkgewotCQlk
cm1fc2VuZF92YmxhbmtfZXZlbnQoZHJtX2RldiwgLTEsCisJCWRybV9zZW5kX3ZibGFua19ldmVu
dChkcm1fZGV2LCAqY3J0YywKIAkJCQljb21wby0+bWl4ZXJbKmNydGNdLT5wZW5kaW5nX2V2ZW50
KTsKIAkJZHJtX3ZibGFua19wdXQoZHJtX2RldiwgKmNydGMpOwogCQljb21wby0+bWl4ZXJbKmNy
dGNdLT5wZW5kaW5nX2V2ZW50ID0gTlVMTDsKLS0gCjIuMS4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
