From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 2/6] pinctrl: samsung: Add support for pad retention control
 for Exynos5433 SoCs
Date: Thu, 23 Mar 2017 09:03:23 +0100
Message-ID: <1490256207-10061-3-git-send-email-m.szyprowski@samsung.com>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170323080348eucas1p188a598869b71a1302160df46839b3ca8@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36869 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932117AbdCWIDx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 04:03:53 -0400
In-reply-to: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds support for retention control for Exynos5433 SoCs. Three
groups of pins has been defined for retention control: common shared group
for ALIVE, CPIF, eSE, FINGER, IMEM, NFC, PERIC, TOUCH pin banks and
separate control for FSYS and AUD pin banks, for which PMU retention
registers match whole banks.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index fa8bdd9ae198..c0dfd31c0fa2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1551,6 +1551,54 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpj1", 0x00),
 };
 
+/* PMU pin retention groups registers for Exynos5433 (without audio & fsys) */
+static const u32 exynos5433_retention_regs[] = {
+	EXYNOS5433_PAD_RETENTION_TOP_OPTION,
+	EXYNOS5433_PAD_RETENTION_UART_OPTION,
+	EXYNOS5433_PAD_RETENTION_EBIA_OPTION,
+	EXYNOS5433_PAD_RETENTION_EBIB_OPTION,
+	EXYNOS5433_PAD_RETENTION_SPI_OPTION,
+	EXYNOS5433_PAD_RETENTION_MIF_OPTION,
+	EXYNOS5433_PAD_RETENTION_USBXTI_OPTION,
+	EXYNOS5433_PAD_RETENTION_BOOTLDO_OPTION,
+	EXYNOS5433_PAD_RETENTION_UFS_OPTION,
+	EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION,
+};
+
+static const struct samsung_retention_data exynos5433_retention_data __initconst = {
+	.regs	 = exynos5433_retention_regs,
+	.nr_regs = ARRAY_SIZE(exynos5433_retention_regs),
+	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
+	.refcnt	 = &exynos_shared_retention_refcnt,
+	.init	 = exynos_retention_init,
+};
+
+/* PMU retention control for audio pins can be tied to audio pin bank */
+static const u32 exynos5433_audio_retention_regs[] = {
+	EXYNOS5433_PAD_RETENTION_AUD_OPTION,
+};
+
+static const struct samsung_retention_data exynos5433_audio_retention_data __initconst = {
+	.regs	 = exynos5433_audio_retention_regs,
+	.nr_regs = ARRAY_SIZE(exynos5433_audio_retention_regs),
+	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
+	.init	 = exynos_retention_init,
+};
+
+/* PMU retention control for mmc pins can be tied to fsys pin bank */
+static const u32 exynos5433_fsys_retention_regs[] = {
+	EXYNOS5433_PAD_RETENTION_MMC0_OPTION,
+	EXYNOS5433_PAD_RETENTION_MMC1_OPTION,
+	EXYNOS5433_PAD_RETENTION_MMC2_OPTION,
+};
+
+static const struct samsung_retention_data exynos5433_fsys_retention_data __initconst = {
+	.regs	 = exynos5433_fsys_retention_regs,
+	.nr_regs = ARRAY_SIZE(exynos5433_fsys_retention_regs),
+	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
+	.init	 = exynos_retention_init,
+};
+
 /*
  * Samsung pinctrl driver data for Exynos5433 SoC. Exynos5433 SoC includes
  * ten gpio/pin-mux/pinconfig controllers.
@@ -1564,6 +1612,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
 		.nr_ext_resources = 1,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 1 data */
 		.pin_banks	= exynos5433_pin_banks1,
@@ -1571,6 +1620,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_audio_retention_data,
 	}, {
 		/* pin-controller instance 2 data */
 		.pin_banks	= exynos5433_pin_banks2,
@@ -1578,6 +1628,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 3 data */
 		.pin_banks	= exynos5433_pin_banks3,
@@ -1585,6 +1636,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 4 data */
 		.pin_banks	= exynos5433_pin_banks4,
@@ -1592,6 +1644,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 5 data */
 		.pin_banks	= exynos5433_pin_banks5,
@@ -1599,6 +1652,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_fsys_retention_data,
 	}, {
 		/* pin-controller instance 6 data */
 		.pin_banks	= exynos5433_pin_banks6,
@@ -1606,6 +1660,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 7 data */
 		.pin_banks	= exynos5433_pin_banks7,
@@ -1613,6 +1668,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 8 data */
 		.pin_banks	= exynos5433_pin_banks8,
@@ -1620,6 +1676,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	}, {
 		/* pin-controller instance 9 data */
 		.pin_banks	= exynos5433_pin_banks9,
@@ -1627,6 +1684,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
+		.retention_data	= &exynos5433_retention_data,
 	},
 };
 
-- 
1.9.1
