From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/3] ARM: dts: Set BUCK7 as always on for Origen board
Date: Fri,  7 Jun 2013 16:37:15 +0530
Message-ID: <1370603235-11193-4-git-send-email-tushar.behera@linaro.org>
References: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:40205 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755851Ab3FGLVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 07:21:47 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so1116614pdj.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jun 2013 04:21:47 -0700 (PDT)
In-Reply-To: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

The LDO for LCD driver is currently not handled by any of the drivers.
This disables the LDO during booting time. To fix this, the LDO
is forced to enabled always.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 4c6c3cd..08609b8 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -225,6 +225,7 @@
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-boot-on;
+					regulator-always-on;
 				};
 			};
 		};
-- 
1.7.9.5
