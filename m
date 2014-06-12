From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: fix pwm-cells in pwm node
Date: Thu, 12 Jun 2014 17:23:12 +0900
Message-ID: <1402561392-21702-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40094 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754632AbaFLIXm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 04:23:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: myungjoo.ham@samsung.com, cw00.choi@samsung.com, Jaewon Kim <jaewon02.kim@samsung.com>

pwm-cells should be 3. Third cell is optional PWM flags.
And This flag supported by this binding is PWM_POLARITY_INVERTED

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8ece4b..b687e53 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -548,13 +548,13 @@
 		status = "disabled";
 	};
 
-	pwm@139D0000 {
+	pwm: pwm@139D0000 {
 		compatible = "samsung,exynos4210-pwm";
 		reg = <0x139D0000 0x1000>;
 		interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
 		clocks = <&clock CLK_PWM>;
 		clock-names = "timers";
-		#pwm-cells = <2>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
1.7.9.5
