From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: EXYNOS: Add MFC codec support to SMDKV310 DT
Date: Wed,  2 Jan 2013 14:16:08 +0530
Message-ID: <1357116369-20784-3-git-send-email-sachin.kamat@linaro.org>
References: <1357116369-20784-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35344 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab3ABIyO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 03:54:14 -0500
Received: by mail-pa0-f51.google.com with SMTP id fb11so7862096pad.24
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 00:54:14 -0800 (PST)
In-Reply-To: <1357116369-20784-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Added MFC codec support to SMDKV310 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index f634907..8481f8f 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -189,4 +189,9 @@
 			};
 		};
 	};
+
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
 };
-- 
1.7.4.1
