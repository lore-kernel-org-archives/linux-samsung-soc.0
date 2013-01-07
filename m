From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] ARM: dts: exynos5250: Set HDMI version to v1.4
Date: Mon,  7 Jan 2013 16:00:00 -0500
Message-ID: <1357592400-18117-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:34690 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717Ab3AGVAJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 16:00:09 -0500
Received: by mail-ie0-f182.google.com with SMTP id s9so24401496iec.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jan 2013 13:00:09 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: thomas.abraham@linaro.org, kgene.kim@samsung.com, Sean Paul <seanpaul@chromium.org>

Set the HDMI version to v1.4 for all exynos5250 targets. This property
was previously being inferred by the existence of the hdmi node.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2e3b6ef..9fb6845 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -576,6 +576,7 @@
 		compatible = "samsung,exynos5-hdmi";
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
+		samsung,supports-hdmi-1.4;
 	};
 
 	mixer {
-- 
1.7.7.3
