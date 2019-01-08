From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 1/4] ARM: dts: s5pv210: aries: Add reserved memory for mfc
Date: Tue,  8 Jan 2019 17:55:58 +0100
Message-ID: <20190108165601.25708-2-pawel.mikolaj.chmiel@gmail.com>
References: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, xc-racer2@live.ca, linux@armlinux.org.uk, robh+dt@kernel.org, linux-kernel@vger.kernel.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, pawel.mikolaj.chmiel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

VEhpcyBjb21taXQgYWRkcyBtZW1vcnkgcmVzZXJ2YXRpb24gcmVxdWlyZWQgYnkgTUZDIHRvIHJ1
bi4KT24gUzVQVjIxMCBib3RoIHJlZ2lvbnMgbmVlZHMgdG8gYmUgb24gc2VwYXJhdGUgbWVtb3J5
IGJhbmtzLgpTaXplIG9mIGJvdGggcmVnaW9ucyBpcyB0YWtlbiBmcm9tIHN0b2NrIHNvdXJjZXMu
CgpTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFp
bC5jb20+Ci0tLQpDaGFuZ2VzIGZyb20gdjE6CiAgIC0gRml4ZWQgbmFtZSBvZiBub2RlcyB0byBi
ZSBtb3JlIGdlbmVyaWMKLS0tCiBhcmNoL2FybS9ib290L2R0cy9zNXB2MjEwLWFyaWVzLmR0c2kg
fCAyMiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAtYXJpZXMuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAtYXJpZXMuZHRzaQppbmRleCA1NzUwOTRlYTcwMjQu
Ljg5NTI1ZTU2Y2M3YyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvczVwdjIxMC1hcmll
cy5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3M1cHYyMTAtYXJpZXMuZHRzaQpAQCAtMjMs
NiArMjMsMjQgQEAKIAkJCTB4NTAwMDAwMDAgMHgwODAwMDAwMD47CiAJfTsKIAorCXJlc2VydmVk
LW1lbW9yeSB7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwxPjsK
KwkJcmFuZ2VzOworCisJCW1mY19sZWZ0OiByZWdpb25ANDMwMDAwMDAgeworCQkJY29tcGF0aWJs
ZSA9ICJzaGFyZWQtZG1hLXBvb2wiOworCQkJbm8tbWFwOworCQkJcmVnID0gPDB4NDMwMDAwMDAg
MHgyMDAwMDAwPjsKKwkJfTsKKworCQltZmNfcmlnaHQ6IHJlZ2lvbkA1MTAwMDAwMCB7CisJCQlj
b21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CisJCQluby1tYXA7CisJCQlyZWcgPSA8MHg1
MTAwMDAwMCAweDIwMDAwMDA+OworCQl9OworCX07CisKIAl3aWZpX3B3cnNlcTogd2lmaS1wd3Jz
ZXEgewogCQljb21wYXRpYmxlID0gIm1tYy1wd3JzZXEtc2ltcGxlIjsKIAkJcmVzZXQtZ3Bpb3Mg
PSA8JmdwZzEgMiBHUElPX0FDVElWRV9MT1c+OwpAQCAtMzI5LDYgKzM0NywxMCBAQAogCXN0YXR1
cyA9ICJva2F5IjsKIH07CiAKKyZtZmMgeworCW1lbW9yeS1yZWdpb24gPSA8Jm1mY19sZWZ0Piwg
PCZtZmNfcmlnaHQ+OworfTsKKwogJnBpbmN0cmwwIHsKIAl3bGFuX2J0X2VuOiB3bGFuLWJ0LWVu
IHsKIAkJc2Ftc3VuZyxwaW5zID0gImdwYi01IjsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
