From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 2/3] pinctrl: exynos: add exynos5420 SoC specific data
Date: Wed, 12 Jun 2013 20:21:27 +0530
Message-ID: <1371048688-9089-3-git-send-email-l.krishna@samsung.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36065 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753106Ab3FLO33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 10:29:29 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOA001BBAX3LF90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jun 2013 23:29:27 +0900 (KST)
In-reply-to: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com

Add Samsung Exynos5420 SoC specific data to enable pinctrl support for
all platforms based on Exynos5420.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 drivers/pinctrl/pinctrl-exynos.c                   |  115 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-samsung.c                  |    2 +
 drivers/pinctrl/pinctrl-samsung.h                  |    1 +
 4 files changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index b2bc219..fe949c7 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -15,6 +15,7 @@ Required Properties:
   - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-controller.
   - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-controller.
   - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-controller.
+  - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 2d76f66..753a8cd 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -941,3 +941,118 @@ struct samsung_pin_ctrl exynos5250_pin_ctrl[] = {
 		.label		= "exynos5250-gpio-ctrl3",
 	},
 };
+
+/* pin banks of exynos5420 pin-controller 0 */
+static struct samsung_pin_bank exynos5420_pin_banks0[] = {
+	EXYNOS_PIN_BANK_EINTN(8, 0x000, "gpy7"),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC00, "gpx0", 0x00),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC20, "gpx1", 0x04),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC40, "gpx2", 0x08),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC60, "gpx3", 0x0c),
+};
+
+/* pin banks of exynos5420 pin-controller 1 */
+static struct samsung_pin_bank exynos5420_pin_banks1[] = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpc0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpc1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(7, 0x040, "gpc2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(4, 0x060, "gpc3", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(2, 0x080, "gpc4", 0x10),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpd1", 0x14),
+	EXYNOS_PIN_BANK_EINTN(6, 0x0C0, "gpy0"),
+	EXYNOS_PIN_BANK_EINTN(4, 0x0E0, "gpy1"),
+	EXYNOS_PIN_BANK_EINTN(6, 0x100, "gpy2"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x120, "gpy3"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x140, "gpy4"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x160, "gpy5"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x180, "gpy6"),
+};
+
+/* pin banks of exynos5420 pin-controller 2 */
+static struct samsung_pin_bank exynos5420_pin_banks2[] = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(2, 0x020, "gpe1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(6, 0x040, "gpf0", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpf1", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
+	EXYNOS_PIN_BANK_EINTG(2, 0x0C0, "gpg2", 0x18),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0E0, "gpj4", 0x1c),
+};
+
+/* pin banks of exynos5420 pin-controller 3 */
+static struct samsung_pin_bank exynos5420_pin_banks3[] = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpa2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpb0", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpb1", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpb2", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpb3", 0x18),
+	EXYNOS_PIN_BANK_EINTG(2, 0x0E0, "gpb4", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gph0", 0x20),
+};
+
+/* pin banks of exynos5420 pin-controller 4 */
+static struct samsung_pin_bank exynos5420_pin_banks4[] = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpz", 0x00),
+};
+
+/*
+ * Samsung pinctrl driver data for Exynos5420 SoC. Exynos5420 SoC includes
+ * four gpio/pin-mux/pinconfig controllers.
+ */
+struct samsung_pin_ctrl exynos5420_pin_ctrl[] = {
+	{
+		/* pin-controller instance 0 data */
+		.pin_banks	= exynos5420_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos5420_pin_banks0),
+		.weint_con	= EXYNOS_WKUP_ECON_OFFSET,
+		.weint_mask	= EXYNOS_WKUP_EMASK_OFFSET,
+		.weint_pend	= EXYNOS_WKUP_EPEND_OFFSET,
+		.svc		= EXYNOS_SVC_OFFSET,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.label		= "exynos5420-gpio-ctrl0",
+	}, {
+		/* pin-controller instance 1 data */
+		.pin_banks	= exynos5420_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos5420_pin_banks1),
+		.geint_con	= EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	= EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	= EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		= EXYNOS_SVC_OFFSET,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos5420-gpio-ctrl1",
+	}, {
+		/* pin-controller instance 2 data */
+		.pin_banks	= exynos5420_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos5420_pin_banks2),
+		.geint_con	= EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	= EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	= EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		= EXYNOS_SVC_OFFSET,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos5420-gpio-ctrl2",
+	}, {
+		/* pin-controller instance 3 data */
+		.pin_banks	= exynos5420_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos5420_pin_banks3),
+		.geint_con	= EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	= EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	= EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		= EXYNOS_SVC_OFFSET,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos5420-gpio-ctrl3",
+	}, {
+		/* pin-controller instance 4 data */
+		.pin_banks	= exynos5420_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos5420_pin_banks4),
+		.geint_con	= EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	= EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	= EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		= EXYNOS_SVC_OFFSET,
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos5420-gpio-ctrl4",
+	},
+};
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index e67ff1b..0a6c720 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -1113,6 +1113,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = (void *)exynos4x12_pin_ctrl },
 	{ .compatible = "samsung,exynos5250-pinctrl",
 		.data = (void *)exynos5250_pin_ctrl },
+	{ .compatible = "samsung,exynos5420-pinctrl",
+		.data = (void *)exynos5420_pin_ctrl },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-samsung.h b/drivers/pinctrl/pinctrl-samsung.h
index 79fcc20..954eeaf 100644
--- a/drivers/pinctrl/pinctrl-samsung.h
+++ b/drivers/pinctrl/pinctrl-samsung.h
@@ -259,5 +259,6 @@ extern struct samsung_pin_ctrl s3c2412_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2416_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2440_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2450_pin_ctrl[];
+extern struct samsung_pin_ctrl exynos5420_pin_ctrl[];
 
 #endif /* __PINCTRL_SAMSUNG_H */
-- 
1.7.10.4
