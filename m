From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH v2] ARM: dts: Add USB host node for Exynos4
Date: Wed, 24 Jul 2013 23:10:24 +0900
Message-ID: <1374675026-21798-1-git-send-email-tobetter@gmail.com>
References: <1374600763-19466-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:52227 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205Ab3GXOKu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 10:10:50 -0400
In-Reply-To: <1374600763-19466-1-git-send-email-tobetter@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds EHCI and OHCI host device nodes for Exynos4.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3f94fe8..cbe5219 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -155,6 +155,24 @@
 		status = "disabled";
 	};
 
+	ehci@12580000 {
+		compatible = "samsung,exynos4210-ehci";
+		reg = <0x12580000 0x100>;
+		interrupts = <0 70 0>;
+		clocks = <&clock 304>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
+	ohci@12590000 {
+		compatible = "samsung,exynos4210-ohci";
+		reg = <0x12590000 0x100>;
+		interrupts = <0 70 0>;
+		clocks = <&clock 304>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
 	mfc: codec@13400000 {
 		compatible = "samsung,mfc-v5";
 		reg = <0x13400000 0x10000>;
-- 
1.7.9.5
