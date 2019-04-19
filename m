From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 12/27] ASoC: samsung: pcm: Convert to SPDX
 License Identifier
Date: Fri, 19 Apr 2019 12:21:47 +0200
Message-ID: <20190419102202.4384-13-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102257epcas2p2b60a803ada45fd226540114894594f4e@epcas2p2.samsung.com>
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
2.17.1
