From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 14/27] ASoC: samsung: s3c24xx-i2s: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:49 +0200
Message-ID: <20190419102202.4384-15-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102304epcas2p145e4b90dc30cdee9b7f20f4651ef6030@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20190419102202.4384-1-s.nawrocki@samsung.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0(+) license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/regs-iis.h    |  7 ++-----
 sound/soc/samsung/s3c24xx-i2s.c | 25 ++++++++++---------------
 sound/soc/samsung/s3c24xx-i2s.h |  6 +-----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/sound/soc/samsung/regs-iis.h b/sound/soc/samsung/regs-iis.h
index dc6cbbe9c4f0..253e172ad3b6 100644
--- a/sound/soc/samsung/regs-iis.h
+++ b/sound/soc/samsung/regs-iis.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2003 Simtec Electronics <linux@simtec.co.uk>
  *		      http://www.simtec.co.uk/products/SWLINUX/
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * S3C2410 IIS register definition
-*/
+ */
 
 #ifndef __SAMSUNG_REGS_IIS_H__
 #define __SAMSUNG_REGS_IIS_H__
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index a8026b640c95..92bdaf0878f8 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -1,18 +1,13 @@
-/*
- * s3c24xx-i2s.c  --  ALSA Soc Audio Layer
- *
- * (c) 2006 Wolfson Microelectronics PLC.
- * Graeme Gregory graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- *
- * Copyright 2004-2005 Simtec Electronics
- *	http://armlinux.simtec.co.uk/
- *	Ben Dooks <ben@simtec.co.uk>
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// s3c24xx-i2s.c  --  ALSA Soc Audio Layer
+//
+// (c) 2006 Wolfson Microelectronics PLC.
+// Graeme Gregory graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+//
+// Copyright 2004-2005 Simtec Electronics
+//	http://armlinux.simtec.co.uk/
+//	Ben Dooks <ben@simtec.co.uk>
 
 #include <linux/delay.h>
 #include <linux/clk.h>
diff --git a/sound/soc/samsung/s3c24xx-i2s.h b/sound/soc/samsung/s3c24xx-i2s.h
index f9ca04edacb7..e073e31855d0 100644
--- a/sound/soc/samsung/s3c24xx-i2s.h
+++ b/sound/soc/samsung/s3c24xx-i2s.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * s3c24xx-i2s.c  --  ALSA Soc Audio Layer
  *
@@ -5,11 +6,6 @@
  * Author: Graeme Gregory
  *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
  *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  *  Revision history
  *    10th Nov 2006   Initial version.
  */
-- 
2.17.1
