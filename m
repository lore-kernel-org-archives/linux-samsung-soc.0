From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 2/3] drm/exynos: dp: fix wrong return type
Date: Thu, 03 Dec 2015 18:30:09 +0900
Message-ID: <1449135010-8111-3-git-send-email-inki.dae@samsung.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, javier@osg.samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBmaXhlcyB3cm9uZyByZXR1cm4gdHlwZSB3aGVuIGR0IGJpbmRpbmcgb2YgYnJp
ZGdlIGRldmljZQpmYWlsZWQuCgpJZiBhIGJvYXJkIGhhcyBhIGJyaWRnZSBkZXZpY2UgdGhlbiBv
Zl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50CmZ1bmN0aW9uIHNob3VsZG4ndCBiZSBOVUxM
LiBTbyB0aGlzIHBhdGNoIHdpbGwgcmV0dXJuIGEgcHJvcGVyIGVycm9yCnR5cGUgc28gdGhhdCB0
aGUgZGVmZXJyZWQgcHJvYmUgaXNuJ3QgdHJpZ2dlcmVkLgoKQ2hhbmdlbG9nIHYyOgotIHJldHVy
biAtRUlOVkFMIGlmIGdldHRpbmcgYSBwb3J0IG5vZGUgZmFpbGVkLgoKU2lnbmVkLW9mZi1ieTog
SW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzIDxqYXZpZXJAb3NnLnNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RwX2NvcmUuYwppbmRleCA2MDI2MGEwLi5hZWVlNjBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcF9jb3JlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHBfY29yZS5jCkBAIC0xNDM3LDggKzE0MzcsMTAgQEAgc3RhdGljIGludCBleHlu
b3NfZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJCW9mX25vZGVfcHV0
KGJyaWRnZV9ub2RlKTsKIAkJCWlmICghZHAtPnB0bl9icmlkZ2UpCiAJCQkJcmV0dXJuIC1FUFJP
QkVfREVGRVI7Ci0JCX0gZWxzZQotCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7CisJCX0gZWxzZSB7
CisJCQlEUk1fRVJST1IoIm5vIHBvcnQgbm9kZSBmb3IgYnJpZGdlIGRldmljZS5cbiIpOworCQkJ
cmV0dXJuIC1FSU5WQUw7CisJCX0KIAl9CiAKIG91dDoKLS0gCjEuOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
