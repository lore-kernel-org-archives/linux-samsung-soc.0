From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 2/3] ARM: dts: replace number by macro in clock binding for
 exynos5250
Date: Wed, 21 May 2014 17:39:52 +0900
Message-ID: <537C6658.3080602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40778 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011AbaEUIjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:39:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Phy and sss module device node missed clock macro.
This patch replace magic number with macros in clock
binding for exynos5250.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3742331..f57dd4b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -250,7 +250,7 @@
 	sata_phy: sata-phy@12170000 {
 		compatible = "samsung,exynos5250-sata-phy";
 		reg = <0x12170000 0x1ff>;
-		clocks = <&clock 287>;
+		clocks = <&clock CLK_SATA_PHYCTRL>;
 		clock-names = "sata_phyctrl";
 		#phy-cells = <0>;
 		samsung,syscon-phandle = <&pmu_system_controller>;
@@ -733,7 +733,7 @@
 		compatible = "samsung,exynos4210-secss";
 		reg = <0x10830000 0x10000>;
 		interrupts = <0 112 0>;
-		clocks = <&clock 348>;
+		clocks = <&clock CLK_SSS>;
 		clock-names = "secss";
 	};
 };
-- 
1.7.9.5
