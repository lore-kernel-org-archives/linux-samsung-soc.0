From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: Switch to kernel.org account for Krzysztof Kozlowski
Date: Mon, 15 Aug 2016 19:17:49 +0200
Message-ID: <1471281469-5847-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53576 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752856AbcHORSF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 13:18:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>

Change my email address to kernel.org account instead of Samsung one.
Also switch Maxim MUIC charger drivers from supported to maintained
mode.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

---

Affected drivers/subsystems:
1. arch/arm,
2. mfd,
3. power,
4. regulator,
5. clk,
6. rtc,
7. extcon,
8. pinctrl,
9. sound/soc,

However if there are no objections, I can push it through my tree (to
arm-soc folks).
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 45c98485c3f0..d437e0123bac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,7 +1623,7 @@ N:	rockchip
 
 ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
 M:	Kukjin Kim <kgene@kernel.org>
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 S:	Maintained
@@ -7465,9 +7465,9 @@ F:	Documentation/devicetree/bindings/sound/max9860.txt
 F:	sound/soc/codecs/max9860.*
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
-S:	Supported
+S:	Maintained
 F:	drivers/power/supply/max14577_charger.c
 F:	drivers/power/supply/max77693_charger.c
 
@@ -7481,7 +7481,7 @@ F:	include/dt-bindings/*/*max77802.h
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/*/max14577*.c
@@ -9258,7 +9258,7 @@ F:	drivers/pinctrl/sh-pfc/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
@@ -10189,7 +10189,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG AUDIO (ASoC) DRIVERS
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sangbeom Kim <sbkim73@samsung.com>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
@@ -10204,7 +10204,7 @@ F:	drivers/video/fbdev/s3c-fb.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Sangbeom Kim <sbkim73@samsung.com>
-M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
-- 
2.7.4
