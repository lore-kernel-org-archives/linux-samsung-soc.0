From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos prefix
Date: Mon, 25 Nov 2013 12:15:10 +0000
Message-ID: <1385381710-5212-3-git-send-email-broonie@kernel.org>
References: <1385381710-5212-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56132 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751743Ab3KYMPV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 07:15:21 -0500
In-Reply-To: <1385381710-5212-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Make it easier to notice the common file for ChromeOS devices based on
the Exynos5250 by giving it the exynos5250 prefix that the boards have.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/{cros5250-common.dtsi => exynos5250-cros-common.dtsi} | 0
 arch/arm/boot/dts/exynos5250-snow.dts                                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm/boot/dts/{cros5250-common.dtsi => exynos5250-cros-common.dtsi} (100%)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
similarity index 100%
rename from arch/arm/boot/dts/cros5250-common.dtsi
rename to arch/arm/boot/dts/exynos5250-cros-common.dtsi
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e245e8d..7e2669c6f7f5 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -10,7 +10,7 @@
 
 /dts-v1/;
 #include "exynos5250.dtsi"
-#include "cros5250-common.dtsi"
+#include "exynos5250-cros-common.dtsi"
 
 / {
 	model = "Google Snow";
-- 
1.8.4.4
