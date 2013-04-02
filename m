From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 6/7] ARM: dts: Add MFC codec support for Arndale board
Date: Tue,  2 Apr 2013 13:45:06 +0530
Message-ID: <1364890507-19261-7-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:41871 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760308Ab3DBI1L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:27:11 -0400
Received: by mail-pa0-f41.google.com with SMTP id kx1so170000pab.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:27:10 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Added MFC codec node to Arndale DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
No changes for V3

 arch/arm/boot/dts/exynos5250-arndale.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index e7fa72c..5910df7 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -24,6 +24,11 @@
 		bootargs = "console=ttySAC2,115200";
 	};
 
+	codec@11000000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
+
 	i2c@12C60000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
-- 
1.7.9.5
