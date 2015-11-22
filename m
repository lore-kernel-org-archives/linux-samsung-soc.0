From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 5/5] drm/exynos: mixer: also allow ARGB1555 and ARGB4444
Date: Sun, 22 Nov 2015 17:09:44 +0100
Message-ID: <1448208584-6621-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
Cc: dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

QWxsb3cgdGhlIHJlbWFpbmluZyBhbHBoYSBmb3JtYXRzIG5vdyB0aGF0IGJsZW5kaW5nCmlzIHBy
b3Blcmx5IHNldHVwLgoKU2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRo
LnVuaS1iaWVsZWZlbGQuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4
ZXIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19taXhlci5jCmluZGV4IDFjMjRmYjUuLjI0NWJlN2IgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwpAQCAtODAsNyArODAsOSBAQCBlbnVtIG1peGVy
X2ZsYWdfYml0cyB7CiAKIHN0YXRpYyBjb25zdCB1aW50MzJfdCBtaXhlcl9mb3JtYXRzW10gPSB7
CiAJRFJNX0ZPUk1BVF9YUkdCNDQ0NCwKKwlEUk1fRk9STUFUX0FSR0I0NDQ0LAogCURSTV9GT1JN
QVRfWFJHQjE1NTUsCisJRFJNX0ZPUk1BVF9BUkdCMTU1NSwKIAlEUk1fRk9STUFUX1JHQjU2NSwK
IAlEUk1fRk9STUFUX1hSR0I4ODg4LAogCURSTV9GT1JNQVRfQVJHQjg4ODgsCkBAIC03MjgsMTAg
KzczMCwxMiBAQCBzdGF0aWMgdm9pZCBtaXhlcl9ncmFwaF9idWZmZXIoc3RydWN0IG1peGVyX2Nv
bnRleHQgKmN0eCwKIAogCXN3aXRjaCAoZmItPnBpeGVsX2Zvcm1hdCkgewogCWNhc2UgRFJNX0ZP
Uk1BVF9YUkdCNDQ0NDoKKwljYXNlIERSTV9GT1JNQVRfQVJHQjQ0NDQ6CiAJCWZtdCA9IE1YUl9G
T1JNQVRfQVJHQjQ0NDQ7CiAJCWJyZWFrOwogCiAJY2FzZSBEUk1fRk9STUFUX1hSR0IxNTU1Ogor
CWNhc2UgRFJNX0ZPUk1BVF9BUkdCMTU1NToKIAkJZm10ID0gTVhSX0ZPUk1BVF9BUkdCMTU1NTsK
IAkJYnJlYWs7CiAKLS0gCjIuNC45CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
