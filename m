From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH V3 15/15] ARM: dts: Fix I2S1, I2S2 compatible for exynos4 SoCs
Date: Wed, 14 Jan 2015 19:42:42 +0100
Message-ID: <1421260962-16892-16-git-send-email-s.nawrocki@samsung.com>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39838 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754200AbbANSoL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 13:44:11 -0500
In-reply-to: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene@kernel.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable@vger.kernel.org

I2S1, I2S2 on Exynos4 SoC series have limited functionality compared
to I2S0, "samsung,s3c6410-i2s" compatible should be used for them.

Cc: stable@vger.kernel.org
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 0cffe39..cb60010 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -371,7 +371,7 @@
 	};
 
 	i2s1: i2s@13960000 {
-		compatible = "samsung,s5pv210-i2s";
+		compatible = "samsung,s3c6410-i2s";
 		reg = <0x13960000 0x100>;
 		clocks = <&clock CLK_I2S1>;
 		clock-names = "iis";
@@ -384,7 +384,7 @@
 	};
 
 	i2s2: i2s@13970000 {
-		compatible = "samsung,s5pv210-i2s";
+		compatible = "samsung,s3c6410-i2s";
 		reg = <0x13970000 0x100>;
 		clocks = <&clock CLK_I2S2>;
 		clock-names = "iis";
-- 
1.7.9.5
