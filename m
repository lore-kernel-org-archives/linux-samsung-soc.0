Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3538C4361A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 16:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE7A52223E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 16:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgLDQM1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 11:12:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:46388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgLDQM1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 11:12:27 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-mtd@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [for NAND] ARM: s3c: gta02: fix for missing linux/mtd/nand_ecc.h
Date:   Fri,  4 Dec 2020 17:10:12 +0100
Message-Id: <20201204161137.2729220-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The header file got renamed, so any file including it needs to
be adapted to avoid:

arch/arm/mach-s3c/mach-gta02.c:40:10: fatal error: 'linux/mtd/nand_ecc.h' file not found

Fixes: 3f27bb3e3777 ("mtd: nand: ecc-hamming: Move Hamming code to the generic NAND layer")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
It's currently broken in -next because of the change in the
MTD NAND driver. Please add this patch to the same branch or
fold it into the patch that broke it.
---
 arch/arm/mach-s3c/common-smdk-s3c24xx.c | 2 +-
 arch/arm/mach-s3c/mach-anubis.c         | 2 +-
 arch/arm/mach-s3c/mach-at2440evb.c      | 2 +-
 arch/arm/mach-s3c/mach-bast.c           | 2 +-
 arch/arm/mach-s3c/mach-gta02.c          | 2 +-
 arch/arm/mach-s3c/mach-jive.c           | 2 +-
 arch/arm/mach-s3c/mach-mini2440.c       | 2 +-
 arch/arm/mach-s3c/mach-osiris.c         | 2 +-
 arch/arm/mach-s3c/mach-qt2410.c         | 2 +-
 arch/arm/mach-s3c/mach-rx3715.c         | 2 +-
 arch/arm/mach-s3c/mach-vstms.c          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c/common-smdk-s3c24xx.c b/arch/arm/mach-s3c/common-smdk-s3c24xx.c
index f860d8bcba0e..6d124bbd384c 100644
--- a/arch/arm/mach-s3c/common-smdk-s3c24xx.c
+++ b/arch/arm/mach-s3c/common-smdk-s3c24xx.c
@@ -20,7 +20,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 
diff --git a/arch/arm/mach-s3c/mach-anubis.c b/arch/arm/mach-s3c/mach-anubis.c
index 90e3fd98a3ac..04147cc0adcc 100644
--- a/arch/arm/mach-s3c/mach-anubis.c
+++ b/arch/arm/mach-s3c/mach-anubis.c
@@ -34,7 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <net/ax88796.h>
diff --git a/arch/arm/mach-s3c/mach-at2440evb.c b/arch/arm/mach-s3c/mach-at2440evb.c
index 5fa49d4e2650..c6a5a51d84aa 100644
--- a/arch/arm/mach-s3c/mach-at2440evb.c
+++ b/arch/arm/mach-s3c/mach-at2440evb.c
@@ -35,7 +35,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "devs.h"
diff --git a/arch/arm/mach-s3c/mach-bast.c b/arch/arm/mach-s3c/mach-bast.c
index 328f5d9ae9f9..27e8d5950228 100644
--- a/arch/arm/mach-s3c/mach-bast.c
+++ b/arch/arm/mach-s3c/mach-bast.c
@@ -24,7 +24,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index 3c75c7d112ea..aec8b451c016 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -37,7 +37,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 
diff --git a/arch/arm/mach-s3c/mach-jive.c b/arch/arm/mach-s3c/mach-jive.c
index 2a29c3eca559..0785638a9069 100644
--- a/arch/arm/mach-s3c/mach-jive.c
+++ b/arch/arm/mach-s3c/mach-jive.c
@@ -40,7 +40,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "gpio-cfg.h"
diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
index dc22ab839b95..4100905dfbd0 100644
--- a/arch/arm/mach-s3c/mach-mini2440.c
+++ b/arch/arm/mach-s3c/mach-mini2440.c
@@ -44,7 +44,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "gpio-cfg.h"
diff --git a/arch/arm/mach-s3c/mach-osiris.c b/arch/arm/mach-s3c/mach-osiris.c
index 81744ca67d1d..3aefb9d22340 100644
--- a/arch/arm/mach-s3c/mach-osiris.c
+++ b/arch/arm/mach-s3c/mach-osiris.c
@@ -33,7 +33,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "cpu.h"
diff --git a/arch/arm/mach-s3c/mach-qt2410.c b/arch/arm/mach-s3c/mach-qt2410.c
index 151e8e373d40..f88b961798fd 100644
--- a/arch/arm/mach-s3c/mach-qt2410.c
+++ b/arch/arm/mach-s3c/mach-qt2410.c
@@ -21,7 +21,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c/mach-rx3715.c b/arch/arm/mach-s3c/mach-rx3715.c
index a03662a47b38..9fd2d9dc3689 100644
--- a/arch/arm/mach-s3c/mach-rx3715.c
+++ b/arch/arm/mach-s3c/mach-rx3715.c
@@ -22,7 +22,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c/mach-vstms.c b/arch/arm/mach-s3c/mach-vstms.c
index 05f19f5ffabb..ec024af7b0ce 100644
--- a/arch/arm/mach-s3c/mach-vstms.c
+++ b/arch/arm/mach-s3c/mach-vstms.c
@@ -16,7 +16,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
 
-- 
2.27.0

