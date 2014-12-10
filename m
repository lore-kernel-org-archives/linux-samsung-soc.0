From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH V3 2/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Wed, 10 Dec 2014 14:09:40 +0530
Message-ID: <1418200780-22363-2-git-send-email-gautam.vivek@samsung.com>
References: <1418200780-22363-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1418200780-22363-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, kgene@kernel.org, alim.akhtar@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

USB and Power regulator on Exynos7 require gpios available
in BUS1 pin controller block.
So adding the BUS1 pinctrl support.

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---

Changes since V2:
 - Added documentation on alias for BUS1 pin controller block.

Changes since V1:
 - Added support for all pin banks which are part of BUS1 pin controller.

 .../devicetree/bindings/pinctrl/samsung-pinctrl.txt |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c            |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 742e472..c88ba35 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -180,6 +180,7 @@ Aliases for controllers compatible with "samsung,exynos7-pinctrl":
 - pinctrl5: pin controller of ESE block,
 - pinctrl6: pin controller of FSYS0 block,
 - pinctrl7: pin controller of FSYS1 block,
+- pinctrl8: pin controller of BUS1 block,
 
 Example: A pin-controller node with pin banks:
 
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
