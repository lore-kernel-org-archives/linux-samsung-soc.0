From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 25/27] ASoC: samsung: speyside: Convert to SPDX
 License Identifier
Date: Fri, 19 Apr 2019 12:22:00 +0200
Message-ID: <20190419102202.4384-26-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102340epcas2p10c88390f4140697e478c5504ece37521@epcas2p1.samsung.com>
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
 sound/soc/samsung/speyside.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 4b4147d07804..15465c84daa3 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -1,13 +1,8 @@
-/*
- * Speyside audio support
- *
- * Copyright 2011 Wolfson Microelectronics
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Speyside audio support
+//
+// Copyright 2011 Wolfson Microelectronics
 
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-- 
2.17.1
