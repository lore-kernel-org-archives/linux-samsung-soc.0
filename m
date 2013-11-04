From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 2/3] ARM: dts: exynos4212: Add missing clock for multi core
 timer
Date: Mon, 04 Nov 2013 10:56:00 +0900
Message-ID: <1383530161-24080-3-git-send-email-cw00.choi@samsung.com>
References: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12982 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280Ab3KDB4I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Nov 2013 20:56:08 -0500
In-reply-to: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Marek Szyprowski <m.szyprowski@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4212.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 3081bae..d7a3fbc 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -43,6 +43,8 @@
 		interrupt-parent = <&mct_map>;
 		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
 			     <4 0>, <5 0>;
+		clocks = <&clock 3>, <&clock 344>;
+		clock-names = "fin_pll", "mct";
 
 		mct_map: mct-map {
 			#interrupt-cells = <2>;
-- 
1.8.0
