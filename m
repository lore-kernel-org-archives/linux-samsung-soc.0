From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 16/27] ASoC: samsung: s3c2412-i2s: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:51 +0200
Message-ID: <20190419102202.4384-17-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102310epcas1p1e740f1299528c43c2af4495ff4e538a5@epcas1p1.samsung.com>
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

Replace GPL v2.0+ license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c2412-i2s.c | 28 +++++++++++-----------------
 sound/soc/samsung/s3c2412-i2s.h | 11 +++--------
 2 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index c08638b0e458..787a3f6e9f24 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -1,20 +1,14 @@
-/* sound/soc/samsung/s3c2412-i2s.c
- *
- * ALSA Soc Audio Layer - S3C2412 I2S driver
- *
- * Copyright (c) 2006 Wolfson Microelectronics PLC.
- *	Graeme Gregory graeme.gregory@wolfsonmicro.com
- *	linux@wolfsonmicro.com
- *
- * Copyright (c) 2007, 2004-2005 Simtec Electronics
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
+// ALSA Soc Audio Layer - S3C2412 I2S driver
+//
+// Copyright (c) 2006 Wolfson Microelectronics PLC.
+//	Graeme Gregory graeme.gregory@wolfsonmicro.com
+//	linux@wolfsonmicro.com
+//
+// Copyright (c) 2007, 2004-2005 Simtec Electronics
+//	http://armlinux.simtec.co.uk/
+//	Ben Dooks <ben@simtec.co.uk>
 
 #include <linux/delay.h>
 #include <linux/gpio.h>
diff --git a/sound/soc/samsung/s3c2412-i2s.h b/sound/soc/samsung/s3c2412-i2s.h
index 02ad5794c0a9..bff2a797cb08 100644
--- a/sound/soc/samsung/s3c2412-i2s.h
+++ b/sound/soc/samsung/s3c2412-i2s.h
@@ -1,16 +1,11 @@
-/* sound/soc/samsung/s3c2412-i2s.c
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * ALSA Soc Audio Layer - S3C2412 I2S driver
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
 
 #ifndef __SND_SOC_S3C24XX_S3C2412_I2S_H
 #define __SND_SOC_S3C24XX_S3C2412_I2S_H __FILE__
-- 
2.17.1
