From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] regulator: samsung: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:18:26 +0200
Message-ID: <20180807161826.2222-2-krzk@kernel.org>
References: <20180807161826.2222-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161826.2222-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0+ license statements with SPDX license
identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mpa01.c | 14 ++++----------
 drivers/regulator/s2mps11.c | 21 ++++-----------------
 drivers/regulator/s5m8767.c | 16 ++++------------
 3 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 48f0ca90743c..095d25f3d2ea 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -1,13 +1,7 @@
-/*
- * Copyright (c) 2013 Samsung Electronics Co., Ltd
- *		http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2013 Samsung Electronics Co., Ltd
+//		http://www.samsung.com
 
 #include <linux/bug.h>
 #include <linux/err.h>
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d1207ec683db..5bb6f4ca48db 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1,20 +1,7 @@
-/*
- * s2mps11.c
- *
- * Copyright (c) 2012-2014 Samsung Electronics Co., Ltd
- *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2012-2014 Samsung Electronics Co., Ltd
+//              http://www.samsung.com
 
 #include <linux/bug.h>
 #include <linux/err.h>
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 0cbc980753c2..667d16dc83ce 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -1,15 +1,7 @@
-/*
- * s5m8767.c
- *
- * Copyright (c) 2011 Samsung Electronics Co., Ltd
- *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2011 Samsung Electronics Co., Ltd
+//              http://www.samsung.com
 
 #include <linux/err.h>
 #include <linux/of_gpio.h>
-- 
2.14.1
