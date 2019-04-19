From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 19/27] ASoC: samsung: smartq_wm8987: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:54 +0200
Message-ID: <20190419102202.4384-20-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102320epcas2p2a6b422dcb191f2b04a003b4e03073ed1@epcas2p2.samsung.com>
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
 sound/soc/samsung/smartq_wm8987.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/smartq_wm8987.c b/sound/soc/samsung/smartq_wm8987.c
index cf0f54e652c1..b9e887ea60b2 100644
--- a/sound/soc/samsung/smartq_wm8987.c
+++ b/sound/soc/samsung/smartq_wm8987.c
@@ -1,17 +1,10 @@
-/* sound/soc/samsung/smartq_wm8987.c
- *
- * Copyright 2010 Maurus Cuelenaere <mcuelenaere@gmail.com>
- *
- * Based on smdk6410_wm8987.c
- *     Copyright 2007 Wolfson Microelectronics PLC. - linux@wolfsonmicro.com
- *     Graeme Gregory - graeme.gregory@wolfsonmicro.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2010 Maurus Cuelenaere <mcuelenaere@gmail.com>
+//
+// Based on smdk6410_wm8987.c
+//     Copyright 2007 Wolfson Microelectronics PLC. - linux@wolfsonmicro.com
+//     Graeme Gregory - graeme.gregory@wolfsonmicro.com
 
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-- 
2.17.1
