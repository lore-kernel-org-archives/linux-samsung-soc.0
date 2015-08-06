From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH 5/8] drm: bridge/analogix_dp: add platform device type
 support
Date: Thu,  6 Aug 2015 09:19:49 -0500
Message-ID: <1438870789-23898-1-git-send-email-ykk@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, dianders@google.com, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

U2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9leHlub3MvYW5hbG9naXhfZHAtZXh5bm9zLmMgICAgIHwgMSArCiBkcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYyB8IDEgKwogaW5jbHVkZS9k
cm0vYnJpZGdlL2FuYWxvZ2l4X2RwLmggICAgICAgICAgICAgICAgfCA2ICsrKysrKwogMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2FuYWxvZ2l4X2RwLWV4eW5vcy5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9hbmFs
b2dpeF9kcC1leHlub3MuYwppbmRleCBiOGQwOWQ0Li4wNjY4ZTc3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2FuYWxvZ2l4X2RwLWV4eW5vcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvYW5hbG9naXhfZHAtZXh5bm9zLmMKQEAgLTEyNCw2ICsxMjQsNyBAQCBzdGF0
aWMgaW50IGV4eW5vc19kcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLCB2b2lkICpkYXRhKQogCWRwLT5kZXYgPSBkZXY7CiAJZHAtPmRybV9kZXYgPSBkcm1f
ZGV2OwogCisJZHAtPnBsYXRfZGF0YS5kZXZfdHlwZSA9IEVYWU5PU19EUDsKIAlkcC0+cGxhdF9k
YXRhLnBvd2VyX29uID0gZXh5bm9zX2RwX3Bvd2Vyb247CiAJZHAtPnBsYXRfZGF0YS5wb3dlcl9v
ZmYgPSBleHlub3NfZHBfcG93ZXJvZmY7CiAJZHAtPnBsYXRfZGF0YS5hdHRhY2ggPSBleHlub3Nf
ZHBfYnJpZGdlX2F0dGFjaDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9h
bmFsb2dpeF9kcC1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4
X2RwLXJvY2tjaGlwLmMKaW5kZXggODA0MDQ4Yy4uYjUzMmMyMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMKQEAgLTMxMiw2ICszMTIsNyBA
QCBzdGF0aWMgaW50IHJvY2tjaGlwX2RwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZGV2aWNlICptYXN0ZXIsCiAJCXJldHVybiByZXQ7CiAJfQogCisJZHAtPnBsYXRfZGF0YS5kZXZf
dHlwZSA9IFJLMzI4OF9EUDsKIAlkcC0+cGxhdF9kYXRhLmF0dGFjaCA9IE5VTEw7CiAJZHAtPnBs
YXRfZGF0YS5wb3dlcl9vbiA9IHJvY2tjaGlwX2RwX3Bvd2Vyb247CiAJZHAtPnBsYXRfZGF0YS5w
b3dlcl9vZmYgPSByb2NrY2hpcF9kcF9wb3dlcm9mZjsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2JyaWRnZS9hbmFsb2dpeF9kcC5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2FuYWxvZ2l4X2RwLmgK
aW5kZXggOWEyMDdmOC4uZjMxNzAwMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4X2RwLmgKKysrIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2FuYWxvZ2l4X2RwLmgKQEAgLTMs
NyArMywxMyBAQAogCiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+CiAKK2VudW0gYW5hbG9naXhf
ZHBfZGV2dHlwZSB7CisJRVhZTk9TX0RQLAorCVJLMzI4OF9EUCwKK307CisKIHN0cnVjdCBhbmFs
b2dpeF9kcF9wbGF0X2RhdGEgeworCWVudW0gYW5hbG9naXhfZHBfZGV2dHlwZSBkZXZfdHlwZTsK
IAlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKIAogCWludCAoKnBvd2VyX29uKShzdHJ1Y3QgYW5h
bG9naXhfZHBfcGxhdF9kYXRhICopOwotLSAKMi4xLjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
