From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v10 18/19] drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time
Date: Thu, 10 Dec 2015 16:52:59 +0800
Message-ID: <1449737579-13417-1-git-send-email-ykk@rock-chips.com>
References: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, javier@osg.samsung.com, emil.l.velikov@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VHVybiBvZmYgdGhlIHBhbmVsIHBvd2VyIGluIHN1c3BlbmQgdGltZSB3b3VsZCBoZWxwIHRvIHJl
ZHVjZQpwb3dlciB3YXN0ZS4KClNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNo
aXBzLmNvbT4KLS0tClRoaXMgcGF0Y2ggd2FzIGludHJvZHVjZWQgaW4gdjEwLjEsIHN1Z2dlc3Rl
ZCBieSBIZWlrbwoKQ2hhbmdlcyBpbiB2MTA6IE5vbmUKQ2hhbmdlcyBpbiB2OTogTm9uZQpDaGFu
Z2VzIGluIHY4OiBOb25lCkNoYW5nZXMgaW4gdjc6IE5vbmUKQ2hhbmdlcyBpbiB2NjogTm9uZQpD
aGFuZ2VzIGluIHY1OiBOb25lCkNoYW5nZXMgaW4gdjQ6IE5vbmUKQ2hhbmdlcyBpbiB2MzogTm9u
ZQpDaGFuZ2VzIGluIHYyOiBOb25lCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9jb3JlLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9jb3JlLmMKaW5kZXggZjUwNDdhYy4uNzliYTg4ZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKQEAgLTEzNjQs
NiArMTM2NCwxMiBAQCBpbnQgYW5hbG9naXhfZHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJc3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
IAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkcC0+Y2xvY2spOworCisJaWYgKGRwLT5wbGF0X2Rh
dGEtPnBhbmVsKSB7CisJCWlmIChkcm1fcGFuZWxfdW5wcmVwYXJlKGRwLT5wbGF0X2RhdGEtPnBh
bmVsKSkKKwkJCURSTV9FUlJPUigiZmFpbGVkIHRvIHR1cm5vZmYgdGhlIHBhbmVsXG4iKTsKKwl9
CisKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGFuYWxvZ2l4X2RwX3N1c3BlbmQp
OwpAQCAtMTM3OSw2ICsxMzg1LDEzIEBAIGludCBhbmFsb2dpeF9kcF9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAorCWlmIChkcC0+cGxhdF9kYXRhLT5wYW5l
bCkgeworCQlpZiAoZHJtX3BhbmVsX3ByZXBhcmUoZHAtPnBsYXRfZGF0YS0+cGFuZWwpKSB7CisJ
CQlEUk1fRVJST1IoImZhaWxlZCB0byBzZXR1cCB0aGUgcGFuZWxcbiIpOworCQkJcmV0dXJuIC1F
QlVTWTsKKwkJfQorCX0KKwogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoYW5hbG9n
aXhfZHBfcmVzdW1lKTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
