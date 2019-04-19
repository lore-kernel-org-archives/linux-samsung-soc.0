From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 22/27] ASoC: samsung: smdk_wm8994*: Convert to
 SPDX License Identifier
Date: Fri, 19 Apr 2019 12:21:57 +0200
Message-ID: <20190419102202.4384-23-s.nawrocki@samsung.com>
References: <20190419102202.4384-1-s.nawrocki@samsung.com>
 <CGME20190419102330epcas2p2ec246e5a747ef9cd8dfa0281128d795f@epcas2p2.samsung.com>
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
 sound/soc/samsung/smdk_wm8994.c    |  9 +--------
 sound/soc/samsung/smdk_wm8994pcm.c | 16 +++++-----------
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index ff57b192d37d..135d8c2745be 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -1,11 +1,4 @@
-/*
- *  smdk_wm8994.c
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
 
 #include "../codecs/wm8994.h"
 #include <sound/pcm_params.h>
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 2e621496be8b..43171d6457fa 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -1,14 +1,8 @@
-/*
- *  sound/soc/samsung/smdk_wm8994pcm.c
- *
- *  Copyright (c) 2011 Samsung Electronics Co., Ltd
- *		http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or  modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2011 Samsung Electronics Co., Ltd
+//		http://www.samsung.com
+
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
-- 
2.17.1
