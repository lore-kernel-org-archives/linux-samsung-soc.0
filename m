From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] rtc: s5m: Add SPDX license identifier
Date: Tue,  7 Aug 2018 18:19:19 +0200
Message-ID: <20180807161919.7827-2-krzk@kernel.org>
References: <20180807161919.7827-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161919.7827-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0+ license statement with SPDX license
identifier.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/rtc-s5m.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 8428455432ca..6495f84f7428 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -1,19 +1,9 @@
-/*
- * Copyright (c) 2013-2014 Samsung Electronics Co., Ltd
- *	http://www.samsung.com
- *
- *  Copyright (C) 2013 Google, Inc
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2013-2014 Samsung Electronics Co., Ltd
+//	http://www.samsung.com
+//
+//  Copyright (C) 2013 Google, Inc
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-- 
2.14.1
