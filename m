From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] ARM: dts: Add mfc node for exynos5800
Date: Thu, 15 May 2014 16:48:29 +0530
Message-ID: <1400152709-16845-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:64854 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231AbaEOLSi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 07:18:38 -0400
Received: by mail-pa0-f41.google.com with SMTP id lj1so969274pab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 04:18:37 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, arunkk.samsung@gmail.com

Adds the mfc node to exynos5800 which uses MFCv8.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
The driver side patch adding support for MFCv8 is under
review [1]. This is based on the linux-samsung for-next branch.
[1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30670.html
---
 arch/arm/boot/dts/exynos5800.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 6979fc7..c0bb356 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -22,3 +22,7 @@
 &clock {
 	compatible = "samsung,exynos5800-clock";
 };
+
+&mfc {
+	compatible = "samsung,mfc-v8";
+};
-- 
1.7.9.5
