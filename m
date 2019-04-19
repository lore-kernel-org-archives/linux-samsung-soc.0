From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 04/27] ASoC: samsung: h1940_uda1380: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:39 +0200
Message-ID: <20190419102202.4384-5-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102231epcas2p450050b6853ff4c466f0f9f7ac99ce9cc@epcas2p4.samsung.com>
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
 sound/soc/samsung/h1940_uda1380.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index 051935162d7b..95925c4a5964 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -1,17 +1,11 @@
-/*
- * h1940-uda1380.c  --  ALSA Soc Audio Layer
- *
- * Copyright (c) 2010 Arnaud Patard <arnaud.patard@rtp-net.org>
- * Copyright (c) 2010 Vasily Khoruzhick <anarsoul@gmail.com>
- *
- * Based on version from Arnaud Patard <arnaud.patard@rtp-net.org>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// h1940_uda1380.c - ALSA SoC Audio Layer
+//
+// Copyright (c) 2010 Arnaud Patard <arnaud.patard@rtp-net.org>
+// Copyright (c) 2010 Vasily Khoruzhick <anarsoul@gmail.com>
+//
+// Based on version from Arnaud Patard <arnaud.patard@rtp-net.org>
 
 #include <linux/types.h>
 #include <linux/gpio.h>
-- 
2.17.1
