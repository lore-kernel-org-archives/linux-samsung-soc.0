From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 13/13] ASoC: samsung: i2s: Convert to SPDX
 License Indentifier
Date: Wed, 13 Feb 2019 19:42:12 +0100
Message-ID: <20190213184212.5473-14-s.nawrocki@samsung.com>
References: <20190213184212.5473-1-s.nawrocki@samsung.com>
 <CGME20190213184338epcas2p4a0384a9160084df777c92dd5bf55f04a@epcas2p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20190213184212.5473-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0 license statements with SPDX license identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 4f13b514d9ce..5ffeb0129712 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1,13 +1,9 @@
-/*
- * ALSA SoC Audio Layer - Samsung I2S Controller driver
- *
- * Copyright (c) 2010 Samsung Electronics Co. Ltd.
- *	Jaswinder Singh <jassisinghbrar@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Audio Layer - Samsung I2S Controller driver
+//
+// Copyright (c) 2010 Samsung Electronics Co. Ltd.
+// 	Jaswinder Singh <jassisinghbrar@gmail.com>
 
 #include <dt-bindings/sound/samsung-i2s.h>
 #include <linux/delay.h>
-- 
2.17.1
