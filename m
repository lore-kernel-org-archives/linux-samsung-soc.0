From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC 1/2] ARM: dts: exynos: update the usbdrd phy and ref clk
Date: Fri,  6 Oct 2017 04:36:34 +0000
Message-ID: <1507264595-3565-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37409 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdJFEgo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 00:36:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Anand Moon <linux.amoon@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

update the usbdrd link control and phy contol clks.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Tested on Odroid XU4 and Odroid HC1 develpment board.
Did not test Odroid XU develpment board.
---
 arch/arm/boot/dts/exynos5410.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 7eab4bc..5af9f4b 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -385,7 +385,7 @@
 };
 
 &usbdrd_phy0 {
-	clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+	clocks = <&clock CLK_SCLK_USBPHY300>, <&clock CLK_SCLK_USBD300>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
@@ -400,7 +400,7 @@
 };
 
 &usbdrd_phy1 {
-	clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
+	clocks = <&clock CLK_SCLK_USBPHY301>, <&clock CLK_SCLK_USBD301>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 88e5d6d..36d26ab 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1461,7 +1461,7 @@
 };
 
 &usbdrd_phy0 {
-	clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+	clocks = <&clock CLK_SCLK_USBPHY300>, <&clock CLK_SCLK_USBD300>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
@@ -1476,7 +1476,7 @@
 };
 
 &usbdrd_phy1 {
-	clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
+	clocks = <&clock CLK_SCLK_USBPHY301>, <&clock CLK_SCLK_USBD301>;
 	clock-names = "phy", "ref";
 	samsung,pmu-syscon = <&pmu_system_controller>;
 };
-- 
2.7.4
