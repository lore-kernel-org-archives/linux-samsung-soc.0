From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: pcm: Convert to SPDX License
	Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:15 +0100 (BST)
Message-ID: <20190419161415.E83CE441D3C@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-13-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-13-s.nawrocki@samsung.com>
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

   ASoC: samsung: pcm: Convert to SPDX License Identifier

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

>From 65511dc7488eee1d5597e427726297ea49a59998 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:47 +0200
Subject: [PATCH] ASoC: samsung: pcm: Convert to SPDX License Identifier

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/pcm.c | 19 +++++++------------
 sound/soc/samsung/pcm.h |  8 +-------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 3c7baa561084..f6e67d0e7882 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -1,15 +1,10 @@
-/* sound/soc/samsung/pcm.c
- *
- * ALSA SoC Audio Layer - S3C PCM-Controller driver
- *
- * Copyright (c) 2009 Samsung Electronics Co. Ltd
- * Author: Jaswinder Singh <jassisinghbrar@gmail.com>
- * based upon I2S drivers by Ben Dooks.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Audio Layer - S3C PCM-Controller driver
+//
+// Copyright (c) 2009 Samsung Electronics Co. Ltd
+// Author: Jaswinder Singh <jassisinghbrar@gmail.com>
+// based upon I2S drivers by Ben Dooks.
 
 #include <linux/clk.h>
 #include <linux/io.h>
diff --git a/sound/soc/samsung/pcm.h b/sound/soc/samsung/pcm.h
index 726baf814613..208d8da27de1 100644
--- a/sound/soc/samsung/pcm.h
+++ b/sound/soc/samsung/pcm.h
@@ -1,10 +1,4 @@
-/*  sound/soc/samsung/pcm.h
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef __S3C_PCM_H
 #define __S3C_PCM_H __FILE__
-- 
2.20.1
