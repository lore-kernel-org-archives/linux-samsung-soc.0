From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v11 18/19] drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time
Date: Wed, 16 Dec 2015 11:59:46 +0800
Message-ID: <1450238386-3343-1-git-send-email-ykk@rock-chips.com>
References: <1450236018-1118-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1450236018-1118-1-git-send-email-ykk@rock-chips.com>
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Rob Herring <robh+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VHVybiBvZmYgdGhlIHBhbmVsIHBvd2VyIGluIHN1c3BlbmQgdGltZSB3b3VsZCBoZWxwIHRvIHJl
ZHVjZQpwb3dlciB3YXN0ZS4KClNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNo
aXBzLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjExOiBOb25lCkNoYW5nZXMgaW4gdjEwOiBOb25lCkNo
YW5nZXMgaW4gdjk6IE5vbmUKQ2hhbmdlcyBpbiB2ODogTm9uZQpDaGFuZ2VzIGluIHY3OiBOb25l
CkNoYW5nZXMgaW4gdjY6IE5vbmUKQ2hhbmdlcyBpbiB2NTogTm9uZQpDaGFuZ2VzIGluIHY0OiBO
b25lCkNoYW5nZXMgaW4gdjM6IE5vbmUKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgMTMgKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IGQxODA1NGQuLmJj
NGE5ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXhfZHBfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXhfZHBfY29yZS5jCkBAIC0xMzU3LDYgKzEzNTcsMTIgQEAgaW50IGFuYWxvZ2l4X2RwX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBhbmFsb2dpeF9kcF9kZXZpY2UgKmRwID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CiAKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHAtPmNsb2Nr
KTsKKworCWlmIChkcC0+cGxhdF9kYXRhLT5wYW5lbCkgeworCQlpZiAoZHJtX3BhbmVsX3VucHJl
cGFyZShkcC0+cGxhdF9kYXRhLT5wYW5lbCkpCisJCQlEUk1fRVJST1IoImZhaWxlZCB0byB0dXJu
b2ZmIHRoZSBwYW5lbFxuIik7CisJfQorCiAJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MX0dQ
TChhbmFsb2dpeF9kcF9zdXNwZW5kKTsKQEAgLTEzNzIsNiArMTM3OCwxMyBAQCBpbnQgYW5hbG9n
aXhfZHBfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwlp
ZiAoZHAtPnBsYXRfZGF0YS0+cGFuZWwpIHsKKwkJaWYgKGRybV9wYW5lbF9wcmVwYXJlKGRwLT5w
bGF0X2RhdGEtPnBhbmVsKSkgeworCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gc2V0dXAgdGhlIHBh
bmVsXG4iKTsKKwkJCXJldHVybiAtRUJVU1k7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIEVY
UE9SVF9TWU1CT0xfR1BMKGFuYWxvZ2l4X2RwX3Jlc3VtZSk7Ci0tIAoxLjkuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
