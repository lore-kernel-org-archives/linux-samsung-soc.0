From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH] ARM : dts : Added clock definition for MFC as per Common clock
 framework
Date: Tue, 26 Mar 2013 10:35:36 +0530
Message-ID: <1364274336-31275-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35569 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583Ab3CZE7G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 00:59:06 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK9009AL4GZKOJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Mar 2013 13:59:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

From: Prasanna Kumar <prasanna.ps@samsung.com>

According to Common clock framework, clock definition is added
for exynos5250

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 24c52e6..652a63e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -128,6 +128,8 @@
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 266>;
+		clock-names = "mfc";
 	};
 
 	rtc {
-- 
1.7.5.4
