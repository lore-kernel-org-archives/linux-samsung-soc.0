From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 03/13] drm/exynos: Store correct CRTC index in events
Date: Tue, 16 Dec 2014 17:53:25 +0100
Message-ID: <1418748815-15434-3-git-send-email-thierry.reding@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Mark Yao <mark.yao@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkEgbmVnYXRpdmUgcGlw
ZSBjYXVzZXMgYSBzcGVjaWFsIGNhc2UgdG8gYmUgdHJpZ2dlcmVkIGZvciBkcml2ZXJzIHRoYXQK
ZG9uJ3QgaGF2ZSBwcm9wZXIgVkJMQU5LIHN1cHBvcnQuIEV4eW5vcyBkb2VzIHN1cHBvcnQgVkJM
QU5Lcywgc28gdGhlcmUKaXMgbm8gbmVlZCBmb3IgdGhlIGZhbGxiYWNrIGNvZGUuCgpDYzogSW5r
aSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5z
aGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNv
bT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+ClNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fY3J0Yy5jCmluZGV4IDc2MTViYjFiNzZkZS4uZjIwZmE1Mzc5NDVjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKQEAgLTUzNyw3ICs1MzcsNyBAQCB2b2lk
IGV4eW5vc19kcm1fY3J0Y19maW5pc2hfcGFnZWZsaXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
aW50IHBpcGUpCiAJCQljb250aW51ZTsKIAogCQlsaXN0X2RlbCgmZS0+YmFzZS5saW5rKTsKLQkJ
ZHJtX3NlbmRfdmJsYW5rX2V2ZW50KGRldiwgLTEsIGUpOworCQlkcm1fc2VuZF92YmxhbmtfZXZl
bnQoZGV2LCBwaXBlLCBlKTsKIAkJZHJtX3ZibGFua19wdXQoZGV2LCBwaXBlKTsKIAkJYXRvbWlj
X3NldCgmZXh5bm9zX2NydGMtPnBlbmRpbmdfZmxpcCwgMCk7CiAJCXdha2VfdXAoJmV4eW5vc19j
cnRjLT5wZW5kaW5nX2ZsaXBfcXVldWUpOwotLSAKMi4xLjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
