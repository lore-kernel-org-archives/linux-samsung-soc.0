From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] drm/exynos: fimd: don't set .has_hw_trigger in s3c6400 driver
 data
Date: Mon, 30 May 2016 20:20:22 -0400
Message-ID: <1464654022-344-1-git-send-email-javier@osg.samsung.com>
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
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGZpZWxkIHZhbHVlIGlzIG9ubHkgY2hlY2tlZCBpbiBmaW1kX3NldHVwX3RyaWdnZXIoKSBp
ZiAudHJnX3R5cGUgaXMKSTgwX0hXX1RSRyBzbyB0aGVyZSdzIG5vIHBvaW50IGluIHNldHRpbmcg
dGhpcyBmaWVsZCBmb3IgdGhlIHMzYzY0MDAgaWYKaXMgbmV2ZXIgZ29pbmcgdG8gYmUgdXNlZCBz
aW5jZSAudHJnX3R5cGUgaXMgbm90IHNldC4KClNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KLS0tCgogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmlt
ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwppbmRleCAzZWZl
MWFhODk0MTYuLjFjMjNhOGZmNWU4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2ZpbWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmltZC5jCkBAIC0xMjAsNyArMTIwLDYgQEAgc3RhdGljIHN0cnVjdCBmaW1kX2RyaXZlcl9k
YXRhIHMzYzY0eHhfZmltZF9kcml2ZXJfZGF0YSA9IHsKIAkudGltaW5nX2Jhc2UgPSAweDAsCiAJ
Lmhhc19jbGtzZWwgPSAxLAogCS5oYXNfbGltaXRlZF9mbXQgPSAxLAotCS5oYXNfaHdfdHJpZ2dl
ciA9IDEsCiB9OwogCiBzdGF0aWMgc3RydWN0IGZpbWRfZHJpdmVyX2RhdGEgZXh5bm9zM19maW1k
X2RyaXZlcl9kYXRhID0gewotLSAKMi41LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
