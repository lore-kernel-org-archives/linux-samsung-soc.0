From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: s3c64xx: squash samsung_usb_phy.h into setup-usb-phy.c
Date: Tue, 20 Aug 2019 00:56:02 +0900
Message-ID: <20190819155602.20843-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-usb@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is only used by arch/arm/mach-s3c64xx/setup-usb-phy.c

$ git grep samsung_usb_phy_type
include/linux/usb/samsung_usb_phy.h:enum samsung_usb_phy_type {
$ git grep USB_PHY_TYPE_DEVICE
arch/arm/mach-s3c64xx/setup-usb-phy.c:  if (type == USB_PHY_TYPE_DEVICE)
arch/arm/mach-s3c64xx/setup-usb-phy.c:  if (type == USB_PHY_TYPE_DEVICE)
include/linux/usb/samsung_usb_phy.h:    USB_PHY_TYPE_DEVICE,
$ git grep USB_PHY_TYPE_HOST
include/linux/usb/samsung_usb_phy.h:    USB_PHY_TYPE_HOST,

Actually, 'enum samsung_usb_phy_type' is unused; the 'type' parameter
has 'int' type. Anyway, there is no need to declare this enum in the
globally visible header. Squash the header.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/mach-s3c64xx/setup-usb-phy.c        |  5 +++++
 arch/arm/plat-samsung/include/plat/usb-phy.h |  2 --
 include/linux/usb/samsung_usb_phy.h          | 17 -----------------
 3 files changed, 5 insertions(+), 19 deletions(-)
 delete mode 100644 include/linux/usb/samsung_usb_phy.h

diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
index 46a9e955607f..6aaaa1d8e8b9 100644
--- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
+++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
@@ -15,6 +15,11 @@
 #include "regs-sys.h"
 #include "regs-usb-hsotg-phy.h"
 
+enum samsung_usb_phy_type {
+	USB_PHY_TYPE_DEVICE,
+	USB_PHY_TYPE_HOST,
+};
+
 static int s3c_usb_otgphy_init(struct platform_device *pdev)
 {
 	struct clk *xusbxti;
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 6d0c788beb9d..94da89ecbd3b 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -7,8 +7,6 @@
 #ifndef __PLAT_SAMSUNG_USB_PHY_H
 #define __PLAT_SAMSUNG_USB_PHY_H __FILE__
 
-#include <linux/usb/samsung_usb_phy.h>
-
 extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
 extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
 
diff --git a/include/linux/usb/samsung_usb_phy.h b/include/linux/usb/samsung_usb_phy.h
deleted file mode 100644
index dc0071741695..000000000000
--- a/include/linux/usb/samsung_usb_phy.h
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2012 Samsung Electronics Co.Ltd
- *		http://www.samsung.com/
- *
- * Defines phy types for samsung usb phy controllers - HOST or DEIVCE.
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-enum samsung_usb_phy_type {
-	USB_PHY_TYPE_DEVICE,
-	USB_PHY_TYPE_HOST,
-};
-- 
2.17.1
