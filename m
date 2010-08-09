From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: S5PV210: enable FIMC on Aquila
Date: Mon, 09 Aug 2010 09:51:52 +0200
Message-ID: <1281340315-26676-2-git-send-email-m.szyprowski@samsung.com>
References: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:65273 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755622Ab0HIHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 03:52:01 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6V005HFKIM51@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6V00D5NKILEX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:57 +0100 (BST)
In-reply-to: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, p.osciak@samsung.com

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

Add support for FIMC on Samsung Aquila board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig       |    3 +++
 arch/arm/mach-s5pv210/mach-aquila.c |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index ea9d147..86f44e5 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -65,6 +65,9 @@ config MACH_AQUILA
 	select CPU_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
 	select S3C_DEV_FB
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index a6b4ed3..5c470dc 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -482,6 +482,9 @@ static struct platform_device *aquila_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 };
 
 static void __init aquila_map_io(void)
-- 
1.7.1.569.g6f426
