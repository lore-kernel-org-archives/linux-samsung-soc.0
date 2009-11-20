From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 16/20] ARM: S5PC1XX: enable S5PC110 sub-platform
Date: Fri, 20 Nov 2009 14:42:48 +0100
Message-ID: <1258724572-19176-17-git-send-email-m.szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36715 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753188AbZKTNnH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 08:43:07 -0500
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTE00LMLU3R7A@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KTE00FAAU3P65@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:03 +0000 (GMT)
In-reply-to: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

Samsung S5PC110 SoC are newer Samsung SoCs. Like S5PC100 they are based
on CortexA8 ARM CPU, but have much more powerfull integrated periperals.
This patch enables S5PC110 sub-platform.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/Kconfig              |    1 +
 arch/arm/Makefile             |    1 +
 arch/arm/plat-s5pc1xx/Kconfig |    3 +++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1c4119c..280c38e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -770,6 +770,7 @@ source "arch/arm/plat-stmp3xxx/Kconfig"
 
 if ARCH_S5PC1XX
 source "arch/arm/mach-s5pc100/Kconfig"
+source "arch/arm/mach-s5pc110/Kconfig"
 endif
 
 source "arch/arm/mach-lh7a40x/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index daea150..d9daa45 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -161,6 +161,7 @@ machine-$(CONFIG_ARCH_S3C2410)		:= s3c2410 s3c2400 s3c2412 s3c2440 s3c2442 s3c24
 machine-$(CONFIG_ARCH_S3C24A0)		:= s3c24a0
 machine-$(CONFIG_ARCH_S3C64XX)		:= s3c6400 s3c6410
 machine-$(CONFIG_ARCH_S5PC100)		:= s5pc100
+machine-$(CONFIG_ARCH_S5PC110)		:= s5pc110
 machine-$(CONFIG_ARCH_SA1100)		:= sa1100
 machine-$(CONFIG_ARCH_SHARK)		:= shark
 machine-$(CONFIG_ARCH_STMP378X)		:= stmp378x
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 4a3347d..b310314 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -30,6 +30,9 @@ choice
 config ARCH_S5PC100
 	bool "S5PC100"
 
+config ARCH_S5PC110
+	bool "S5PC110"
+
 endchoice
 
 
-- 
1.6.4
