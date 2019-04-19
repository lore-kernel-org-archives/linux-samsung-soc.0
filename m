From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 24/27] ASoC: samsung: spdif: Convert to SPDX
 License Identifier
Date: Fri, 19 Apr 2019 12:21:59 +0200
Message-ID: <20190419102202.4384-25-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102337epcas2p45ca1781cda7e24cfed289b358723476c@epcas2p4.samsung.com>
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
2.17.1
