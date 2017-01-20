From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] arm64: dts: exynos: configure TV path clocks for Ultra HD
 modes
Date: Fri, 20 Jan 2017 07:52:25 +0100
Message-ID: <1484895145-511-8-git-send-email-a.hajda@samsung.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065232eucas1p170340d5a71e89db7c08d7218adbe4c2c@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VWx0cmEgSEQgbW9kZXMgcmVxdWlyZXMgY2xvY2sgdGlja2luZyBhdCBpbmNyZWFzZWQgcmF0ZS4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQog
YXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9l
eHlub3M1NDMzLmR0c2kKaW5kZXggZjEyMGQ5OS4uMzE0ZDkyOCAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRzaQpAQCAtNzY0LDYgKzc2NCw5IEBACiAJCQljbG9j
ay1uYW1lcyA9ICJwY2xrIiwgImFjbGtfZGVjb24iLCAiYWNsa19zbW11X2RlY29uMHgiLAogCQkJ
CSAgICAgICJhY2xrX3hpdV9kZWNvbjB4IiwgInBjbGtfc21tdV9kZWNvbjB4IiwKIAkJCQkgICAg
ICAic2Nsa19kZWNvbl92Y2xrIiwgInNjbGtfZGVjb25fZWNsayI7CisJCQlhc3NpZ25lZC1jbG9j
a3MgPSA8JmNtdV9taWYgQ0xLX01PVVRfU0NMS19ERUNPTl9UVl9FQ0xLX0E+LCA8JmNtdV9taWYg
Q0xLX0RJVl9TQ0xLX0RFQ09OX1RWX0VDTEs+LCA8JmNtdV9kaXNwIENMS19NT1VUX1NDTEtfREVD
T05fVFZfRUNMS19VU0VSPiwgPCZjbXVfZGlzcCBDTEtfTU9VVF9TQ0xLX0RFQ09OX1RWX0VDTEs+
OworCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY211X21pZiBDTEtfTU9VVF9CVVNfUExM
X0RJVjI+LCA8MD4sIDwmY211X21pZiBDTEtfU0NMS19ERUNPTl9UVl9FQ0xLX0RJU1A+LCA8JmNt
dV9kaXNwIENMS19NT1VUX1NDTEtfREVDT05fVFZfRUNMS19VU0VSPjsKKwkJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDA+LCA8NDAwMDAwMDAwPjsKIAkJCXNhbXN1bmcsZGlzcC1zeXNyZWcgPSA8
JnN5c2Nvbl9kaXNwPjsKIAkJCWludGVycnVwdC1uYW1lcyA9ICJmaWZvIiwgInZzeW5jIiwgImxj
ZF9zeXMiOwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxMCBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
