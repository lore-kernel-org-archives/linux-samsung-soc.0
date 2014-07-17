From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 12/14] ARM: dts: exynos5: add system register property
Date: Thu, 17 Jul 2014 18:01:27 +0900
Message-ID: <1405587689-1466-13-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32328 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755990AbaGQJBr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 05:01:47 -0400
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

This patch adds sysreg property to fimd device node
which is required to use I80 interface.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 79d0608..fdead12 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -87,6 +87,7 @@
 		reg = <0x14400000 0x40000>;
 		interrupt-names = "fifo", "vsync", "lcd_sys";
 		interrupts = <18 4>, <18 5>, <18 6>;
+		samsung,sysreg = <&sysreg_system_controller>;
 		status = "disabled";
 	};
 
-- 
1.9.0
