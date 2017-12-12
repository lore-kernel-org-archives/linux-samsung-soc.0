From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH] spi: s3c64xx: add SPDX identifier
Date: Tue, 12 Dec 2017 16:58:15 +0900
Message-ID: <20171212075815.8683-1-andi.shyti@samsung.com>
References: <CGME20171212075830epcas2p31afc4a2e715e857694082748fd2bbe49@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33658 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdLLH6d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 02:58:33 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Replace the original license statement with the SPDX identifier.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/spi/spi-s3c64xx.c                 | 18 ++++--------------
 include/linux/platform_data/spi-s3c64xx.h |  4 +---
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index de7df20f8712..7ef68d45edfb 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1,17 +1,7 @@
-/*
- * Copyright (C) 2009 Samsung Electronics Ltd.
- *	Jaswinder Singh <jassi.brar@samsung.com>
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
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2009 Samsung Electronics Co., Ltd.
+//      Jaswinder Singh <jassi.brar@samsung.com>
 
 #include <linux/init.h>
 #include <linux/module.h>
diff --git a/include/linux/platform_data/spi-s3c64xx.h b/include/linux/platform_data/spi-s3c64xx.h
index da79774078a7..8917f38c97c5 100644
--- a/include/linux/platform_data/spi-s3c64xx.h
+++ b/include/linux/platform_data/spi-s3c64xx.h
@@ -2,9 +2,7 @@
  * Copyright (C) 2009 Samsung Electronics Ltd.
  *	Jaswinder Singh <jassi.brar@samsung.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
+ * SPDX-License-Identifier: GPL-2.0
  */
 
 #ifndef __SPI_S3C64XX_H
-- 
2.15.1
