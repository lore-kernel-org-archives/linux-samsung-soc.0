From: Vasanth Ananthan <vasanthananthan@gmail.com>
Subject: [PATCH] ARM: dts: map SATA controller port to SATA PHY controller
Date: Tue, 29 Jan 2013 13:36:50 +0530
Message-ID: <1359446810-26098-1-git-send-email-vasanthananthan@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:34792 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754472Ab3A2IHG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 03:07:06 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so102251dak.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 00:07:04 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, girish.shivananjappa@linaro.org, Vasanth Ananthan <vasanthananthan@gmail.com>, Vasanth Ananthan <vasanth.a@samsung.com>

Adding port nodes to the sata controller node, thus mapping
the ports in sata controller to the corresponding PHY controllers they
are connected to.

Signed-off-by: Vasanth Ananthan <vasanth.a@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   11 -----------
 arch/arm/boot/dts/exynos5250.dtsi         |   15 ++++++++++++---
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    4 ++--
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 942d576..49b89f6 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -51,17 +51,6 @@
 		};
 	};
 
-	i2c@121D0000 {
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <40000>;
-		samsung,i2c-slave-addr = <0x38>;
-
-		sata-phy {
-			compatible = "samsung,sata-phy";
-			reg = <0x38>;
-		};
-	};
-
 	sata@122F0000 {
 		samsung,sata-freq = <66>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3acf594..d33dc89 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -118,13 +118,14 @@
 	};
 
 	sata@122F0000 {
-		compatible = "samsung,exynos5-sata-ahci";
+		compatible = "samsung,exynos5250-ahci";
 		reg = <0x122F0000 0x1ff>;
 		interrupts = <0 115 0>;
+		samsung,exynos-sata-phy = <&phy0>;
 	};
 
-	sata-phy@12170000 {
-		compatible = "samsung,exynos5-sata-phy";
+	phy0: sata-phy@12170000 {
+		compatible = "samsung,exynos5250-sata-phy";
 		reg = <0x12170000 0x1ff>;
 	};
 
@@ -205,6 +206,14 @@
                 reg = <0x121D0000 0x100>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <40000>;
+		samsung,i2c-slave-addr = <0x38>;
+
+		sata-phy {
+			compatible = "samsung,exynos5250-sataphy";
+			reg = <0x38>;
+		};
 	};
 
 	spi_0: spi@12d20000 {
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index e99d3d8..09a88fb 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -80,9 +80,9 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos4210-spi.1", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-spi", EXYNOS5_PA_SPI2,
 				"exynos4210-spi.2", NULL),
-	OF_DEV_AUXDATA("samsung,exynos5-sata-ahci", 0x122F0000,
+	OF_DEV_AUXDATA("samsung,exynos5250-ahci", 0x122F0000,
 				"exynos5-sata", NULL),
-	OF_DEV_AUXDATA("samsung,exynos5-sata-phy", 0x12170000,
+	OF_DEV_AUXDATA("samsung,exynos5250-sata-phy", 0x12170000,
 				"exynos5-sata-phy", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-sata-phy-i2c", 0x121D0000,
 				"exynos5-sata-phy-i2c", NULL),
-- 
1.7.9.5
