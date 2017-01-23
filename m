From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 7/7] arm64: dts: exynos: configure TV path clocks for Ultra
 HD modes
Date: Mon, 23 Jan 2017 08:56:15 +0100
Message-ID: <1485158175-22342-1-git-send-email-a.hajda@samsung.com>
References: <20170120145138.yhjngt2cxbikq32z@kozik-lap>
 <CGME20170123075623eucas1p19a1edd12eec91abdbbf786b308f65051@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20170120145138.yhjngt2cxbikq32z@kozik-lap>
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
YXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpIHwgMTEgKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpCmluZGV4IGYxMjBkOTkuLjRkMjhlOTMgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRzaQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kKQEAgLTc2NCw2ICs3NjQsMTcg
QEAKIAkJCWNsb2NrLW5hbWVzID0gInBjbGsiLCAiYWNsa19kZWNvbiIsICJhY2xrX3NtbXVfZGVj
b24weCIsCiAJCQkJICAgICAgImFjbGtfeGl1X2RlY29uMHgiLCAicGNsa19zbW11X2RlY29uMHgi
LAogCQkJCSAgICAgICJzY2xrX2RlY29uX3ZjbGsiLCAic2Nsa19kZWNvbl9lY2xrIjsKKwkJCWFz
c2lnbmVkLWNsb2NrcyA9CisJCQkJPCZjbXVfbWlmIENMS19NT1VUX1NDTEtfREVDT05fVFZfRUNM
S19BPiwKKwkJCQk8JmNtdV9taWYgQ0xLX0RJVl9TQ0xLX0RFQ09OX1RWX0VDTEs+LAorCQkJCTwm
Y211X2Rpc3AgQ0xLX01PVVRfU0NMS19ERUNPTl9UVl9FQ0xLX1VTRVI+LAorCQkJCTwmY211X2Rp
c3AgQ0xLX01PVVRfU0NMS19ERUNPTl9UVl9FQ0xLPjsKKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVu
dHMgPQorCQkJCTwmY211X21pZiBDTEtfTU9VVF9CVVNfUExMX0RJVjI+LAorCQkJCTwwPiwKKwkJ
CQk8JmNtdV9taWYgQ0xLX1NDTEtfREVDT05fVFZfRUNMS19ESVNQPiwKKwkJCQk8JmNtdV9kaXNw
IENMS19NT1VUX1NDTEtfREVDT05fVFZfRUNMS19VU0VSPjsKKwkJCWFzc2lnbmVkLWNsb2NrLXJh
dGVzID0gPDA+LCA8NDAwMDAwMDAwPjsKIAkJCXNhbXN1bmcsZGlzcC1zeXNyZWcgPSA8JnN5c2Nv
bl9kaXNwPjsKIAkJCWludGVycnVwdC1uYW1lcyA9ICJmaWZvIiwgInZzeW5jIiwgImxjZF9zeXMi
OwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxMCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
