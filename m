From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] MAINTAINERS: Extend Samsung MFD drivers entry and add myself
Date: Wed, 06 May 2015 14:19:36 +0900
Message-ID: <1430889576-7779-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11775 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752537AbbEFFUP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 01:20:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

Extend the entry for Samsung MFD drivers for PMIC devices (Power
Management Integrated Circuit) with bindings documentation, clock
(clk-s2mps11.c) and RTC drivers (rtc-s5m.c).

These PMIC devices are used on many Exynos-based boards like Arndale
Octa (S2MPS11), Gear 2 (S2MPS14).

Add myself as a supporter for reviewing them.
I am not the author of these drivers. However I have recently
contributed to most of them and I have access to datasheets and hardware.

Cc: Sangbeom Kim <sbkim73@samsung.com>
CC: Mike Turquette <mturquette@linaro.org>
CC: Stephen Boyd <sboyd@codeaurora.org>
CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>
CC: Lee Jones <lee.jones@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e278814388f7..fc01dc9f96af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8533,14 +8533,20 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/video/fbdev/s3c-fb.c
 
-SAMSUNG MULTIFUNCTION DEVICE DRIVERS
+SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Sangbeom Kim <sbkim73@samsung.com>
+M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
 L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	drivers/mfd/sec*.c
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
+F:	drivers/clk/clk-s2mps11.c
+F:	drivers/rtc/rtc-s5m.c
 F:	include/linux/mfd/samsung/
+F:	Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+F:	Documentation/devicetree/bindings/mfd/s2mp*.txt
 
 SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-- 
1.9.1
