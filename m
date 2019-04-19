From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: tm2_wm5110: Convert to SPDX
	License Identifier" to the asoc tree
Date: Fri, 19 Apr 2019 17:14:07 +0100 (BST)
Message-ID: <20190419161407.A0CAB441D3F@finisterre.ee.mobilebroadband>
References: <20190419102202.4384-27-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190419102202.4384-27-s.nawrocki@samsung.com>
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

   ASoC: samsung: tm2_wm5110: Convert to SPDX License Identifier

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

>From 686f47bb72dd77d372bffdc72e257be752752c43 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 19 Apr 2019 12:22:01 +0200
Subject: [PATCH] ASoC: samsung: tm2_wm5110: Convert to SPDX License Identifier

Replace GPL v2.0+ license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/tm2_wm5110.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index dc93941e01c3..31f4256c6c65 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -1,14 +1,9 @@
-/*
- * Copyright (C) 2015 - 2016 Samsung Electronics Co., Ltd.
- *
- * Authors: Inha Song <ideal.song@samsung.com>
- *          Sylwester Nawrocki <s.nawrocki@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2015 - 2016 Samsung Electronics Co., Ltd.
+//
+// Authors: Inha Song <ideal.song@samsung.com>
+//          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
 #include <linux/gpio.h>
-- 
2.20.1
