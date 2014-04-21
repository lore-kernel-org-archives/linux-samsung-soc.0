From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v2 PATCH v2 07/14] ARM: dts: exynos_dsim: add exynos5420
 compatible to DT bindings
Date: Mon, 21 Apr 2014 21:28:34 +0900
Message-ID: <1398083321-8668-8-git-send-email-yj44.cho@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40820 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385AbaDUM2s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 08:28:48 -0400
In-reply-to: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, laurent.pinchart@ideasonboard.com, sachin.kamat@linaro.org

This patch adds relevant to exynos5420 compatible for exynos5420 SoC support.

Changelog v2:
- Changes title, description and fixes typo (commented by Sachin Kamat)

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 33b5730..29bf3b2 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -1,7 +1,9 @@
 Exynos MIPI DSI Master
 
 Required properties:
-  - compatible: "samsung,exynos4210-mipi-dsi"
+  - compatible: value should be one of the following
+			"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
+			"samsung,exynos5420-mipi-dsi" /* for Exynos5420 SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
1.7.9.5
