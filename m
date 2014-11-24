From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH V2 1/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Mon, 24 Nov 2014 18:32:57 +0530
Message-ID: <1416834177-11170-1-git-send-email-gautam.vivek@samsung.com>
References: <CAFp+6iF-N63YSsdv2a6=MYp_mD=eQY_Oi8=9JVNU5dG0BA7YGQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13253 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbaKXNKD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 08:10:03 -0500
In-reply-to: <CAFp+6iF-N63YSsdv2a6=MYp_mD=eQY_Oi8=9JVNU5dG0BA7YGQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, robh+dt@kernel.org, kgene@kernel.org, alim.akhtar@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

USB and Power regulator on Exynos7 require gpios available
in BUS1 pin controller block.
So adding the BUS1 pinctrl support.

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---

This patch was part of series:
"[PATCH 00/11] Exynos7: Adding USB 3.0 support"
 https://lkml.org/lkml/2014/11/21/247

Changes since V1:
 - Added support for all pin banks which are part of BUS1 pin controller.

 drivers/pinctrl/samsung/pinctrl-exynos.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index d5d4cfc..44e60dc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1300,6 +1300,20 @@ static const struct samsung_pin_bank_data exynos7_pin_banks7[] __initconst = {
 	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpr3", 0x0c),
 };
 
+/* pin banks of exynos7 pin-controller - BUS1 */
+static const struct samsung_pin_bank_data exynos7_pin_banks8[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpf0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpf1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(4, 0x060, "gpf2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpf3", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0a0, "gpf4", 0x10),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpf5", 0x14),
+	EXYNOS_PIN_BANK_EINTG(5, 0x0e0, "gpg1", 0x18),
+	EXYNOS_PIN_BANK_EINTG(5, 0x100, "gpg2", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(6, 0x120, "gph1", 0x20),
+	EXYNOS_PIN_BANK_EINTG(3, 0x140, "gpv6", 0x24),
+};
+
 const struct samsung_pin_ctrl exynos7_pin_ctrl[] __initconst = {
 	{
 		/* pin-controller instance 0 Alive data */
@@ -1342,5 +1356,10 @@ const struct samsung_pin_ctrl exynos7_pin_ctrl[] __initconst = {
 		.pin_banks	= exynos7_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks7),
 		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 8 BUS1 data */
+		.pin_banks	= exynos7_pin_banks8,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks8),
+		.eint_gpio_init = exynos_eint_gpio_init,
 	},
 };
-- 
1.7.10.4
