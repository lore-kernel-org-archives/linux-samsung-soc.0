From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 5/5] drm/exynos: mixer: also allow ARGB1555 and ARGB4444
Date: Wed,  6 May 2015 15:36:50 +0200
Message-ID: <1430919410-9917-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

QWxsb3cgdGhlIHJlbWFpbmluZyBhbHBoYSBmb3JtYXRzIG5vdyB0aGF0IGJsZW5kaW5nCmlzIHBy
b3Blcmx5IHNldHVwLgoKU2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRo
LnVuaS1iaWVsZWZlbGQuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4
ZXIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfbWl4ZXIuYwppbmRleCA0MzBkMTBjLi41NGU3OWUwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKQEAgLTcyMSwxMCArNzIxLDEyIEBAIHN0YXRpYyB2
b2lkIG1peGVyX2dyYXBoX2J1ZmZlcihzdHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4LCB1bnNpZ25l
ZCBpbnQgd2luKQogCiAJc3dpdGNoIChwbGFuZS0+cGl4ZWxfZm9ybWF0KSB7CiAJY2FzZSBEUk1f
Rk9STUFUX1hSR0I0NDQ0OgorCWNhc2UgRFJNX0ZPUk1BVF9BUkdCNDQ0NDoKIAkJZm10ID0gTVhS
X0ZPUk1BVF9BUkdCNDQ0NDsKIAkJYnJlYWs7CiAKIAljYXNlIERSTV9GT1JNQVRfWFJHQjE1NTU6
CisJY2FzZSBEUk1fRk9STUFUX0FSR0IxNTU1OgogCQlmbXQgPSBNWFJfRk9STUFUX0FSR0IxNTU1
OwogCQlicmVhazsKIAotLSAKMi4wLjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
