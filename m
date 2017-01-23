From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 7/7] arm64: dts: exynos: configure TV path clocks for Ultra
 HD modes
Date: Mon, 23 Jan 2017 11:05:49 +0100
Message-ID: <1485165949-32661-1-git-send-email-a.hajda@samsung.com>
References: <a9812091-2b97-0abf-da74-313ff941bb76@samsung.com>
 <CGME20170123100557eucas1p28174748d64c4e8503a2006a9c5b554a6@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <a9812091-2b97-0abf-da74-313ff941bb76@samsung.com>
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
ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQp2
MjogbG9uZyBsaW5lcyB3cmFwcGVkCnYzOiBtb3ZlZCBhc3NpZ25lZCBjbG9ja3MgdG8gY211X2Rp
c3Agbm9kZSBpbiB0bTItY29tbW9uCi0tLQogYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5
bm9zNTQzMy10bTItY29tbW9uLmR0c2kgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlu
b3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5v
cy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQppbmRleCBjZDg4NDdiLi41ZjFlMTcyIDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24u
ZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21t
b24uZHRzaQpAQCAtMjE3LDYgKzIxNywxOCBAQAogCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8
JmNtdV90b3AgQ0xLX0ZPVVRfQVVEX1BMTD47CiB9OwogCismY211X2Rpc3AgeworCWFzc2lnbmVk
LWNsb2NrcyA9IDwmY211X21pZiBDTEtfTU9VVF9TQ0xLX0RFQ09OX1RWX0VDTEtfQT4sCisJCQkg
IDwmY211X21pZiBDTEtfRElWX1NDTEtfREVDT05fVFZfRUNMSz4sCisJCQkgIDwmY211X2Rpc3Ag
Q0xLX01PVVRfU0NMS19ERUNPTl9UVl9FQ0xLX1VTRVI+LAorCQkJICA8JmNtdV9kaXNwIENMS19N
T1VUX1NDTEtfREVDT05fVFZfRUNMSz47CisJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY211
X21pZiBDTEtfTU9VVF9CVVNfUExMX0RJVjI+LAorCQkJCSA8MD4sCisJCQkJIDwmY211X21pZiBD
TEtfU0NMS19ERUNPTl9UVl9FQ0xLX0RJU1A+LAorCQkJCSA8JmNtdV9kaXNwIENMS19NT1VUX1ND
TEtfREVDT05fVFZfRUNMS19VU0VSPjsKKwlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwwPiwgPDQw
MDAwMDAwMD47Cit9OworCiAmY211X2ZzeXMgewogCWFzc2lnbmVkLWNsb2NrcyA9IDwmY211X3Rv
cCBDTEtfTU9VVF9TQ0xLX1VTQkRSRDMwPiwKIAkJPCZjbXVfdG9wIENMS19NT1VUX1NDTEtfVVNC
SE9TVDMwPiwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
