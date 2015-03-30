From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Mon, 30 Mar 2015 17:51:01 +0200
Message-ID: <551970E5.3000308@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:40245 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752347AbbC3PvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:51:04 -0400
Received: from [192.168.34.101] (reichl-x64.fritz.box [192.168.34.101])
	(authenticated bits=0)
	by linuxbbg.five-lan.de (8.14.9/8.14.5/SuSE Linux 0.8) with ESMTP id t2UFp1Dq006128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 17:51:01 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

HS400 timing values are added for exynos5422-odroidxu3 board.
---
This patch is analog to [0].
This patch needs [0] for the pin-ctrl definition of sd0_rclk.

[0]: https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/msg42902.html

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index a519c86..0408ec0 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -298,15 +298,20 @@
 
 &mmc_0 {
 	status = "okay";
+	num-slots = <1>;
 	broken-cd;
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+	samsung,read-strobe-delay = <90>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_rclk>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 };
 
 &mmc_2 {
-- 
1.9.1
