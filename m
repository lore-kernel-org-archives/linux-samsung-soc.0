From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 3/4] ARM: dts: Correct the /include entry on exynos5420 dtsi
 file
Date: Fri, 16 Aug 2013 13:19:37 +0530
Message-ID: <1376639378-20707-4-git-send-email-padma.v@samsung.com>
References: <1376639378-20707-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29312 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab3HPHsW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 03:48:22 -0400
In-reply-to: <1376639378-20707-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, mturquette@linaro.org

This patch corrects the /include to #include on exynos5420

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..334f7b7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -14,7 +14,7 @@
  */
 
 #include "exynos5.dtsi"
-/include/ "exynos5420-pinctrl.dtsi"
+#include "exynos5420-pinctrl.dtsi"
 / {
 	compatible = "samsung,exynos5420";
 
-- 
1.7.4.4
