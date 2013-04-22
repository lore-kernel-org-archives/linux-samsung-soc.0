From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: dts: Enable TMU on Origen4412 board
Date: Mon, 22 Apr 2013 10:02:54 +0530
Message-ID: <1366605175-19161-3-git-send-email-sachin.kamat@linaro.org>
References: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:48432 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750885Ab3DVEpa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 00:45:30 -0400
Received: by mail-pa0-f48.google.com with SMTP id lj1so3312428pab.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 21:45:29 -0700 (PDT)
In-Reply-To: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables TMU on Origen4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Dependent on:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg17630.html
---
 arch/arm/boot/dts/exynos4412-origen.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index ca73c42..00104ea 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -98,6 +98,10 @@
 		};
 	};
 
+	tmu@100C0000 {
+		status = "okay";
+	};
+
 	g2d@10800000 {
 		status = "okay";
 	};
-- 
1.7.9.5
