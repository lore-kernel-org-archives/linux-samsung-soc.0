From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/3] clk: s2mps11,s3c64xx: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:17:12 +0200
Message-ID: <20180807161713.28073-2-krzk@kernel.org>
References: <20180807161713.28073-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161713.28073-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0 and v2.0+ license statements with SPDX license
identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-s2mps11.c                         | 21 +++++----------------
 include/dt-bindings/clock/samsung,s2mps11.h       |  5 +----
 include/dt-bindings/clock/samsung,s3c64xx-clock.h |  7 ++-----
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d44e0eea31ec..ebf9115dad1d 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -1,19 +1,8 @@
-/*
- * clk-s2mps11.c - Clock driver for S2MPS11.
- *
- * Copyright (C) 2013,2014 Samsung Electornics
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
+// clk-s2mps11.c - Clock driver for S2MPS11.
+//
+// Copyright (C) 2013,2014 Samsung Electornics
 
 #include <linux/module.h>
 #include <linux/err.h>
diff --git a/include/dt-bindings/clock/samsung,s2mps11.h b/include/dt-bindings/clock/samsung,s2mps11.h
index b903d7de27c9..5ece35d429ff 100644
--- a/include/dt-bindings/clock/samsung,s2mps11.h
+++ b/include/dt-bindings/clock/samsung,s2mps11.h
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2015 Markus Reichl
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Device Tree binding constants clocks for the Samsung S2MPS11 PMIC.
  */
 
diff --git a/include/dt-bindings/clock/samsung,s3c64xx-clock.h b/include/dt-bindings/clock/samsung,s3c64xx-clock.h
index ad95c7f50090..19d233f37e2f 100644
--- a/include/dt-bindings/clock/samsung,s3c64xx-clock.h
+++ b/include/dt-bindings/clock/samsung,s3c64xx-clock.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2013 Tomasz Figa <tomasz.figa at gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Device Tree binding constants for Samsung S3C64xx clock controller.
-*/
+ */
 
 #ifndef _DT_BINDINGS_CLOCK_SAMSUNG_S3C64XX_CLOCK_H
 #define _DT_BINDINGS_CLOCK_SAMSUNG_S3C64XX_CLOCK_H
-- 
2.14.1
