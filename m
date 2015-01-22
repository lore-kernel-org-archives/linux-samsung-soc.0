From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v3 3/4] ARM: dts: set clock out parent to XUSBXTI
Date: Thu, 22 Jan 2015 20:18:01 +0900
Message-ID: <1421925482-15861-4-git-send-email-ideal.song@samsung.com>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52737 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbbAVLSc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 06:18:32 -0500
In-reply-to: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, s.nawrocki@samsung.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch set clock out parent to XUSBXTI.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8168f1..020bbaf 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -141,6 +141,8 @@
 	pmu_system_controller: system-controller@10020000 {
 		compatible = "samsung,exynos4210-pmu", "syscon";
 		reg = <0x10020000 0x4000>;
+		assigned-clocks = <&pmu_system_controller 0>;
+		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
 	};
 
 	dsi_0: dsi@11C80000 {
-- 
2.0.0.390.gcb682f8
