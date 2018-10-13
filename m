From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/exynos: checking for NULL instead of IS_ERR()
Date: Sat, 13 Oct 2018 13:21:40 +0300
Message-ID: <20181013102140.GB16086@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIG9mX2RybV9maW5kX3BhbmVsKCkgZnVuY3Rpb24gcmV0dXJucyBlcnJvciBwb2ludGVycyBh
bmQgbmV2ZXIgTlVMTApidXQgd2UgdGhlIGRyaXZlciBhc3N1bWVzIHRoYXQgLT5wYW5lbCBpcyBO
VUxMIHdoZW4gaXQncyBub3QgcHJlc2VudC4KCkZpeGVzOiA2YWZiNzcyMWUyYTAgKCJkcm0vZXh5
bm9zOiBtb3ZlIGNvbm5lY3RvciBjcmVhdGlvbiB0byBhdHRhY2ggY2FsbGJhY2siKQpTaWduZWQt
b2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCmluZGV4IDA3YWY3NzU4MDY2ZC4uMzJmMjU2
NzQ5Nzg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNp
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCkBAIC0xNTI3
LDcgKzE1MjcsOSBAQCBzdGF0aWMgaW50IGV4eW5vc19kc2lfaG9zdF9hdHRhY2goc3RydWN0IG1p
cGlfZHNpX2hvc3QgKmhvc3QsCiAJCX0KIAogCQlkc2ktPnBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFu
ZWwoZGV2aWNlLT5kZXYub2Zfbm9kZSk7Ci0JCWlmIChkc2ktPnBhbmVsKSB7CisJCWlmIChJU19F
UlIoZHNpLT5wYW5lbCkpIHsKKwkJCWRzaS0+cGFuZWwgPSBOVUxMOworCQl9IGVsc2UgewogCQkJ
ZHJtX3BhbmVsX2F0dGFjaChkc2ktPnBhbmVsLCAmZHNpLT5jb25uZWN0b3IpOwogCQkJZHNpLT5j
b25uZWN0b3Iuc3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiAJCX0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
