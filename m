From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s3c24xx_simtec*: Convert to
	SPDX License Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:12 +0100 (BST)
Message-ID: <20190419161413.0CE13441D3B@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-18-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-18-s.nawrocki@samsung.com>
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

   ASoC: samsung: s3c24xx_simtec*: Convert to SPDX License Identifier

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

>From ac64529df8dfc127f3e212d51ff16f3ceb092da4 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:52 +0200
Subject: [PATCH] ASoC: samsung: s3c24xx_simtec*: Convert to SPDX License
 Identifier

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1
