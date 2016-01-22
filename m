From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v13 16/17] drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time
Date: Fri, 22 Jan 2016 09:56:31 +0800
Message-ID: <1453427791-24698-1-git-send-email-ykk@rock-chips.com>
References: <1453427614-23053-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1453427614-23053-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VHVybiBvZmYgdGhlIHBhbmVsIHBvd2VyIGluIHN1c3BlbmQgdGltZSB3b3VsZCBoZWxwIHRvIHJl
ZHVjZQpwb3dlciB3YXN0ZS4KClNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNo
aXBzLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjEzOiBOb25lCkNoYW5nZXMgaW4gdjEyOiBOb25lCkNo
YW5nZXMgaW4gdjExOiBOb25lCkNoYW5nZXMgaW4gdjEwOiBOb25lCkNoYW5nZXMgaW4gdjk6IE5v
bmUKQ2hhbmdlcyBpbiB2ODogTm9uZQpDaGFuZ2VzIGluIHY3OiBOb25lCkNoYW5nZXMgaW4gdjY6
IE5vbmUKQ2hhbmdlcyBpbiB2NTogTm9uZQpDaGFuZ2VzIGluIHY0OiBOb25lCkNoYW5nZXMgaW4g
djM6IE5vbmUKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IGJjNTllOGQuLjUyOTJiMjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCkBA
IC0xNDAwLDYgKzE0MDAsMTIgQEAgaW50IGFuYWxvZ2l4X2RwX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQogCXN0cnVjdCBhbmFsb2dpeF9kcF9kZXZpY2UgKmRwID0gZGV2X2dldF9kcnZkYXRh
KGRldik7CiAKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHAtPmNsb2NrKTsKKworCWlmIChkcC0+
cGxhdF9kYXRhLT5wYW5lbCkgeworCQlpZiAoZHJtX3BhbmVsX3VucHJlcGFyZShkcC0+cGxhdF9k
YXRhLT5wYW5lbCkpCisJCQlEUk1fRVJST1IoImZhaWxlZCB0byB0dXJub2ZmIHRoZSBwYW5lbFxu
Iik7CisJfQorCiAJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChhbmFsb2dpeF9kcF9z
dXNwZW5kKTsKQEAgLTE0MTUsNiArMTQyMSwxMyBAQCBpbnQgYW5hbG9naXhfZHBfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwlpZiAoZHAtPnBsYXRfZGF0
YS0+cGFuZWwpIHsKKwkJaWYgKGRybV9wYW5lbF9wcmVwYXJlKGRwLT5wbGF0X2RhdGEtPnBhbmVs
KSkgeworCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gc2V0dXAgdGhlIHBhbmVsXG4iKTsKKwkJCXJl
dHVybiAtRUJVU1k7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KGFuYWxvZ2l4X2RwX3Jlc3VtZSk7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
