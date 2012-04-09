From: Olof Johansson <olof@lixom.net>
Subject: [PATCH] ARM: exynos: add dts files to dtbs target
Date: Sun,  8 Apr 2012 21:33:13 -0700
Message-ID: <1333945993-20363-1-git-send-email-olof@lixom.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55069 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab2DIEdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Apr 2012 00:33:23 -0400
Received: by pbcun15 with SMTP id un15so4604415pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Apr 2012 21:33:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Add the currently in-tree device tree sources to the dtbs target.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/arm/mach-exynos/Makefile.boot |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-exynos/Makefile.boot b/arch/arm/mach-exynos/Makefile.boot
index b9862e2..31bd181 100644
--- a/arch/arm/mach-exynos/Makefile.boot
+++ b/arch/arm/mach-exynos/Makefile.boot
@@ -1,2 +1,5 @@
    zreladdr-y	+= 0x40008000
 params_phys-y	:= 0x40000100
+
+dtb-$(CONFIG_MACH_EXYNOS4_DT) += exynos4210-origen.dtb exynos4210-smdkv310.dtb
+dtb-$(CONFIG_MACH_EXYNOS5_DT) += exynos5250-smdk5250.dtb
-- 
1.7.9.2.359.gebfc2
