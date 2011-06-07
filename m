From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: S5PC110: enable PWM timers for GONI board
Date: Tue, 07 Jun 2011 08:45:15 +0200
Message-ID: <1307429115-13402-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46709 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127Ab1FGGpX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 02:45:23 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LME00E6WQRMHE@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 07:45:22 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME00JF4QRLIX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 07:45:21 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

s5p_timer requires PWM device to be compiled in. Add aproperiate Kconfig
select directive for GONI machine, so compilation won't fail if GONI is
the only machine compiled into the kernel.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
 arch/arm/mach-s5pv210/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..aceafb4 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -92,6 +92,7 @@ config MACH_GONI
 	select S3C_DEV_I2C2
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
+	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_KEYPAD
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
-- 
1.7.1.569.g6f426
