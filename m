From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/5] clk/exynos5250: Fix HDMI clock number in documentation
Date: Mon, 10 Jun 2013 16:30:58 +0530
Message-ID: <1370862062-16680-2-git-send-email-rahul.sharma@samsung.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27622 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753149Ab3FJKjW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 06:39:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO600KXIAXKIA50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Jun 2013 19:39:20 +0900 (KST)
In-reply-to: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Arun Kumar K <arun.kk@samsung.com>

This patch corrects the HDMI clock number given wrongly
in the documentation.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
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
