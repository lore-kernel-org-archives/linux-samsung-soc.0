From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/exynos: fix kernel panic issue at drm releasing
Date: Thu, 24 Dec 2015 13:32:51 +0000
Message-ID: <CAPj87rMUrt55rBSXiFAsJ=vKUjohDmZPeC2CTMbTNAbVkCgYBg@mail.gmail.com>
References: <1450948214-14688-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1450948214-14688-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKCk9uIDI0IERlY2VtYmVyIDIwMTUgYXQgMDk6MTAsIElua2kgRGFlIDxpbmtpLmRh
ZUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gK3ZvaWQgZXh5bm9zX2RybV9jcnRjX2NhbmNlbF9wYWdl
X2ZsaXAoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZXh5bm9z
X2RybV9jcnRjICpleHlub3NfY3J0YyA9IHRvX2V4eW5vc19jcnRjKGNydGMpOwo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmY3J0
Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7Cj4gKyAgICAgICBleHlub3NfY3J0Yy0+ZXZlbnQg
PSBOVUxMOwo+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY3J0Yy0+ZGV2LT5ldmVu
dF9sb2NrLCBmbGFncyk7Cj4gK30KClRoaXMgd2lsbCBsZWFrIHRoZSBldmVudCBhbmQgZXZlbnQg
c3BhY2U7IHlvdSBzaG91bGQgY2FsbApldmVudC0+YmFzZS5kZXN0cm95KCkgaGVyZS4gV2l0aCB0
aGF0IGZpeGVkOgpSZXZpZXdlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5j
b20+CgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
