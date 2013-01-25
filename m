From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add sdhci node for exynos4412-smdk4412
Date: Fri, 25 Jan 2013 17:21:26 +0530
Message-ID: <1359114686-7871-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:33778 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753657Ab3AYMAU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 07:00:20 -0500
Received: by mail-pb0-f49.google.com with SMTP id xa12so177136pbc.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jan 2013 04:00:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added sdhci node for exynos4412-smdk4412.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index f05bf57..e885971 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -27,6 +27,13 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
 	};
 
+	sdhci@12530000 {
+		bus-width = <4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.4.1
