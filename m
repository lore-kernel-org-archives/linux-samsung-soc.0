From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 3/3] remove the now empty mach-s3c2410/irq.c
Date: Wed, 1 Jun 2011 13:52:33 +0200
Message-ID: <201106011352.37080.heiko@sntech.de>
References: <201106011348.47145.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:45144 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758844Ab1FALwt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 07:52:49 -0400
In-Reply-To: <201106011348.47145.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

---
 arch/arm/mach-s3c2410/Makefile |    1 -
 arch/arm/mach-s3c2410/irq.c    |   29 -----------------------------
 2 files changed, 0 insertions(+), 30 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2410/irq.c

diff --git a/arch/arm/mach-s3c2410/Makefile b/arch/arm/mach-s3c2410/Makefile
index 0d468e9..8169535 100644
--- a/arch/arm/mach-s3c2410/Makefile
+++ b/arch/arm/mach-s3c2410/Makefile
@@ -10,7 +10,6 @@ obj-n				:=
 obj-				:=
 
 obj-$(CONFIG_CPU_S3C2410)	+= s3c2410.o
-obj-$(CONFIG_CPU_S3C2410)	+= irq.o
 obj-$(CONFIG_CPU_S3C2410_DMA)	+= dma.o
 obj-$(CONFIG_CPU_S3C2410_DMA)	+= dma.o
 obj-$(CONFIG_S3C2410_PM)	+= pm.o sleep.o
diff --git a/arch/arm/mach-s3c2410/irq.c b/arch/arm/mach-s3c2410/irq.c
deleted file mode 100644
index 4428695..0000000
--- a/arch/arm/mach-s3c2410/irq.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* linux/arch/arm/mach-s3c2410/irq.c
- *
- * Copyright (c) 2006 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
-*/
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/ioport.h>
-#include <linux/syscore_ops.h>
-
-#include <plat/cpu.h>
-#include <plat/pm.h>
-- 
1.7.1
