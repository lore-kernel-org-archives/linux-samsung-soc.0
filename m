From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] drm/exynos: g2d: Delete an error message for a failed memory
 allocation in two functions
Date: Thu, 8 Feb 2018 18:52:07 +0100
Message-ID: <f1a7c103-fd17-3a61-61f7-570436e3c452@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDggRmViIDIwMTggMTg6NDI6NTEgKzAxMDAKCk9taXQgYW4gZXh0cmEgbWVzc2FnZSBm
b3IgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGluIHRoZXNlIGZ1bmN0aW9ucy4KClRoaXMg
aXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2ln
bmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyB8IDYgKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwppbmRleCAyYjhiZjJkZDYzODcuLjVlYjBk
MzI5MjUyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cy
ZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwpAQCAtMjg2
LDcgKzI4Niw2IEBAIHN0YXRpYyBpbnQgZzJkX2luaXRfY21kbGlzdChzdHJ1Y3QgZzJkX2RhdGEg
KmcyZCkKIAogCW5vZGUgPSBrY2FsbG9jKEcyRF9DTURMSVNUX05VTSwgc2l6ZW9mKCpub2RlKSwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFub2RlKSB7Ci0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFs
bG9jYXRlIG1lbW9yeVxuIik7CiAJCXJldCA9IC1FTk9NRU07CiAJCWdvdG8gZXJyOwogCX0KQEAg
LTEzNTgsMTAgKzEzNTcsOSBAQCBpbnQgZXh5bm9zX2cyZF9leGVjX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm1fZGV2LCB2b2lkICpkYXRhLAogCQlyZXR1cm4gLUVGQVVMVDsKIAogCXJ1bnF1
ZXVlX25vZGUgPSBrbWVtX2NhY2hlX2FsbG9jKGcyZC0+cnVucXVldWVfc2xhYiwgR0ZQX0tFUk5F
TCk7Ci0JaWYgKCFydW5xdWV1ZV9ub2RlKSB7Ci0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFs
bG9jYXRlIG1lbW9yeVxuIik7CisJaWYgKCFydW5xdWV1ZV9ub2RlKQogCQlyZXR1cm4gLUVOT01F
TTsKLQl9CisKIAlydW5fY21kbGlzdCA9ICZydW5xdWV1ZV9ub2RlLT5ydW5fY21kbGlzdDsKIAll
dmVudF9saXN0ID0gJnJ1bnF1ZXVlX25vZGUtPmV2ZW50X2xpc3Q7CiAJSU5JVF9MSVNUX0hFQUQo
cnVuX2NtZGxpc3QpOwotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
