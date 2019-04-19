From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 10/27] ASoC: samsung: neo1973_wm8753: Convert
 to SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:45 +0200
Message-ID: <20190419102202.4384-11-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102251epcas2p45dfd6bb3da2d1be76d4abaf4d8edc57f@epcas2p4.samsung.com>
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
 sound/soc/samsung/neo1973_wm8753.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 65602b935377..7e625066ddcd 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -1,18 +1,13 @@
-/*
- * neo1973_wm8753.c  --  SoC audio for Openmoko Neo1973 and Freerunner devices
- *
- * Copyright 2007 Openmoko Inc
- * Author: Graeme Gregory <graeme@openmoko.org>
- * Copyright 2007 Wolfson Microelectronics PLC.
- * Author: Graeme Gregory
- *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- * Copyright 2009 Wolfson Microelectronics
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// neo1973_wm8753.c - SoC audio for Openmoko Neo1973 and Freerunner devices
+//
+// Copyright 2007 Openmoko Inc
+// Author: Graeme Gregory <graeme@openmoko.org>
+// Copyright 2007 Wolfson Microelectronics PLC.
+// Author: Graeme Gregory
+//         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+// Copyright 2009 Wolfson Microelectronics
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.17.1
