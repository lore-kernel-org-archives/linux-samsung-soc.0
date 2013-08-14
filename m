From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 2/3] ARM: dts: Update the status of RTC DT node of Exynos5250 SoC to "okay"
Date: Wed, 14 Aug 2013 19:28:29 +0530
Message-ID: <1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:57123 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757801Ab3HNN6u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 09:58:50 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so5769977pdi.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 06:58:49 -0700 (PDT)
In-Reply-To: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Updates the RTC DT node's status to "okay", since the bindings in
exynos5250.dtsi depicts the RTC h/w completely.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f426ce6..c82137b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -181,6 +181,7 @@
 	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
+		status = "okay";
 	};
 
 	tmu@10060000 {
-- 
1.7.9.5
