From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: dts: Enable TMU on SMDK4412 board
Date: Mon, 22 Apr 2013 10:02:55 +0530
Message-ID: <1366605175-19161-4-git-send-email-sachin.kamat@linaro.org>
References: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:34623 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955Ab3DVEpd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 00:45:33 -0400
Received: by mail-pd0-f180.google.com with SMTP id q11so3300882pdj.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 21:45:32 -0700 (PDT)
In-Reply-To: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables TMU on SMDK4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Dependent on:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg17630.html
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index a8ba195..d0b80f2 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -27,6 +27,10 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
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
