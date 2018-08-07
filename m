From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] clk: max77686: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:17:11 +0200
Message-ID: <20180807161713.28073-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0 and v2.0+ license statements with SPDX license
identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-max77686.c                 | 27 ++++++---------------------
 include/dt-bindings/clock/maxim,max77686.h |  5 +----
 include/dt-bindings/clock/maxim,max77802.h |  5 +----
 3 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index eb953d3b0b69..02551fe4b87c 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -1,24 +1,9 @@
-/*
- * clk-max77686.c - Clock driver for Maxim 77686/MAX77802
- *
- * Copyright (C) 2012 Samsung Electornics
- * Jonghwa Lee <jonghwa3.lee@samsung.com>
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
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// clk-max77686.c - Clock driver for Maxim 77686/MAX77802
+//
+// Copyright (C) 2012 Samsung Electornics
+// Jonghwa Lee <jonghwa3.lee@samsung.com>
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/include/dt-bindings/clock/maxim,max77686.h b/include/dt-bindings/clock/maxim,max77686.h
index 7b28b0905869..af8261dcace1 100644
--- a/include/dt-bindings/clock/maxim,max77686.h
+++ b/include/dt-bindings/clock/maxim,max77686.h
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2014 Google, Inc
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Device Tree binding constants clocks for the Maxim 77686 PMIC.
  */
 
diff --git a/include/dt-bindings/clock/maxim,max77802.h b/include/dt-bindings/clock/maxim,max77802.h
index 997312edcbb5..51adcbaed697 100644
--- a/include/dt-bindings/clock/maxim,max77802.h
+++ b/include/dt-bindings/clock/maxim,max77802.h
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2014 Google, Inc
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Device Tree binding constants clocks for the Maxim 77802 PMIC.
  */
 
-- 
2.14.1
