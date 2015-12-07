From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v10 10/17] dt-bindings: add document for rockchip dp phy
Date: Mon,  7 Dec 2015 14:39:50 +0800
Message-ID: <1449470390-31285-1-git-send-email-ykk@rock-chips.com>
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

QWRkIGR0IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3Igcm9ja2NoaXAgZGlzcGxheSBwb3J0IFBI
WS4KClNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KUmV2aWV3
ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Ci0tLQpDaGFuZ2VzIGluIHYx
MDogTm9uZQpDaGFuZ2VzIGluIHY5OiBOb25lCkNoYW5nZXMgaW4gdjg6Ci0gUmVtb3ZlIHRoZSBz
cGVjaWZpYyBhZGRyZXNzIGluIHRoZSBleGFtcGxlIG5vZGUgbmFtZS4gKEhlaWtvKQoKQ2hhbmdl
cyBpbiB2NzoKLSBTaW1wbGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UuIChLaXNob24pCgpDaGFuZ2Vz
IGluIHY2OiBOb25lCkNoYW5nZXMgaW4gdjU6Ci0gU3BsaXQgYmluZGluZyBkb2MncyBmcm9tIGRy
aXZlciBjaGFuZ2VzLiAoUm9iKQotIFVwZGF0ZSB0aGUgcm9ja2NoaXAsZ3JmIGV4cGxhaW4gaW4g
ZG9jdW1lbnQsIGFuZCBjb3JyZWN0IHRoZSBjbG9jayByZXF1aXJlZAogIGVsZW1ldHMgaW4gZG9j
dW1lbnQuIChSb2IgJiBIZWlrbykKCkNoYW5nZXMgaW4gdjQ6IE5vbmUKQ2hhbmdlcyBpbiB2Mzog
Tm9uZQpDaGFuZ2VzIGluIHYyOiBOb25lCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Jv
Y2tjaGlwLWRwLXBoeS50eHQgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcm9ja2NoaXAtZHAtcGh5LnR4dAoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcm9ja2NoaXAtZHAtcGh5
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcm9ja2NoaXAtZHAt
cGh5LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4wMDkwMmNiCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9yb2Nr
Y2hpcC1kcC1waHkudHh0CkBAIC0wLDAgKzEsMjIgQEAKK1JvY2tjaGlwIFNvYyBTZXJvZXMgRGlz
cGxheSBQb3J0IFBIWQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1Jl
cXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGUgOiBzaG91bGQgYmUgb25lIG9mIHRoZSBm
b2xsb3dpbmcgc3VwcG9ydGVkIHZhbHVlczoKKwkgLSAicm9ja2NoaXAucmszMjg4LWRwLXBoeSIK
Ky0gY2xvY2tzOiBmcm9tIGNvbW1vbiBjbG9jayBiaW5kaW5nOiBoYW5kbGUgdG8gZHAgY2xvY2su
CisJb2YgbWVtb3J5IG1hcHBlZCByZWdpb24uCistIGNsb2NrLW5hbWVzOiBmcm9tIGNvbW1vbiBj
bG9jayBiaW5kaW5nOgorCVJlcXVpcmVkIGVsZW1lbnRzOiAiMjRtIgorLSByb2NrY2hpcCxncmY6
IHBoYW5kbGUgdG8gdGhlIHN5c2NvbiBtYW5hZ2luZyB0aGUgImdlbmVyYWwgcmVnaXN0ZXIgZmls
ZXMiCistICNwaHktY2VsbHMgOiBmcm9tIHRoZSBnZW5lcmljIFBIWSBiaW5kaW5ncywgbXVzdCBi
ZSAwOworCitFeGFtcGxlOgorCitlZHBfcGh5OiBlZHAtcGh5IHsKKwljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzI4OC1kcC1waHkiOworCXJvY2tjaGlwLGdyZiA9IDwmZ3JmPjsKKwljbG9ja3Mg
PSA8JmNydSBTQ0xLX0VEUF8yNE0+OworCWNsb2NrLW5hbWVzID0gIjI0bSI7CisJI3BoeS1jZWxs
cyA9IDwwPjsKK307Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
