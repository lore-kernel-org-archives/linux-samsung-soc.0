From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: spdif: Convert to SPDX License
	Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:08 +0100 (BST)
Message-ID: <20190419161408.CD333441D56@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-25-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-25-s.nawrocki@samsung.com>
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

   ASoC: samsung: spdif: Convert to SPDX License Identifier

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

>From dbf0344a4b6ad38732fa246c1b8ea93435af58e0 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:59 +0200
Subject: [PATCH] ASoC: samsung: spdif: Convert to SPDX License Identifier

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/spdif.c | 17 ++++++-----------
 sound/soc/samsung/spdif.h |  8 ++------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 5e4afb330416..805c57986e0b 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -1,14 +1,9 @@
-/* sound/soc/samsung/spdif.c
- *
- * ALSA SoC Audio Layer - Samsung S/PDIF Controller driver
- *
- * Copyright (c) 2010 Samsung Electronics Co. Ltd
- *		http://www.samsung.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Audio Layer - Samsung S/PDIF Controller driver
+//
+// Copyright (c) 2010 Samsung Electronics Co. Ltd
+//		http://www.samsung.com/
 
 #include <linux/clk.h>
 #include <linux/io.h>
diff --git a/sound/soc/samsung/spdif.h b/sound/soc/samsung/spdif.h
index 4f72cb446dbf..461da60ab040 100644
--- a/sound/soc/samsung/spdif.h
+++ b/sound/soc/samsung/spdif.h
@@ -1,13 +1,9 @@
-/* sound/soc/samsung/spdif.h
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * ALSA SoC Audio Layer - Samsung S/PDIF Controller driver
  *
  * Copyright (c) 2010 Samsung Electronics Co. Ltd
  *		http://www.samsung.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef __SND_SOC_SAMSUNG_SPDIF_H
-- 
2.20.1
