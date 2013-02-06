From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/7] ARM: dts: Add G2D node to SMDK4412
Date: Wed,  6 Feb 2013 17:21:15 +0530
Message-ID: <1360151477-26460-6-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:58379 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMBI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:01:08 -0500
Received: by mail-da0-f42.google.com with SMTP id z17so623938dal.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:01:08 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added G2D DT node to SMDK4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
This patch is added on top of below patch:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg15148.html
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 6ae4276..bba53a8 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -27,6 +27,10 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
 	};
 
+	g2d@10800000 {
+		status = "okay";
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
-- 
1.7.4.1
