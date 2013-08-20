From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 8/8] ARM: dts: exynos4: Add missing unit-address of sysreg node
Date: Tue, 20 Aug 2013 15:52:48 +0200
Message-ID: <1377006768-23174-9-git-send-email-t.figa@samsung.com>
References: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36543 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303Ab3HTNxJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 09:53:09 -0400
In-reply-to: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, pawel.moll@arm.com, mark.rutland@arm.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, galak@codeaurora.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The node contains reg property, so unit-address suffix should be present
in its name.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 892d5ea..92c9d24 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -93,7 +93,7 @@
 		reg = <0x10440000 0x1000>;
 	};
 
-	sys_reg: sysreg {
+	sys_reg: sysreg@10010000 {
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
 	};
-- 
1.8.3.2
