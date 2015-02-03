From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [RESEND PATCH V3 15/15] ARM: dts: Fix I2S1,
 I2S2 compatible for exynos4 SoCs
Date: Tue, 03 Feb 2015 15:06:22 +0100
Message-ID: <1422972382-18520-3-git-send-email-s.nawrocki@samsung.com>
References: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
Sender: stable-owner@vger.kernel.org
To: broonie@kernel.org
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

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
