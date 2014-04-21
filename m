From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 1/9] drm/exynos: dp: support hotplug detection via GPIO
Date: Tue, 22 Apr 2014 04:09:10 +0530
Message-ID: <1398119958-32005-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16296 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754569AbaDUWjx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:39:53 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00FGRKAF8L20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:39:52 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Andrew Bresticker <abrestic@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Andrew Bresticker <abrestic@chromium.org>

Certain bridge chips use a GPIO to indicate the cable status instead
of the I_DP_HPD pin.  This adds an optional device-tree property,
"samsung,hpd-gpio", to the exynos-dp controller which indicates that
the specified GPIO should be used for hotplug detection.
The GPIO is then set up as an edge-triggered interrupt where the
rising edge indicates hotplug-in and the falling edge indicates hotplug-out.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Address reiew comments from Jingoo Han

 .../devicetree/bindings/video/exynos_dp.txt        |    4 ++
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   32 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
 drivers/gpu/drm/exynos/exynos_dp_reg.c             |   44 ++++++++++++++------
 4 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
index 57ccdde..53dbccf 100644
--- a/Documentation/devicetree/bindings/video/exynos_dp.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
@@ -62,6 +62,10 @@ Optional properties for dp-controller:
 	-hsync-active-high:
 		HSYNC polarity configuration.
 			High if defined, Low if not defined
+	-samsung,hpd-gpio:
+		Hotplug detect GPIO.
+			Indicates which GPIO should be used for hotplug
+			detection
 
 Example:
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 1cc3981..18fd9c5 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -18,6 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio.h>
 #include <linux/component.h>
 #include <linux/phy/phy.h>
 #include <video/of_display_timing.h>
@@ -1226,6 +1228,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct resource *res;
 	struct exynos_dp_device *dp;
+	unsigned int irq_flags;
 
 	int ret = 0;
 
@@ -1265,7 +1268,30 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(dp->reg_base))
 		return PTR_ERR(dp->reg_base);
 
-	dp->irq = platform_get_irq(pdev, 0);
+	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "samsung,hpd-gpio", 0);
+
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		/*
+		 * Set up the hotplug GPIO from the device tree as an interrupt.
+		 * Simply specifying a different interrupt in the device tree
+		 * doesn't work since we handle hotplug rather differently when
+		 * using a GPIO.  We also need the actual GPIO specifier so
+		 * that we can get the current state of the GPIO.
+		 */
+		ret = devm_gpio_request_one(&pdev->dev, dp->hpd_gpio, GPIOF_IN,
+					    "hpd_gpio");
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get hpd gpio\n");
+			return ret;
+		}
+		dp->irq = gpio_to_irq(dp->hpd_gpio);
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+	} else {
+		dp->hpd_gpio = -ENODEV;
+		dp->irq = platform_get_irq(pdev, 0);
+		irq_flags = 0;
+	}
+
 	if (dp->irq == -ENXIO) {
 		dev_err(&pdev->dev, "failed to get irq\n");
 		return -ENODEV;
@@ -1277,8 +1303,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	exynos_dp_init_dp(dp);
 
-	ret = devm_request_irq(&pdev->dev, dp->irq, exynos_dp_irq_handler, 0,
-				"exynos-dp", dp);
+	ret = devm_request_irq(&pdev->dev, dp->irq, exynos_dp_irq_handler,
+			irq_flags, "exynos-dp", dp);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq\n");
 		return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index d6a900d..56fa43e 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -159,6 +159,7 @@ struct exynos_dp_device {
 	struct work_struct	hotplug_work;
 	struct phy		*phy;
 	int			dpms_mode;
+	int			hpd_gpio;
 
 	struct exynos_drm_panel_info panel;
 };
diff --git a/drivers/gpu/drm/exynos/exynos_dp_reg.c b/drivers/gpu/drm/exynos/exynos_dp_reg.c
index b70da50..79291a2 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_reg.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_reg.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/gpio.h>
 
 #include "exynos_dp_core.h"
 #include "exynos_dp_reg.h"
@@ -326,6 +327,9 @@ void exynos_dp_clear_hotplug_interrupts(struct exynos_dp_device *dp)
 {
 	u32 reg;
 
+	if (gpio_is_valid(dp->hpd_gpio))
+		return;
+
 	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
 	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
 
@@ -337,6 +341,9 @@ void exynos_dp_init_hpd(struct exynos_dp_device *dp)
 {
 	u32 reg;
 
+	if (gpio_is_valid(dp->hpd_gpio))
+		return;
+
 	exynos_dp_clear_hotplug_interrupts(dp);
 
 	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
@@ -348,19 +355,27 @@ enum dp_irq_type exynos_dp_get_irq_type(struct exynos_dp_device *dp)
 {
 	u32 reg;
 
-	/* Parse hotplug interrupt status register */
-	reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		reg = gpio_get_value(dp->hpd_gpio);
+		if (reg)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
+		else
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
+	} else {
+		/* Parse hotplug interrupt status register */
+		reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
 
-	if (reg & PLUG)
-		return DP_IRQ_TYPE_HP_CABLE_IN;
+		if (reg & PLUG)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
 
-	if (reg & HPD_LOST)
-		return DP_IRQ_TYPE_HP_CABLE_OUT;
+		if (reg & HPD_LOST)
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
 
-	if (reg & HOTPLUG_CHG)
-		return DP_IRQ_TYPE_HP_CHANGE;
+		if (reg & HOTPLUG_CHG)
+			return DP_IRQ_TYPE_HP_CHANGE;
 
-	return DP_IRQ_TYPE_UNKNOWN;
+		return DP_IRQ_TYPE_UNKNOWN;
+	}
 }
 
 void exynos_dp_reset_aux(struct exynos_dp_device *dp)
@@ -402,9 +417,14 @@ int exynos_dp_get_plug_in_status(struct exynos_dp_device *dp)
 {
 	u32 reg;
 
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-	if (reg & HPD_STATUS)
-		return 0;
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		if (gpio_get_value(dp->hpd_gpio))
+			return 0;
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+		if (reg & HPD_STATUS)
+			return 0;
+	}
 
 	return -EINVAL;
 }
-- 
1.7.9.5
