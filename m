From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 6/6] ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file
Date: Tue, 29 Jan 2013 09:43:42 +0530
Message-ID: <1359432822-23846-7-git-send-email-sachin.kamat@linaro.org>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:45062 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756567Ab3A2EXD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 23:23:03 -0500
Received: by mail-da0-f42.google.com with SMTP id z17so14030dal.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 20:23:01 -0800 (PST)
In-Reply-To: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added MFC DT entry to exynos4412-smdk4412.dts file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index e885971..dcd1f33 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -49,4 +49,9 @@
 	serial@13830000 {
 		status = "okay";
 	};
+
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
 };
-- 
1.7.4.1
