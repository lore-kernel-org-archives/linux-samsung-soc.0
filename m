From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v2 3/5] pinctrl: exynos: Add initial driver data for Exynos7
Date: Tue, 23 Sep 2014 13:46:07 +0530
Message-ID: <1411460169-30536-4-git-send-email-a.kesavan@samsung.com>
References: <1411460169-30536-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40943 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753534AbaIWIQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 04:16:27 -0400
In-reply-to: <1411460169-30536-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>

This patch adds initial driver data for Exynos7 pinctrl support.

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Tested-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  113 ++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 4 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index f80519a..8425838 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -18,6 +18,7 @@ Required Properties:
   - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-controller.
   - "samsung,exynos5260-pinctrl": for Exynos5260 compatible pin-controller.
   - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
+  - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 7072bfa..25ca8e8 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1206,3 +1206,116 @@ struct samsung_pin_ctrl exynos5420_pin_ctrl[] = {
 		.label		= "exynos5420-gpio-ctrl4",
 	},
 };
+
+/* pin banks of exynos7 pin-controller - ALIVE */
+static struct samsung_pin_bank exynos7_pin_banks0[] = {
+	EXYNOS_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+};
+
+/* pin banks of exynos7 pin-controller - BUS0 */
+static struct samsung_pin_bank exynos7_pin_banks1[] = {
+	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpc0", 0x04),
+	EXYNOS_PIN_BANK_EINTG(2, 0x040, "gpc1", 0x08),
+	EXYNOS_PIN_BANK_EINTG(6, 0x060, "gpc2", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0a0, "gpd0", 0x14),
+	EXYNOS_PIN_BANK_EINTG(6, 0x0c0, "gpd1", 0x18),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpd2", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(5, 0x100, "gpd4", 0x20),
+	EXYNOS_PIN_BANK_EINTG(4, 0x120, "gpd5", 0x24),
+	EXYNOS_PIN_BANK_EINTG(6, 0x140, "gpd6", 0x28),
+	EXYNOS_PIN_BANK_EINTG(3, 0x160, "gpd7", 0x2c),
+	EXYNOS_PIN_BANK_EINTG(2, 0x180, "gpd8", 0x30),
+	EXYNOS_PIN_BANK_EINTG(2, 0x1a0, "gpg0", 0x34),
+	EXYNOS_PIN_BANK_EINTG(4, 0x1c0, "gpg3", 0x38),
+};
+
+/* pin banks of exynos7 pin-controller - NFC */
+static struct samsung_pin_bank exynos7_pin_banks2[] = {
+	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpj0", 0x00),
+};
+
+/* pin banks of exynos7 pin-controller - TOUCH */
+static struct samsung_pin_bank exynos7_pin_banks3[] = {
+	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpj1", 0x00),
+};
+
+/* pin banks of exynos7 pin-controller - FF */
+static struct samsung_pin_bank exynos7_pin_banks4[] = {
+	EXYNOS_PIN_BANK_EINTG(4, 0x000, "gpg4", 0x00),
+};
+
+/* pin banks of exynos7 pin-controller - ESE */
+static struct samsung_pin_bank exynos7_pin_banks5[] = {
+	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpv7", 0x00),
+};
+
+/* pin banks of exynos7 pin-controller - FSYS0 */
+static struct samsung_pin_bank exynos7_pin_banks6[] = {
+	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpr4", 0x00),
+};
+
+/* pin banks of exynos7 pin-controller - FSYS1 */
+static struct samsung_pin_bank exynos7_pin_banks7[] = {
+	EXYNOS_PIN_BANK_EINTG(4, 0x000, "gpr0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpr2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpr3", 0x0c),
+};
+
+struct samsung_pin_ctrl exynos7_pin_ctrl[] = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos7_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.label		= "exynos7-gpio-ctrl0",
+	}, {
+		/* pin-controller instance 1 BUS0 data */
+		.pin_banks	= exynos7_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl1",
+	}, {
+		/* pin-controller instance 2 NFC data */
+		.pin_banks	= exynos7_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl2",
+	}, {
+		/* pin-controller instance 3 TOUCH data */
+		.pin_banks	= exynos7_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl3",
+	}, {
+		/* pin-controller instance 4 FF data */
+		.pin_banks	= exynos7_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl4",
+	}, {
+		/* pin-controller instance 5 ESE data */
+		.pin_banks	= exynos7_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl5",
+	}, {
+		/* pin-controller instance 6 FSYS0 data */
+		.pin_banks	= exynos7_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl6",
+	}, {
+		/* pin-controller instance 7 FSYS1 data */
+		.pin_banks	= exynos7_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.label		= "exynos7-gpio-ctrl7",
+	},
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 4a47691..46efdbf 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1233,6 +1233,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = (void *)exynos5420_pin_ctrl },
 	{ .compatible = "samsung,s5pv210-pinctrl",
 		.data = (void *)s5pv210_pin_ctrl },
+	{ .compatible = "samsung,exynos7-pinctrl",
+		.data = (void *)exynos7_pin_ctrl },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 5cedc9d..f72a404 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -242,6 +242,7 @@ extern struct samsung_pin_ctrl exynos4x12_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5250_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5260_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5420_pin_ctrl[];
+extern struct samsung_pin_ctrl exynos7_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c64xx_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2412_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2416_pin_ctrl[];
-- 
1.7.9.5
