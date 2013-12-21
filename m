From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Re-organize RTC status for 5250
Date: Sat, 21 Dec 2013 10:19:59 +0530
Message-ID: <1387601399-31991-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:51226 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753560Ab3LUExR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 23:53:17 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so3445792pad.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 20:53:17 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Some boards might not have RTC xtal, so RTC shouldn't really be
enabled by default. Enable it in the required board files. For
now enable it for all board files to maintain the enabled status
exisitng prior to this patch.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  |    4 ++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++++
 arch/arm/boot/dts/exynos5250-snow.dts     |    4 ++++
 arch/arm/boot/dts/exynos5250.dtsi         |    2 +-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index b42e658..56c4078 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -25,6 +25,10 @@
 		bootargs = "console=ttySAC2,115200";
 	};
 
+	rtc@101E0000 {
+		status = "okay";
+	};
+
 	codec@11000000 {
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 3e69837..0837dd8 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -27,6 +27,10 @@
 		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
 	};
 
+	rtc@101E0000 {
+		status = "okay";
+	};
+
 	i2c@12C60000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 7e45eea..b13bf49 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -20,6 +20,10 @@
 		i2c104 = &i2c_104;
 	};
 
+	rtc@101E0000 {
+		status = "okay";
+	};
+
 	pinctrl@11400000 {
 		sd3_clk: sd3-clk {
 			samsung,pin-drv = <0>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index c341e55..077e531 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -190,7 +190,7 @@
 	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
-		status = "okay";
+		status = "disabled";
 	};
 
 	tmu@10060000 {
-- 
1.7.9.5
