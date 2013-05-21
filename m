From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] clk: Exynos5250: Fix HDMI clock number in documentation
Date: Tue, 21 May 2013 16:46:24 +0530
Message-ID: <1369134984-16718-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59786 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316Ab3EUKwm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 06:52:42 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN5007NPA6JARS0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 May 2013 19:52:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, arunkk.samsung@gmail.com

This patch corrects the HDMI clock number given wrongly
in the documentation.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
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
1.7.10.4
