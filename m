From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 01/17] pinctrl: dt-bindings: samsung: Add header with values used for configuration
Date: Sun,  4 Sep 2016 13:04:04 +0200
Message-ID: <1472987060-28293-2-git-send-email-krzk@kernel.org>
References: <1472987060-28293-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:60064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752937AbcIDLEw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Sep 2016 07:04:52 -0400
In-Reply-To: <1472987060-28293-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, javier@osg.samsung.com, Linus Walleij <linus.walleij@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hard-coded pinctrl configuration values are scattered through DTS files.
The numbers are difficult to decode by human, especially without the
datasheet.  Additionally the drive strength differs between S3C64xx,
S5PV210 and Exynos SoC families increasing the confusion.

The header will help making this more readable and maintainable.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v2:
1. Rename double-include protection (suggested by Bartlomiej).
2. Squash here:
   pinctrl: dt-bindings: samsung: Add macros for S3C64xx pin configuration
   http://www.spinics.net/lists/arm-kernel/msg528016.html
3. Add Javier's reviewed-by.
4. Extend MAINTAINERS entry with bindings documentation
---
 MAINTAINERS                           |  2 ++
 include/dt-bindings/pinctrl/samsung.h | 57 +++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/samsung.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d8e81b1dde30..be3dcca8439a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9318,6 +9318,8 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/pinctrl/samsung/
+F:	include/dt-bindings/pinctrl/samsung.h
+F:	Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
 
 PIN CONTROLLER - SINGLE
 M:	Tony Lindgren <tony@atomide.com>
diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
new file mode 100644
index 000000000000..6276eb785e2b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -0,0 +1,57 @@
+/*
+ * Samsung's Exynos pinctrl bindings
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Author: Krzysztof Kozlowski <krzk@kernel.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
+#define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
+
+#define EXYNOS_PIN_PULL_NONE		0
+#define EXYNOS_PIN_PULL_DOWN		1
+#define EXYNOS_PIN_PULL_UP		3
+
+#define S3C64XX_PIN_PULL_NONE		0
+#define S3C64XX_PIN_PULL_DOWN		1
+#define S3C64XX_PIN_PULL_UP		2
+
+/* Pin function in power down mode */
+#define EXYNOS_PIN_PDN_OUT0		0
+#define EXYNOS_PIN_PDN_OUT1		1
+#define EXYNOS_PIN_PDN_INPUT		2
+#define EXYNOS_PIN_PDN_PREV		3
+
+/* Drive strengths for Exynos3250, Exynos4 (all) and Exynos5250 */
+#define EXYNOS4_PIN_DRV_LV1		0
+#define EXYNOS4_PIN_DRV_LV2		2
+#define EXYNOS4_PIN_DRV_LV3		1
+#define EXYNOS4_PIN_DRV_LV4		3
+
+/* Drive strengths for Exynos5260 */
+#define EXYNOS5260_PIN_DRV_LV1		0
+#define EXYNOS5260_PIN_DRV_LV2		1
+#define EXYNOS5260_PIN_DRV_LV4		2
+#define EXYNOS5260_PIN_DRV_LV6		3
+
+/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+#define EXYNOS5420_PIN_DRV_LV1		0
+#define EXYNOS5420_PIN_DRV_LV2		1
+#define EXYNOS5420_PIN_DRV_LV3		2
+#define EXYNOS5420_PIN_DRV_LV4		3
+
+#define EXYNOS_PIN_FUNC_INPUT		0
+#define EXYNOS_PIN_FUNC_OUTPUT		1
+#define EXYNOS_PIN_FUNC_2		2
+#define EXYNOS_PIN_FUNC_3		3
+#define EXYNOS_PIN_FUNC_4		4
+#define EXYNOS_PIN_FUNC_5		5
+#define EXYNOS_PIN_FUNC_6		6
+#define EXYNOS_PIN_FUNC_F		0xf
+
+#endif /* __DT_BINDINGS_PINCTRL_SAMSUNG_H__ */
-- 
2.7.4
