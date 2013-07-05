From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] of/documentation: Fix a typo in exynos5250-clock.txt
Date: Fri,  5 Jul 2013 13:48:01 +0530
Message-ID: <1373012281-26433-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:42229 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753718Ab3GEIdy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 04:33:54 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so1810745pdj.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 01:33:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: mturquette@linaro.org, grant.likely@linaro.org, rob@landley.net, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The clocks should be numbered sequentially as they are represented as
enum values in the clock driver.

Typo introduced by commit 17d4caccef ("clk: exynos5250: register
display block gate clocks to common clock framework")

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 781a627..1a05761 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -154,7 +154,7 @@ clock which they consume.
   dsim0			341
   dp			342
   mixer			343
-  hdmi			345
+  hdmi			344
 
 Example 1: An example of a clock controller node is listed below.
 
-- 
1.7.9.5
