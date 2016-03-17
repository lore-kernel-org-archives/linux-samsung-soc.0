From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: fimd: fix broken dp_clock control
Date: Thu, 17 Mar 2016 07:53:12 +0100
Message-ID: <1458197592-5050-1-git-send-email-m.szyprowski@samsung.com>
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
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Chanho Park <chanho61.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Q29tbWl0IDFmZWFmZDNhZmQyOTRiMDNkYmJlZGI4ZThmOTRlMGM0ZGI1MjZmMTAgKCJkcm0vZXh5
bm9zOiBhZGQKZXh5bm9zNTQyMCBzdXBwb3J0IGZvciBmaW1kIikgYWRkIHN1cHBvcnQgZm9yIEV4
eW5vcyA1NDIwIFNvQywgYnV0IGl0CmJyb2tlIGVuYWJsaW5nIGRpc3BsYXkgY2xvY2sgZmVhdHVy
ZSBiZWNhdXNlIG9mIGluY29ycmVjdCBjb25kaXRpb24KY2hlY2suIFRoaXMgcGF0Y2ggZml4ZXMg
aXQsIHNvIGRpc3BsYXkgaXMgd29ya2luZyBhZ2FpbiBvbiBwbGF0Zm9ybXMKcmVxdWlyaW5nIGRp
c3BsYXkgY2xvY2sgY29udHJvbCAoaS5lLiBFeHlub3M1MjUwLWJhc2VkIFNOT1cgcGxhdGZvcm0p
LgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwppbmRleCAwYTQ0NTExLi5jNjVmZTc5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKQEAgLTg4OSw3ICs4ODks
NyBAQCBzdGF0aWMgdm9pZCBmaW1kX2RwX2Nsb2NrX2VuYWJsZShzdHJ1Y3QgZXh5bm9zX2RybV9j
cnRjICpjcnRjLCBib29sIGVuYWJsZSkKIAkgKiBjbG9jay4gT24gdGhlc2UgU29DcyB0aGUgYm9v
dGxvYWRlciBtYXkgZW5hYmxlIGl0IGJ1dCBhbnkKIAkgKiBwb3dlciBkb21haW4gb2ZmL29uIHdp
bGwgcmVzZXQgaXQgdG8gZGlzYWJsZSBzdGF0ZS4KIAkgKi8KLQlpZiAoY3R4LT5kcml2ZXJfZGF0
YSAhPSAmZXh5bm9zNV9maW1kX2RyaXZlcl9kYXRhIHx8CisJaWYgKGN0eC0+ZHJpdmVyX2RhdGEg
IT0gJmV4eW5vczVfZmltZF9kcml2ZXJfZGF0YSAmJgogCSAgICBjdHgtPmRyaXZlcl9kYXRhICE9
ICZleHlub3M1NDIwX2ZpbWRfZHJpdmVyX2RhdGEpCiAJCXJldHVybjsKIAotLSAKMS45LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
