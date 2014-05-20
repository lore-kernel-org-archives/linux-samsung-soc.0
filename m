From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add mclk entry for Snow/Peach-pit boards
Date: Tue, 20 May 2014 10:19:15 +0530
Message-ID: <1400561355-9484-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:61325 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbaETEvU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 00:51:20 -0400
Received: by mail-pb0-f50.google.com with SMTP id ma3so6733725pbc.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 21:51:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com

On Snow/Peach-pit boards, XCLKOUT provides master clock (mclk) to codec.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Dependency:
1. Driver side changes have been posted here.
https://lkml.org/lkml/2014/5/20/4

2. XCLKOUT clock driver support
https://lkml.org/lkml/2014/5/15/530

 arch/arm/boot/dts/exynos5250-snow.dts      |    3 +++
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 67391b9..1014ce0 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -346,6 +346,9 @@
 
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98095>;
+
+		clocks = <&pmu_system_controller>;
+		clock-names = "mclk";
 	};
 
 	usb@12110000 {
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index f4b2a16..c0664e9 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -64,6 +64,9 @@
 
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98090>;
+
+		clocks = <&pmu_system_controller>;
+		clock-names = "mclk";
 	};
 };
 
-- 
1.7.9.5
