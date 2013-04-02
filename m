From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 2/7] ARM: dts: Add disable-wp for card slot on exynos5250-arndale
Date: Tue,  2 Apr 2013 13:45:02 +0530
Message-ID: <1364890507-19261-3-git-send-email-tushar.behera@linaro.org>
References: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:40848 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760123Ab3DBI04 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:26:56 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so169093pad.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:26:55 -0700 (PDT)
In-Reply-To: <1364890507-19261-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

This is required to keep the existing functionality of having no
write protect pin on Arndale board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
This is a new patch in the patchset.

 arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 7e7a61e..d07a21f 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -96,6 +96,7 @@
 		slot@0 {
 			reg = <0>;
 			bus-width = <4>;
+			disable-wp;
 		};
 	};
 
-- 
1.7.9.5
