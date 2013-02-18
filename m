From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/7] ARM: dts: Add G2D node to SMDK4412
Date: Mon, 18 Feb 2013 10:32:11 +0530
Message-ID: <1361163733-4338-6-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:57190 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab3BRFM1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:27 -0500
Received: by mail-pa0-f46.google.com with SMTP id kp14so2579338pab.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:27 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

Added G2D DT node to SMDK4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
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
