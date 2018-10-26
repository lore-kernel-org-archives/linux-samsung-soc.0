From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/2] drm/exynos/fbdev: do not skip fbdev init if there are
 no connectors
Date: Fri, 26 Oct 2018 12:13:28 +0200
Message-ID: <20181026101328.26242-2-a.hajda@samsung.com>
References: <20181026101328.26242-1-a.hajda@samsung.com>
 <CGME20181026101343eucas1p21bb8caff42737b8907527f5d1617e2b0@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20181026101328.26242-1-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

U2luY2UgY29ubmVjdG9ycyBjYW4gYmUgY3JlYXRlZCBkeW5hbWljYWxseSwgZmJkZXYgc2hvdWxk
IGJlIGluaXRpYWxpemVkCmV2ZW4gaWYgdGhlcmUgYXJlIG5vIGNvbm5lY3RvcnMgYXQgdGhlIG1v
bWVudC4gT3RoZXJ3aXNlIGZiZGV2IHdpbGwKbm90IGJlIGNyZWF0ZWQgZXZlbiBhZnRlciBjb25u
ZWN0b3IncyBhcHBlYXJhbmNlLgpUaGUgcGF0Y2ggZml4ZXMgbGFjayBvZiBmYmRldiBvbiByaW5h
dG8gYW5kIHRyYXRzIGJvYXJkcy4KCkZpeGVzOiA2YWZiNzcyMWUyYTAgKCJkcm0vZXh5bm9zOiBt
b3ZlIGNvbm5lY3RvciBjcmVhdGlvbiB0byBhdHRhY2ggY2FsbGJhY2siKQpSZXBvcnRlZC1ieTog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmJkZXYuYwppbmRleCA5MThkZDJjODIyMDkuLjAxZDE4MjI4OWVmYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMKQEAgLTE5Miw3ICsxOTIsNyBAQCBpbnQg
ZXh5bm9zX2RybV9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmhlbHBlcjsKIAlpbnQgcmV0OwogCi0JaWYgKCFkZXYtPm1vZGVfY29uZmln
Lm51bV9jcnRjIHx8ICFkZXYtPm1vZGVfY29uZmlnLm51bV9jb25uZWN0b3IpCisJaWYgKCFkZXYt
Pm1vZGVfY29uZmlnLm51bV9jcnRjKQogCQlyZXR1cm4gMDsKIAogCWZiZGV2ID0ga3phbGxvYyhz
aXplb2YoKmZiZGV2KSwgR0ZQX0tFUk5FTCk7Ci0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
