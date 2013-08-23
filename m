From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 4/7] ARM: dts: add dt nodes for exynos5420 hdmi subsystem
Date: Fri, 23 Aug 2013 15:54:18 +0530
Message-ID: <1377253461-20851-5-git-send-email-rahul.sharma@samsung.com>
References: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24218 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754276Ab3HWKC3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 06:02:29 -0400
In-reply-to: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   19 +++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |   14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index bafba25..7dbf1fa 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -61,4 +61,23 @@
 		};
 	};
 
+	hdmi@14530000 {
+		status = "okay";
+		hpd-gpio = <&gpx3 7 0>;
+	};
+
+	mixer@14450000 {
+		status = "okay";
+	};
+
+	i2c_2: i2c@12C80000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 05dee86..7c6214d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -274,4 +274,18 @@
 		pinctrl-0 = <&i2c3_bus>;
 		status = "disabled";
 	};
+
+	hdmi@14530000 {
+		compatible = "samsung,exynos4212-hdmi";
+		reg = <0x14530000 0x70000>;
+		interrupts = <0 95 0>;
+		status = "disabled";
+	};
+
+	mixer@14450000 {
+		compatible = "samsung,exynos5420-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+		status = "disabled";
+	};
 };
-- 
1.7.10.4
