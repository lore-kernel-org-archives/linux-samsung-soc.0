From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/7] ARM: dtsi: add node for simple phy provider for exynos5420
Date: Sun, 20 Apr 2014 16:53:59 +0530
Message-ID: <1397993044-14564-3-git-send-email-rahul.sharma@samsung.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21857 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755201AbaDTLYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 07:24:54 -0400
In-reply-to: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add dt node for simple phy provider for exynos5420 SoC.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)
 mode change 100644 => 100755 arch/arm/boot/dts/exynos5420.dtsi

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
old mode 100644
new mode 100755
index c3a9a66..07a6cdc
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -732,4 +732,10 @@
 		clock-names = "secss";
 		samsung,power-domain = <&g2d_pd>;
 	};
+
+	simple_phys: simple-phys@10040000 {
+		compatible = "samsung,exynos5420-simple-phy";
+		reg = <0x10040000 0x10000>;
+		#phy-cells = <1>;
+	};
 };
-- 
1.7.9.5
