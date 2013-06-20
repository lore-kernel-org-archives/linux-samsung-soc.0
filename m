From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 2/5] ARM: dts: Remove unsused MFC clock from exynos4
Date: Thu, 20 Jun 2013 12:23:39 +0530
Message-ID: <1371711222-9232-3-git-send-email-arun.kk@samsung.com>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13130 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab3FTGaE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:30:04 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00CBBI23GQ00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 15:30:03 +0900 (KST)
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com

Removes the unused sclk_mfc from exynos4 dtsi file.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3f94fe8..0f213a3 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -160,8 +160,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
-		clocks = <&clock 170>, <&clock 273>;
-		clock-names = "sclk_mfc", "mfc";
+		clocks = <&clock 273>;
+		clock-names = "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
