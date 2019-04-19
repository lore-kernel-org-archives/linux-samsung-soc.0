From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s3c-i2s-v2: Convert to SPDX
	License Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:15 +0100 (BST)
Message-ID: <20190419161415.561F3441D3B@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-14-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-14-s.nawrocki@samsung.com>
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

   ASoC: samsung: s3c-i2s-v2: Convert to SPDX License Identifier

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

>From 08ac76d01beaf32e8ea4e20c20ccea42206ddc90 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:48 +0200
Subject: [PATCH] ASoC: samsung: s3c-i2s-v2: Convert to SPDX License Identifier

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/regs-i2s-v2.h | 10 +++-------
 sound/soc/samsung/s3c-i2s-v2.c  | 26 +++++++++++---------------
 sound/soc/samsung/s3c-i2s-v2.h  | 11 +++--------
 3 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/sound/soc/samsung/regs-i2s-v2.h b/sound/soc/samsung/regs-i2s-v2.h
index 5e5e5680580b..867984e75709 100644
--- a/sound/soc/samsung/regs-i2s-v2.h
+++ b/sound/soc/samsung/regs-i2s-v2.h
@@ -1,14 +1,10 @@
-/* linux/include/asm-arm/plat-s3c24xx/regs-s3c2412-iis.h
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * Copyright 2007 Simtec Electronics <linux@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * S3C2412 IIS register definition
-*/
+ */
 
 #ifndef __ASM_ARCH_REGS_S3C2412_IIS_H
 #define __ASM_ARCH_REGS_S3C2412_IIS_H
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 58c3e9bfc6b7..7e196b599be1 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -1,18 +1,14 @@
-/* ALSA Soc Audio Layer - I2S core for newer Samsung SoCs.
- *
- * Copyright (c) 2006 Wolfson Microelectronics PLC.
- *	Graeme Gregory graeme.gregory@wolfsonmicro.com
- *	linux@wolfsonmicro.com
- *
- * Copyright (c) 2008, 2007, 2004-2005 Simtec Electronics
- *	http://armlinux.simtec.co.uk/
- *	Ben Dooks <ben@simtec.co.uk>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// ALSA Soc Audio Layer - I2S core for newer Samsung SoCs.
+//
+// Copyright (c) 2006 Wolfson Microelectronics PLC.
+//	Graeme Gregory graeme.gregory@wolfsonmicro.com
+//	linux@wolfsonmicro.com
+//
+// Copyright (c) 2008, 2007, 2004-2005 Simtec Electronics
+//	http://armlinux.simtec.co.uk/
+//	Ben Dooks <ben@simtec.co.uk>
 
 #include <linux/module.h>
 #include <linux/delay.h>
diff --git a/sound/soc/samsung/s3c-i2s-v2.h b/sound/soc/samsung/s3c-i2s-v2.h
index 3fca20f7a853..fe42b77999fd 100644
--- a/sound/soc/samsung/s3c-i2s-v2.h
+++ b/sound/soc/samsung/s3c-i2s-v2.h
@@ -1,16 +1,11 @@
-/* sound/soc/samsung/s3c-i2s-v2.h
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * ALSA Soc Audio Layer - S3C_I2SV2 I2S driver
  *
  * Copyright (c) 2007 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
-*/
+ */
 
 /* This code is the core support for the I2S block found in a number of
  * Samsung SoC devices which is unofficially named I2S-V2. Currently the
-- 
2.20.1
