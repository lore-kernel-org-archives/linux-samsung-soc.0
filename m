From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 17/27] ASoC: samsung: s3c24xx_simtec*: Convert
 to SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:52 +0200
Message-ID: <20190419102202.4384-18-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102314epcas2p3a5fd34f66d38333f719cd7120a738931@epcas2p3.samsung.com>
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
 sound/soc/samsung/s3c24xx_simtec.c             | 11 +++--------
 sound/soc/samsung/s3c24xx_simtec.h             | 10 +++-------
 sound/soc/samsung/s3c24xx_simtec_hermes.c      | 11 +++--------
 sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c | 11 +++--------
 4 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_simtec.c b/sound/soc/samsung/s3c24xx_simtec.c
index 6de63f3e37d5..4543705b8d87 100644
--- a/sound/soc/samsung/s3c24xx_simtec.c
+++ b/sound/soc/samsung/s3c24xx_simtec.c
@@ -1,11 +1,6 @@
-/* sound/soc/samsung/s3c24xx_simtec.c
- *
- * Copyright 2009 Simtec Electronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2009 Simtec Electronics
 
 #include <linux/gpio.h>
 #include <linux/clk.h>
diff --git a/sound/soc/samsung/s3c24xx_simtec.h b/sound/soc/samsung/s3c24xx_simtec.h
index 8270748a2c41..38d8384755cd 100644
--- a/sound/soc/samsung/s3c24xx_simtec.h
+++ b/sound/soc/samsung/s3c24xx_simtec.h
@@ -1,11 +1,7 @@
-/* sound/soc/samsung/s3c24xx_simtec.h
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * Copyright 2009 Simtec Electronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+ */
 
 extern void simtec_audio_init(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/samsung/s3c24xx_simtec_hermes.c b/sound/soc/samsung/s3c24xx_simtec_hermes.c
index 7ac924c595bf..e3528e74a338 100644
--- a/sound/soc/samsung/s3c24xx_simtec_hermes.c
+++ b/sound/soc/samsung/s3c24xx_simtec_hermes.c
@@ -1,11 +1,6 @@
-/* sound/soc/samsung/s3c24xx_simtec_hermes.c
- *
- * Copyright 2009 Simtec Electronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2009 Simtec Electronics
 
 #include <linux/module.h>
 #include <sound/soc.h>
diff --git a/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c b/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
index b4ed2fc1a65c..1360b881400d 100644
--- a/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
+++ b/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
@@ -1,11 +1,6 @@
-/* sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
- *
- * Copyright 2009 Simtec Electronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2009 Simtec Electronics
 
 #include <linux/module.h>
 #include <sound/soc.h>
-- 
2.17.1
