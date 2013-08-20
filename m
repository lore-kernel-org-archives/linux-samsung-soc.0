From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/8] ARM: dts: exynos4x12: Move mshc node to exynos4x12.dtsi
Date: Tue, 20 Aug 2013 15:52:45 +0200
Message-ID: <1377006768-23174-6-git-send-email-t.figa@samsung.com>
References: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36543 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274Ab3HTNxG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 09:53:06 -0400
In-reply-to: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, pawel.moll@arm.com, mark.rutland@arm.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, galak@codeaurora.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

All SoCs from Exynos4x12 series contain the MSHC block, so its node can
be located in exynos4x12.dtsi.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 8 --------
 arch/arm/boot/dts/exynos4x12.dtsi | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 1388ce0..6b0184f 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -34,12 +34,4 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
 			     <0 107 0>, <0 108 0>, <0 48 0>, <0 42 0>;
 	};
-
-	mshc@12550000 {
-		compatible = "samsung,exynos4412-dw-mshc";
-		reg = <0x12550000 0x1000>;
-		interrupts = <0 77 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 3d7182a..06cef96 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -196,4 +196,12 @@
 			};
 		};
 	};
+
+	mshc@12550000 {
+		compatible = "samsung,exynos4412-dw-mshc";
+		reg = <0x12550000 0x1000>;
+		interrupts = <0 77 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
-- 
1.8.3.2
