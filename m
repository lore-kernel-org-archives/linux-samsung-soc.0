From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 0/3] drm/exynos: add support for dynamic zpos in DECON
 and FIMD
Date: Mon, 10 Dec 2018 12:18:31 +0100
Message-ID: <20181210111834.17916-1-a.hajda@samsung.com>
References: <CGME20181210111837eucas1p278bfa71f68fffbcde87e13c7dbdc6df1@eucas1p2.samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoaXMgc21hbGwgcGF0Y2hzZXQgYWRkcyBkeW5hbWljIHpwb3Mgc3VwcG9ydCBm
b3IgREVDT04gYW5kIEZJTUQuCkl0IHdhcyB0ZXN0ZWQgb24gdG0yIGFuZCB0cmF0czIuCgpUaGUg
cGF0Y2hzZXQgaXMgcmViYXNlZCBvbiBjdXJyZW50IGV4eW5vcy1kcm0tbmV4dC4KCnYyOgogSSBo
YXZlIGZvcmdvdCB0byB1cGRhdGUgKndpbl9zZXRfcGl4Zm10IHRvIHNldCBwaXhlbCBmb3JtYXQg
b24gY29ycmVjdCB3aW5kb3csIGZpeGVkLgoKUmVnYXJkcwpBbmRyemVqCgoKQW5kcnplaiBIYWpk
YSAoMyk6CiAgZHJtL2V4eW5vcy9kZWNvbjU0MzM6IGFkZCBkeW5hbWljIHpwb3Mgc3VwcG9ydAog
IGRybS9leHlub3MvZmltZDogY3JlYXRlIGxvY2FsIGhlbHBlciBmb3IgZGlzYWJsaW5nIGhhcmR3
YXJlIHdpbmRvdwogIGRybS9leHlub3MvZmltZDogYWRkIGR5bmFtaWMgenBvcyBzdXBwb3J0Cgog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jIHwgNDUgKysrKysr
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAgICAgIHwg
NjcgKysrKysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
LCA2NSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
