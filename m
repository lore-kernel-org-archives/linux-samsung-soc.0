From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 07/27] ASoC: samsung: jive_wm8750: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:42 +0200
Message-ID: <20190419102202.4384-8-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102241epcas1p114e54ca76473a74aed6a1d186cb7629e@epcas1p1.samsung.com>
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
 sound/soc/samsung/jive_wm8750.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/jive_wm8750.c b/sound/soc/samsung/jive_wm8750.c
index 529b10dc532b..f05f9e03f07d 100644
--- a/sound/soc/samsung/jive_wm8750.c
+++ b/sound/soc/samsung/jive_wm8750.c
@@ -1,15 +1,10 @@
-/* sound/soc/samsung/jive_wm8750.c
- *
- * Copyright 2007,2008 Simtec Electronics
- *
- * Based on sound/soc/pxa/spitz.c
- *	Copyright 2005 Wolfson Microelectronics PLC.
- *	Copyright 2005 Openedhand Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2007,2008 Simtec Electronics
+//
+// Based on sound/soc/pxa/spitz.c
+//	Copyright 2005 Wolfson Microelectronics PLC.
+//	Copyright 2005 Openedhand Ltd.
 
 #include <linux/module.h>
 #include <sound/soc.h>
-- 
2.17.1
