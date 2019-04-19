From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: dmaengine: Convert to SPDX
	License Indentifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:22 +0100 (BST)
Message-ID: <20190419161422.1D8BA441D3E@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-4-s.nawrocki@samsung.com>
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

   ASoC: samsung: dmaengine: Convert to SPDX License Indentifier

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

>From df504eda6a7242d3ed5e5d2c9fbc8c718ca140c4 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:21:38 +0200
Subject: [PATCH] ASoC: samsung: dmaengine: Convert to SPDX License Indentifier

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/dma.h       |  8 ++------
 sound/soc/samsung/dmaengine.c | 22 ++++++----------------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 0ae15d01a3f6..7b5d4556e0fd 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -1,10 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- *  ALSA PCM interface for the Samsung SoC
+ * ALSA PCM interface for the Samsung SoC
  */
 
 #ifndef _SAMSUNG_DMA_H
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 302871974cb3..2802789a323e 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -1,19 +1,9 @@
-/*
- * dmaengine.c - Samsung dmaengine wrapper
- *
- * Author: Mark Brown <broonie@linaro.org>
- * Copyright 2013 Linaro
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// dmaengine.c - Samsung dmaengine wrapper
+//
+// Author: Mark Brown <broonie@linaro.org>
+// Copyright 2013 Linaro
 
 #include <linux/module.h>
 #include <sound/core.h>
-- 
2.20.1
