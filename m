From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 05/12] ARM: SAMSUNG: local regs-usb-hsotg-phy header in
 mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:00 +0900
Message-ID: <013e01d0c87c$a14a10b0$e3de3210$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47477 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbbG0O6C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:02 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS500WO1IWOM2D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:00 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves regs-usb-hsotg-phy header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 .../{plat-samsung/include/plat => mach-s3c64xx}/regs-usb-hsotg-phy.h   | 3 +--
 arch/arm/mach-s3c64xx/setup-usb-phy.c                                  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/regs-usb-hsotg-phy.h (96%)

diff --git a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h b/arch/arm/mach-s3c64xx/regs-usb-hsotg-phy.h
similarity index 96%
rename from arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
rename to arch/arm/mach-s3c64xx/regs-usb-hsotg-phy.h
index fcf2796..eae3c31 100644
--- a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg-phy.h
+++ b/arch/arm/mach-s3c64xx/regs-usb-hsotg-phy.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h
- *
+/*
  * Copyright 2008 Openmoko, Inc.
  * Copyright 2008 Simtec Electronics
  *      http://armlinux.simtec.co.uk/
diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
index ca960bd..2b17b7f 100644
--- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
+++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
@@ -16,10 +16,10 @@
 #include <linux/platform_device.h>
 #include <mach/map.h>
 #include <plat/cpu.h>
-#include <plat/regs-usb-hsotg-phy.h>
 #include <plat/usb-phy.h>
 
 #include "regs-sys.h"
+#include "regs-usb-hsotg-phy.h"
 
 static int s3c_usb_otgphy_init(struct platform_device *pdev)
 {
-- 
2.0.0
