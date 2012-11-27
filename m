From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] arm: exynos5: Add HS-I2C device tree platform information
Date: Tue, 27 Nov 2012 18:30:36 +0530
Message-ID: <1354021236-28596-4-git-send-email-ch.naveen@samsung.com>
References: <1354021236-28596-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1354021236-28596-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds HS-I2C device tree platform information in
exynos5.dtsi and exynos5-smdk5250.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   32 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index fc37e19..4e22b84 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -161,6 +161,22 @@
 		};
 	};
 
+	hsi2c@12C50000 {
+		status = "disabled";
+	};
+
+	hsi2c@12D00000 {
+		status = "disabled";
+	};
+
+	hsi2c@12D50000 {
+		status = "disabled";
+	};
+
+	hsi2c@12DE0000 {
+		status = "disabled";
+	};
+
 	dwmmc_0: dwmmc0@12200000 {
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a42b02b0..276ecb3 100755
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -182,6 +182,38 @@
 		#size-cells = <0>;
 	};
 
+	hsi2c@12C50000 {
+		compatible = "samsung,exynos5-hs-i2c";
+		reg = <0x12C50000 0x1000>;
+		interrupts = <0 56 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12D00000 {
+		compatible = "samsung,exynos5-hs-i2c";
+		reg = <0x12D00000 0x1000>;
+		interrupts = <0 57 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12D50000 {
+		compatible = "samsung,exynos5-hs-i2c";
+		reg = <0x12D50000 0x1000>;
+		interrupts = <0 58 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	hsi2c@12DE0000 {
+		compatible = "samsung,exynos5-hs-i2c";
+		reg = <0x12DE0000 0x1000>;
+		interrupts = <0 59 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d20000 0x100>;
-- 
1.7.9.5
