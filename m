From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] regulator: maxim: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:18:25 +0200
Message-ID: <20180807161826.2222-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0 and v2.0+ license statements with SPDX license
identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/max14577-regulator.c         | 22 +++++------------
 drivers/regulator/max77686-regulator.c         | 32 +++++++-----------------
 drivers/regulator/max77693-regulator.c         | 32 +++++++-----------------
 drivers/regulator/max77802-regulator.c         | 34 +++++++++-----------------
 drivers/regulator/max8997-regulator.c          | 30 ++++++-----------------
 drivers/regulator/max8998.c                    | 28 ++++++---------------
 include/dt-bindings/regulator/maxim,max77802.h |  5 +---
 7 files changed, 52 insertions(+), 131 deletions(-)

diff --git a/drivers/regulator/max14577-regulator.c b/drivers/regulator/max14577-regulator.c
index 0db288ce319c..bc7f4751bf9c 100644
--- a/drivers/regulator/max14577-regulator.c
+++ b/drivers/regulator/max14577-regulator.c
@@ -1,19 +1,9 @@
-/*
- * max14577.c - Regulator driver for the Maxim 14577/77836
- *
- * Copyright (C) 2013,2014 Samsung Electronics
- * Krzysztof Kozlowski <krzk@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max14577.c - Regulator driver for the Maxim 14577/77836
+//
+// Copyright (C) 2013,2014 Samsung Electronics
+// Krzysztof Kozlowski <krzk@kernel.org>
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/drivers/regulator/max77686-regulator.c b/drivers/regulator/max77686-regulator.c
index c301f3733475..bee060937f56 100644
--- a/drivers/regulator/max77686-regulator.c
+++ b/drivers/regulator/max77686-regulator.c
@@ -1,26 +1,12 @@
-/*
- * max77686.c - Regulator driver for the Maxim 77686
- *
- * Copyright (C) 2012 Samsung Electronics
- * Chiwoong Byun <woong.byun@samsung.com>
- * Jonghwa Lee <jonghwa3.lee@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
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
- * This driver is based on max8997.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max77686.c - Regulator driver for the Maxim 77686
+//
+// Copyright (C) 2012 Samsung Electronics
+// Chiwoong Byun <woong.byun@samsung.com>
+// Jonghwa Lee <jonghwa3.lee@samsung.com>
+//
+// This driver is based on max8997.c
 
 #include <linux/kernel.h>
 #include <linux/bug.h>
diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
index e7000e777292..077ecbbfdf76 100644
--- a/drivers/regulator/max77693-regulator.c
+++ b/drivers/regulator/max77693-regulator.c
@@ -1,26 +1,12 @@
-/*
- * max77693.c - Regulator driver for the Maxim 77693 and 77843
- *
- * Copyright (C) 2013-2015 Samsung Electronics
- * Jonghwa Lee <jonghwa3.lee@samsung.com>
- * Krzysztof Kozlowski <krzk@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
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
- * This driver is based on max77686.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max77693.c - Regulator driver for the Maxim 77693 and 77843
+//
+// Copyright (C) 2013-2015 Samsung Electronics
+// Jonghwa Lee <jonghwa3.lee@samsung.com>
+// Krzysztof Kozlowski <krzk@kernel.org>
+//
+// This driver is based on max77686.c
 
 #include <linux/err.h>
 #include <linux/slab.h>
diff --git a/drivers/regulator/max77802-regulator.c b/drivers/regulator/max77802-regulator.c
index b6261903818c..c30cf5c9f2de 100644
--- a/drivers/regulator/max77802-regulator.c
+++ b/drivers/regulator/max77802-regulator.c
@@ -1,25 +1,15 @@
-/*
- * max77802.c - Regulator driver for the Maxim 77802
- *
- * Copyright (C) 2013-2014 Google, Inc
- * Simon Glass <sjg@chromium.org>
- *
- * Copyright (C) 2012 Samsung Electronics
- * Chiwoong Byun <woong.byun@samsung.com>
- * Jonghwa Lee <jonghwa3.lee@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * This driver is based on max8997.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max77802.c - Regulator driver for the Maxim 77802
+//
+// Copyright (C) 2013-2014 Google, Inc
+// Simon Glass <sjg@chromium.org>
+//
+// Copyright (C) 2012 Samsung Electronics
+// Chiwoong Byun <woong.byun@samsung.com>
+// Jonghwa Lee <jonghwa3.lee@samsung.com>
+//
+// This driver is based on max8997.c
 
 #include <linux/kernel.h>
 #include <linux/bug.h>
diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index 029a6ee426ab..ad0c806b0737 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -1,25 +1,11 @@
-/*
- * max8997.c - Regulator driver for the Maxim 8997/8966
- *
- * Copyright (C) 2011 Samsung Electronics
- * MyungJoo Ham <myungjoo.ham@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
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
- * This driver is based on max8998.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max8997.c - Regulator driver for the Maxim 8997/8966
+//
+// Copyright (C) 2011 Samsung Electronics
+// MyungJoo Ham <myungjoo.ham@samsung.com>
+//
+// This driver is based on max8998.c
 
 #include <linux/bug.h>
 #include <linux/err.h>
diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.c
index 6b9f262ebbb0..271bb736f3f5 100644
--- a/drivers/regulator/max8998.c
+++ b/drivers/regulator/max8998.c
@@ -1,24 +1,10 @@
-/*
- * max8998.c - Voltage regulator driver for the Maxim 8998
- *
- *  Copyright (C) 2009-2010 Samsung Electronics
- *  Kyungmin Park <kyungmin.park@samsung.com>
- *  Marek Szyprowski <m.szyprowski@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max8998.c - Voltage regulator driver for the Maxim 8998
+//
+//  Copyright (C) 2009-2010 Samsung Electronics
+//  Kyungmin Park <kyungmin.park@samsung.com>
+//  Marek Szyprowski <m.szyprowski@samsung.com>
 
 #include <linux/module.h>
 #include <linux/init.h>
diff --git a/include/dt-bindings/regulator/maxim,max77802.h b/include/dt-bindings/regulator/maxim,max77802.h
index cf28631d7109..d0baba1973d4 100644
--- a/include/dt-bindings/regulator/maxim,max77802.h
+++ b/include/dt-bindings/regulator/maxim,max77802.h
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2014 Google, Inc
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Device Tree binding constants for the Maxim 77802 PMIC regulators
  */
 
-- 
2.14.1
