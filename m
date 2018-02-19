From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 0/8] Use clk bulk API in exynos5433 drivers
Date: Mon, 19 Feb 2018 16:43:58 +0100
Message-ID: <1519055046-2399-1-git-send-email-m.purski@samsung.com>
References: <CGME20180219154456eucas1p178a82b3bb643028dc7c99ccca9c6eaca@eucas1p1.samsung.com>
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
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Kamil Debski <kamil@wypas.org>, Maciej Purski <m.purski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Hans Verkuil <hansverk@cisco.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgYWxsLAoKdGhlIG1haW4gZ29hbCBvZiB0aGlzIHBhdGNoc2V0IGlzIHRvIHNpbXBsaWZ5IGNs
ayBtYW5hZ2VtZW50IGNvZGUgaW4KZXh5bm9zNTQzMyBkcml2ZXJzIGJ5IHVzaW5nIGNsayBidWxr
IEFQSS4gSW4gb3JkZXIgdG8gYWNoaWV2ZSB0aGF0LApwYXRjaCAjMSBhZGRzIGEgbmV3IGZ1bmN0
aW9uIHRvIGNsayBjb3JlLCB3aGljaCBkeW5hbWljYWxseSBhbGxvY2F0ZXMKY2xrX2J1bGtfZGF0
YSBhcnJheSBhbmQgZmlsbHMgaXRzIGlkIGZpZWxkcy4KCkJlc3QgcmVnYXJkcywKCk1hY2llaiBQ
dXJza2kKCk1hY2llaiBQdXJza2kgKDgpOgogIGNsazogQWRkIGNsa19idWxrX2FsbG9jIGZ1bmN0
aW9ucwogIG1lZGlhOiBzNXAtanBlZzogVXNlIGJ1bGsgY2xrIEFQSQogIGRybS9leHlub3MvZGVj
b246IFVzZSBjbGsgYnVsayBBUEkKICBkcm0vZXh5bm9zL2RzaTogVXNlIGNsayBidWxrIEFQSQog
IGRybS9leHlub3M6IG1pYzogVXNlIGNsayBidWxrIEFQSQogIGRybS9leHlub3MvaGRtaTogVXNl
IGNsayBidWxrIEFQSQogIFttZWRpYV0gZXh5bm9zLWdzYzogVXNlIGNsayBidWxrIEFQSQogIFtt
ZWRpYV0gczVwLW1mYzogVXNlIGNsayBidWxrIEFQSQoKIGRyaXZlcnMvY2xrL2Nsay1idWxrLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysKIGRyaXZlcnMvY2xrL2Nsay1kZXZy
ZXMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMzcgKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyAgIHwgNTAgKysrKystLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgICAgICAgICB8IDY4ICsr
KysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWlj
LmMgICAgICAgICB8IDQ0ICsrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2hkbWkuYyAgICAgICAgICAgIHwgODUgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3MtZ3NjL2dzYy1jb3JlLmMgICAgfCA1NSArKysrKyst
LS0tLS0tLS0tCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vcy1nc2MvZ3NjLWNvcmUuaCAg
ICB8ICAyICstCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3M1cC1qcGVnL2pwZWctY29yZS5jICAg
ICB8IDQ1ICsrKysrKy0tLS0tLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vczVwLWpwZWcvanBl
Zy1jb3JlLmggICAgIHwgIDIgKy0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vczVwLW1mYy9zNXBf
bWZjX2NvbW1vbi5oIHwgIDYgKy0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vczVwLW1mYy9zNXBf
bWZjX3BtLmMgICAgIHwgNDEgKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2Nsay5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysKIDEzIGZpbGVz
IGNoYW5nZWQsIDI2MyBpbnNlcnRpb25zKCspLCAyNTIgZGVsZXRpb25zKC0pCgotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
