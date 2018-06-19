From: kbuild test robot <fengguang.wu@intel.com>
Subject: [PATCH] drm/bridge: tc358764: fix noderef.cocci warnings
Date: Tue, 19 Jun 2018 19:05:07 +0800
Message-ID: <20180619110506.GA20216@lkp-ib03>
References: <1529396370-18761-8-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1529396370-18761-8-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Maciej Purski <m.purski@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, kbuild-all@01.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGZlbmdndWFuZy53dUBpbnRlbC5jb20+Cgpkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmM6MTc5OjYwLTY2OiBFUlJPUjogYXBwbGljYXRpb24g
b2Ygc2l6ZW9mIHRvIHBvaW50ZXIKCiBzaXplb2Ygd2hlbiBhcHBsaWVkIHRvIGEgcG9pbnRlciB0
eXBlZCBleHByZXNzaW9uIGdpdmVzIHRoZSBzaXplIG9mCiB0aGUgcG9pbnRlcgoKR2VuZXJhdGVk
IGJ5OiBzY3JpcHRzL2NvY2NpbmVsbGUvbWlzYy9ub2RlcmVmLmNvY2NpCgpGaXhlczogMTQ3ZmU5
MGM5ZDUxICgiZHJtL2JyaWRnZTogdGMzNTg3NjQ6IEFkZCBEU0kgdG8gTFZEUyBicmlkZ2UgZHJp
dmVyIikKQ0M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYt
Ynk6IGtidWlsZCB0ZXN0IHJvYm90IDxmZW5nZ3Vhbmcud3VAaW50ZWwuY29tPgotLS0KCiB0YzM1
ODc2NC5jIHwgICAgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmMKQEAgLTE3Niw3ICsxNzYsOCBAQCBzdGF0
aWMgaW50IHRjMzU4NzY0X3JlYWQoc3RydWN0IHRjMzU4NzY0CiAJc3NpemVfdCByZXQ7CiAKIAlj
cHVfdG9fbGUxNnMoJmFkZHIpOwotCXJldCA9IG1pcGlfZHNpX2dlbmVyaWNfcmVhZChkc2ksICZh
ZGRyLCBzaXplb2YoYWRkciksIHZhbCwgc2l6ZW9mKHZhbCkpOworCXJldCA9IG1pcGlfZHNpX2dl
bmVyaWNfcmVhZChkc2ksICZhZGRyLCBzaXplb2YoYWRkciksIHZhbCwKKwkJCQkgICAgc2l6ZW9m
KCp2YWwpKTsKIAlpZiAocmV0ID49IDApCiAJCWxlMzJfdG9fY3B1cyh2YWwpOwogCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
