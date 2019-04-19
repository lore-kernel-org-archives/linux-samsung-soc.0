From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 18/27] ASoC: samsung: s3c24xx_uda134x: Convert
 to SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:53 +0200
Message-ID: <20190419102202.4384-19-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102317epcas1p2db4ea34749c5e7c73c36c4bdfbe52e70@epcas1p2.samsung.com>
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

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx_uda134x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 5fb3bab6bbfe..9d68f8ca1fcc 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -1,15 +1,11 @@
-/*
- * Modifications by Christian Pellegrin <chripell@evolware.org>
- *
- * s3c24xx_uda134x.c  --  S3C24XX_UDA134X ALSA SoC Audio board driver
- *
- * Copyright 2007 Dension Audio Systems Ltd.
- * Author: Zoltan Devai
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// Modifications by Christian Pellegrin <chripell@evolware.org>
+//
+// s3c24xx_uda134x.c - S3C24XX_UDA134X ALSA SoC Audio board driver
+//
+// Copyright 2007 Dension Audio Systems Ltd.
+// Author: Zoltan Devai
 
 #include <linux/clk.h>
 #include <linux/gpio.h>
-- 
2.17.1
