From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: idma: Convert to SPDX License
	Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:19 +0100 (BST)
Message-ID: <20190419161419.C3C90441D3F@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-7-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-7-s.nawrocki@samsung.com>
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

   ASoC: samsung: idma: Convert to SPDX License Identifier

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

>From 1d3279c4ab5738631fa6f775991fcc65803dccff Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:41 +0200
Subject: [PATCH] ASoC: samsung: idma: Convert to SPDX License Identifier

Replace GPL v2.0+ license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/idma.c | 20 +++++++-------------
 sound/soc/samsung/idma.h |  9 +--------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index b1f09b942410..65497cd477a5 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -1,16 +1,10 @@
-/*
- * sound/soc/samsung/idma.c
- *
- * Copyright (c) 2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * I2S0's Internal DMA driver
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// idma.c - I2S0 internal DMA driver
+//
+// Copyright (c) 2011 Samsung Electronics Co., Ltd.
+//		http://www.samsung.com
+
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
diff --git a/sound/soc/samsung/idma.h b/sound/soc/samsung/idma.h
index 8644946973e5..8a46a918ed2a 100644
--- a/sound/soc/samsung/idma.h
+++ b/sound/soc/samsung/idma.h
@@ -1,14 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * sound/soc/samsung/idma.h
- *
  * Copyright (c) 2011 Samsung Electronics Co., Ltd
  *		http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __SND_SOC_SAMSUNG_IDMA_H_
-- 
2.20.1
