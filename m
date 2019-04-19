From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 05/27] ASoC: samsung: i2s: Convert to SPDX
 License Identifier
Date: Fri, 19 Apr 2019 12:21:40 +0200
Message-ID: <20190419102202.4384-6-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102234epcas1p2f07fc4e9e40d5d9d60a33d52c37ff2bd@epcas1p2.samsung.com>
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

Replace remaining GPL v2.0 license statements with SPDX license
identifier.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s-regs.h | 8 +-------
 sound/soc/samsung/i2s.h      | 8 ++------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
index 964985ea2e80..b4b5d6053503 100644
--- a/sound/soc/samsung/i2s-regs.h
+++ b/sound/soc/samsung/i2s-regs.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * linux/sound/soc/samsung/i2s-regs.h
- *
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
  * Samsung I2S driver's register header
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
  */
 
 #ifndef __SND_SOC_SAMSUNG_I2S_REGS_H
diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
index a9832a9555cb..78b475ef98d9 100644
--- a/sound/soc/samsung/i2s.h
+++ b/sound/soc/samsung/i2s.h
@@ -1,13 +1,9 @@
-/* sound/soc/samsung/i2s.h
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * ALSA SoC Audio Layer - Samsung I2S Controller driver
  *
  * Copyright (c) 2010 Samsung Electronics Co. Ltd.
  *	Jaswinder Singh <jassisinghbrar@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef __SND_SOC_SAMSUNG_I2S_H
-- 
2.17.1
