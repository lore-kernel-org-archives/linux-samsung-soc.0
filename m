From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] ARM: S5PC100: enable FIMC on SMDKC100
Date: Mon, 09 Aug 2010 09:51:54 +0200
Message-ID: <1281340315-26676-4-git-send-email-m.szyprowski@samsung.com>
References: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29376 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755619Ab0HIHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 03:52:01 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L6V00MGPKIMSO60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6V006X2KILN1@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:58 +0100 (BST)
In-reply-to: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, p.osciak@samsung.com

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

Add support for FIMC on Samsung SMDKC100 board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig         |    3 +++
 arch/arm/mach-s5pc100/mach-smdkc100.c |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index ab038d0..77ae4bf 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -65,6 +65,9 @@ config MACH_SMDKC100
 	select S5PC100_SETUP_IDE
 	select S5PC100_SETUP_KEYPAD
 	select S5PC100_SETUP_SDHCI
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	help
 	  Machine support for the Samsung SMDKC100
 
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index a63c8a4..2dc519c 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -193,6 +193,9 @@ static struct platform_device *smdkc100_devices[] __initdata = {
 	&samsung_device_keypad,
 	&s5pc100_device_ac97,
 	&s3c_device_rtc,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 };
 
 static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
-- 
1.7.1.569.g6f426
