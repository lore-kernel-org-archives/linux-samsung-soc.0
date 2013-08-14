From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH V3 2/2] ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
Date: Wed, 14 Aug 2013 16:33:01 +0530
Message-ID: <1376478181-27539-3-git-send-email-vikas.sajjan@linaro.org>
References: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:61365 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759590Ab3HNLDU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:03:20 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so6140764pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 04:03:19 -0700 (PDT)
In-Reply-To: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Fixes the RTC DT node name for Exynos5250 SoC and also makes status of the
node as "okay".

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 88589b7..c82137b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -178,9 +178,10 @@
 		samsung,power-domain = <&pd_mfc>;
 	};
 
-	rtc {
+	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
+		status = "okay";
 	};
 
 	tmu@10060000 {
-- 
1.7.9.5
