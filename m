From: Chanho Park <parkch98@gmail.com>
Subject: [PATCH 2/2] ARM: dts: add exynos5420-fimd compatible
Date: Fri, 12 Feb 2016 22:31:40 +0900
Message-ID: <1455283900-6913-3-git-send-email-chanho61.park@samsung.com>
References: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35949 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752627AbcBLNc5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:32:57 -0500
Received: by mail-pa0-f65.google.com with SMTP id gc2so79105pab.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2016 05:32:57 -0800 (PST)
In-Reply-To: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Chanho Park <chanho61.park@samsung.com>

This patch changes the compatible of exynos5420 fimd
to "exynos5420-fimd". To support mic bypass from display
path, the new compatible is introduced for exynos5420.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 48a0a55..252c7a3 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1151,6 +1151,7 @@
 };
 
 &fimd {
+	compatible = "samsung,exynos5420-fimd";
 	clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 	clock-names = "sclk_fimd", "fimd";
 	power-domains = <&disp_pd>;
-- 
2.5.0
