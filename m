From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 08/25] drm/exynos: rotator: convert to common clock framework
Date: Tue, 10 Nov 2015 14:23:24 +0100
Message-ID: <1447161821-1877-9-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBkcml2ZXIgd2FzIG5vdCB1c2VkIGFmdGVyIGludHJvZHVjdGlvbiBvZiBjb21tb24gY2xv
Y2sgZnJhbWV3b3JrLgpUaGlzIHBhdGNoIGFkZHMgbWlzc2luZyBwcmVwYXJlL3VucHJlcGFyZSBj
YWxscyBhbmQgYWxsb3dzIHRvIHVzZSBpdAphZ2FpbiB3aXRoIGN1cnJlbnQga2VybmVsIGNvZGUu
CgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYwppbmRleCAyZjVjMTE4
ZjRjOGUuLmJlYTBmNzgyNmQzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX3JvdGF0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fcm90YXRvci5jCkBAIC03OTAsMTAgKzc5MCwxMCBAQCBzdGF0aWMgaW50IHJvdGF0b3JfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IHJvdGF0b3JfY2xr
X2NydGwoc3RydWN0IHJvdF9jb250ZXh0ICpyb3QsIGJvb2wgZW5hYmxlKQogewogCWlmIChlbmFi
bGUpIHsKLQkJY2xrX2VuYWJsZShyb3QtPmNsb2NrKTsKKwkJY2xrX3ByZXBhcmVfZW5hYmxlKHJv
dC0+Y2xvY2spOwogCQlyb3QtPnN1c3BlbmRlZCA9IGZhbHNlOwogCX0gZWxzZSB7Ci0JCWNsa19k
aXNhYmxlKHJvdC0+Y2xvY2spOworCQljbGtfZGlzYWJsZV91bnByZXBhcmUocm90LT5jbG9jayk7
CiAJCXJvdC0+c3VzcGVuZGVkID0gdHJ1ZTsKIAl9CiAKLS0gCjEuOS4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
