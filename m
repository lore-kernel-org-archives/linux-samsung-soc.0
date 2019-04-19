From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 20/27] ASoC: samsung: smdk_spdif: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:55 +0200
Message-ID: <20190419102202.4384-21-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102324epcas1p425e4612e7fb7f62b09cece5af88cb6c2@epcas1p4.samsung.com>
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
 sound/soc/samsung/smdk_spdif.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 7fc7cc6d1530..87a70d872c00 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -1,14 +1,8 @@
-/*
- * smdk_spdif.c  --  S/PDIF audio for SMDK
- *
- * Copyright 2010 Samsung Electronics Co. Ltd.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of the
- * License, or (at your option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// smdk_spdif.c - S/PDIF audio for SMDK
+//
+// Copyright (C) 2010 Samsung Electronics Co., Ltd.
 
 #include <linux/clk.h>
 #include <linux/module.h>
-- 
2.17.1
