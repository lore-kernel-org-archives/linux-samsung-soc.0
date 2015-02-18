From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 6/6] ARM: dts: Add sound support to exynos5250-spring
Date: Wed, 18 Feb 2015 19:25:59 +0100
Message-ID: <1424283959-16289-7-git-send-email-afaerber@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424283959-16289-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAtc3ByaW5nLmR0cyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC1zcHJpbmcuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNTI1MC1zcHJpbmcuZHRzCmluZGV4IDg2NmJlYjRlMDU5Ny4uMTQyZTA1NTBl
MjIzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLXNwcmluZy5kdHMK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC1zcHJpbmcuZHRzCkBAIC00OSw2ICs0
OSwxNyBAQAogCQl9OwogCX07CiAKKwlzb3VuZCB7CisJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLHNu
b3ctYXVkaW8tbWF4OTgwODkiOworCQlzYW1zdW5nLG1vZGVsID0gIlNwcmluZy1JMlMtTUFYOTgw
ODkiOworCQlzYW1zdW5nLGkycy1jb250cm9sbGVyID0gPCZpMnMwPjsKKwkJc2Ftc3VuZyxhdWRp
by1jb2RlYyA9IDwmbWF4OTgwODk+OworCQljbG9ja3MgPSA8JnBtdV9zeXN0ZW1fY29udHJvbGxl
ciAwPjsKKwkJY2xvY2stbmFtZXMgPSAibWNsayI7CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CisJCXBpbmN0cmwtMCA9IDwmbWljX2RldF9ncGlvPiwgPCZocF9kZXRfZ3Bpbz47CisJfTsK
KwogCXVzYi1odWIgewogCQljb21wYXRpYmxlID0gInNtc2MsdXNiMzUwM2EiOwogCQlyZXNldC1n
cGlvcyA9IDwmZ3BlMSAwIEdQSU9fQUNUSVZFX0xPVz47CkBAIC00OTksNiArNTEwLDIwIEBACiAJ
CXNhbXN1bmcscGluLWRydiA9IDwwPjsKIAl9OwogCisJbWljX2RldF9ncGlvOiBtaWMtZGV0LWdw
aW8geworCQlzYW1zdW5nLHBpbnMgPSAiZ3B4Mi0wIjsKKwkJc2Ftc3VuZyxwaW4tZnVuY3Rpb24g
PSA8MD47CisJCXNhbXN1bmcscGluLXB1ZCA9IDwwPjsKKwkJc2Ftc3VuZyxwaW4tZHJ2ID0gPDA+
OworCX07CisKKwlocF9kZXRfZ3BpbzogaHAtZGV0LWdwaW8geworCQlzYW1zdW5nLHBpbnMgPSAi
Z3B4Mi0yIjsKKwkJc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSA8MD47CisJCXNhbXN1bmcscGluLXB1
ZCA9IDwwPjsKKwkJc2Ftc3VuZyxwaW4tZHJ2ID0gPDA+OworCX07CisKIAlzNW04NzY3X2RzOiBz
NW04NzY3LWRzIHsKIAkJc2Ftc3VuZyxwaW5zID0gImdweDItMyIsICJncHgyLTQiLCAiZ3B4Mi01
IjsKIAkJc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSA8MD47Ci0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
