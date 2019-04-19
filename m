From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s3c24xx-i2s: Convert to SPDX
	License Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:14 +0100 (BST)
Message-ID: <20190419161414.BA76A441D3E@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-15-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-15-s.nawrocki@samsung.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, Mark Brown <broonie@kernel.org>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: s3c24xx-i2s: Convert to SPDX License Identifier

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 521cc68ea5888a6439a43a35bf84bbf7b5b79363 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:49 +0200
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s: Convert to SPDX License
 Identifier

Replace GPL v2.0(+) license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1
