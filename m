From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 4/5] ARM: dts: exynos5250-arndale: Add MFC codec support
Date: Thu,  7 Feb 2013 10:45:28 +0530
Message-ID: <1360214129-4096-4-git-send-email-tushar.behera@linaro.org>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:48977 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab3BGFZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 00:25:04 -0500
Received: by mail-pa0-f50.google.com with SMTP id fa11so1217245pad.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 21:25:04 -0800 (PST)
In-Reply-To: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

Added MFC codec node to Arndale DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d018fd2..6162a72 100644
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
 		status = "okay";
 		samsung,i2c-sda-delay = <100>;
-- 
1.7.4.1
