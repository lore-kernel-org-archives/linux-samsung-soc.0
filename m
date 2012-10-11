From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 09/15] pinctrl: samsung: Include bank-specific eint offset in
 bank struct
Date: Thu, 11 Oct 2012 10:11:15 +0200
Message-ID: <1349943081-27939-10-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12530 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932486Ab2JKIMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:12:14 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP005P8YRAMOI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:14 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:14 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

Some SoCs, like Exynos4x12, have non-sequential layout of EINT control
registers and so current way of calculating register addresses does not
work correctly for them.

This patch adds eint_offset field to samsung_pin_bank struct and
modifies the driver to use it instead of calculating the offsets from
bank index.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c  | 55 +++++++++++++++++++--------------------
 drivers/pinctrl/pinctrl-exynos.h  |  3 ++-
 drivers/pinctrl/pinctrl-samsung.h |  1 +
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 0ea2164..bd9f130 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -146,7 +146,7 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 	struct samsung_pin_bank *bank = d->ctrl->pin_banks;
 	struct exynos_geint_data *eint_data;
 	unsigned int nr_banks = d->ctrl->nr_banks, idx;
-	unsigned int irq_base = 0, eint_offset = 0;
+	unsigned int irq_base = 0;
 
 	if (hw >= d->ctrl->nr_gint) {
 		dev_err(d->dev, "unsupported ext-gpio interrupt\n");
@@ -159,7 +159,6 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 		if ((hw >= irq_base) && (hw < (irq_base + bank->nr_pins)))
 			break;
 		irq_base += bank->nr_pins;
-		eint_offset += 4;
 	}
 
 	if (idx == nr_banks) {
@@ -175,7 +174,7 @@ static struct exynos_geint_data *exynos_get_eint_data(irq_hw_number_t hw,
 
 	eint_data->bank	= bank;
 	eint_data->pin = hw - irq_base;
-	eint_data->eint_offset = eint_offset;
+	eint_data->eint_offset = bank->eint_offset;
 	return eint_data;
 }
 
@@ -484,35 +483,35 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 /* pin banks of exynos4210 pin-controller 0 */
 static struct samsung_pin_bank exynos4210_pin_banks0[] = {
-	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0"),
-	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpb"),
-	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpc0"),
-	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpc1"),
-	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpd0"),
-	EXYNOS_PIN_BANK_EINTG(4, 0x0C0, "gpd1"),
-	EXYNOS_PIN_BANK_EINTG(5, 0x0E0, "gpe0"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe1"),
-	EXYNOS_PIN_BANK_EINTG(6, 0x120, "gpe2"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe3"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x160, "gpe4"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpf0"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x1A0, "gpf1"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x1C0, "gpf2"),
-	EXYNOS_PIN_BANK_EINTG(6, 0x1E0, "gpf3"),
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpb", 0x08),
+	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpc0", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpc1", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0C0, "gpd1", 0x18),
+	EXYNOS_PIN_BANK_EINTG(5, 0x0E0, "gpe0", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe1", 0x20),
+	EXYNOS_PIN_BANK_EINTG(6, 0x120, "gpe2", 0x24),
+	EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe3", 0x28),
+	EXYNOS_PIN_BANK_EINTG(8, 0x160, "gpe4", 0x2c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpf0", 0x30),
+	EXYNOS_PIN_BANK_EINTG(8, 0x1A0, "gpf1", 0x34),
+	EXYNOS_PIN_BANK_EINTG(8, 0x1C0, "gpf2", 0x38),
+	EXYNOS_PIN_BANK_EINTG(6, 0x1E0, "gpf3", 0x3c),
 };
 
 /* pin banks of exynos4210 pin-controller 1 */
 static struct samsung_pin_bank exynos4210_pin_banks1[] = {
-	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj0"),
-	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpj1"),
-	EXYNOS_PIN_BANK_EINTG(7, 0x040, "gpk0"),
-	EXYNOS_PIN_BANK_EINTG(7, 0x060, "gpk1"),
-	EXYNOS_PIN_BANK_EINTG(7, 0x080, "gpk2"),
-	EXYNOS_PIN_BANK_EINTG(7, 0x0A0, "gpk3"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpl0"),
-	EXYNOS_PIN_BANK_EINTG(3, 0x0E0, "gpl1"),
-	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpl2"),
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpj1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(7, 0x040, "gpk0", 0x08),
+	EXYNOS_PIN_BANK_EINTG(7, 0x060, "gpk1", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(7, 0x080, "gpk2", 0x10),
+	EXYNOS_PIN_BANK_EINTG(7, 0x0A0, "gpk3", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpl0", 0x18),
+	EXYNOS_PIN_BANK_EINTG(3, 0x0E0, "gpl1", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpl2", 0x20),
 	EXYNOS_PIN_BANK_EINTN(6, 0x120, "gpy0"),
 	EXYNOS_PIN_BANK_EINTN(4, 0x140, "gpy1"),
 	EXYNOS_PIN_BANK_EINTN(6, 0x160, "gpy2"),
diff --git a/drivers/pinctrl/pinctrl-exynos.h b/drivers/pinctrl/pinctrl-exynos.h
index 2de4a29..5d8e380 100644
--- a/drivers/pinctrl/pinctrl-exynos.h
+++ b/drivers/pinctrl/pinctrl-exynos.h
@@ -59,7 +59,7 @@
 		.name		= id			\
 	}
 
-#define EXYNOS_PIN_BANK_EINTG(pins, reg, id)		\
+#define EXYNOS_PIN_BANK_EINTG(pins, reg, id, offs)	\
 	{						\
 		.pctl_offset	= reg,			\
 		.nr_pins	= pins,			\
@@ -69,6 +69,7 @@
 		.conpdn_width	= 2,			\
 		.pudpdn_width	= 2,			\
 		.eint_type	= EINT_TYPE_GPIO,	\
+		.eint_offset	= offs,			\
 		.name		= id			\
 	}
 
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index ea5dadd..d77d9bc 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -124,6 +124,7 @@ struct samsung_pin_bank {
 	u8		conpdn_width;
 	u8		pudpdn_width;
 	enum eint_type	eint_type;
+	u32		eint_offset;
 	u32		irq_base;
 	char		*name;
 	struct device_node *of_node;
-- 
1.7.12
