From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] MAINTAINERS: Add myself as SAMSUNG SOC CLOCK DRIVERS
Date: Thu, 18 Aug 2016 21:47:19 +0900
Message-ID: <1471524439-8115-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60707 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429AbcHRMsJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Aug 2016 08:48:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, k.kozlowski@samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, chanwoo@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

Add the myself to the entry of SAMSUNG SOC CLOCK DRIVERS to review
and test the patches as supporter. I will help them. I can access the all
datasheet of Exynos SoC and test it on Exynos-based board. I was implemented
the exynos4415/5433 clock driver as author and handled the exynos3250 clock
driver. Lastly, adding the missing information of the exynos clock drivers.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bb1d00098c..442d6f5c65be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10233,9 +10233,12 @@ F:	drivers/nfc/s3fwrn5
 SAMSUNG SOC CLOCK DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Tomasz Figa <tomasz.figa@gmail.com>
+M:	Chanwoo Choi <cw00.choi@samsung.com>
 S:	Supported
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 F:	drivers/clk/samsung/
+F:	include/dt-bindings/clock/exynos*.h
+F:	Documentation/devicetree/bindings/clock/exynos*.txt
 
 SAMSUNG SXGBE DRIVERS
 M:	Byungho An <bh74.an@samsung.com>
-- 
1.9.1
