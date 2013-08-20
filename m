From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 6/8] ARM: dts: exynos4x12: Keep mshc node disabled by default
Date: Tue, 20 Aug 2013 15:52:46 +0200
Message-ID: <1377006768-23174-7-git-send-email-t.figa@samsung.com>
References: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36543 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227Ab3HTNxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 09:53:07 -0400
In-reply-to: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, pawel.moll@arm.com, mark.rutland@arm.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, galak@codeaurora.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

MSHC node requires additional board-specific data, so it should be
disabled by default. Board dts files already have status override for
it, so only the change in exynso4x12.dtsi is needed.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 06cef96..2f243c2 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -203,5 +203,6 @@
 		interrupts = <0 77 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
 	};
 };
-- 
1.8.3.2
