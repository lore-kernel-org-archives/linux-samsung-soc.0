From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: dts: exynos4412-odroidx: enable common hardware blocks
Date: Tue, 17 Jun 2014 11:25:31 +0200
Message-ID: <1402997133-13827-3-git-send-email-m.szyprowski@samsung.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38364 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755661AbaFQJZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 05:25:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7B000333IKGW60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jun 2014 10:25:32 +0100 (BST)
In-reply-to: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

This patch adds support for common hardware modules available on all
Exynos4412-based Odroid boards, which already have complete support in
mainline kernel. This includes secure firmware calls, watchdog, g2d and
fimc (mem2mem) multimedia accelerators.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 31db28a4bb33..fda9ac23dd55 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -22,6 +22,11 @@
 		reg = <0x40000000 0x40000000>;
 	};
 
+	firmware@0204F000 {
+		compatible = "samsung,secure-firmware";
+		reg = <0x0204F000 0x1000>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		led1 {
@@ -68,10 +73,40 @@
 		regulator-boot-on;
 	};
 
+	watchdog@10060000 {
+		status = "okay";
+	};
+
 	rtc@10070000 {
 		status = "okay";
 	};
 
+	g2d@10800000 {
+		status = "okay";
+	};
+
+	camera {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <>;
+
+		fimc_0: fimc@11800000 {
+			status = "okay";
+		};
+
+		fimc_1: fimc@11810000 {
+			status = "okay";
+		};
+
+		fimc_2: fimc@11820000 {
+			status = "okay";
+		};
+
+		fimc_3: fimc@11830000 {
+			status = "okay";
+		};
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-- 
1.9.2
