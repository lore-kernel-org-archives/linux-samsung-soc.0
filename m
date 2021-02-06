Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B16CC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BA8D64E5A
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhBFNhI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Feb 2021 08:37:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:37064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhBFNhG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 08:37:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 992EF64D9D;
        Sat,  6 Feb 2021 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612618585;
        bh=OCutRLaQDUvL3uLcorCbLXFfU+phdrBOkd6W0QNIyHU=;
        h=From:To:Cc:Subject:Date:From;
        b=Gjy7LkMwkG2XjFdp4fJH1gwZ7U6oWqDAMR7x7fSTXwIR81QloVBam/e76tvJeOdij
         t6XKWFE6fRcH1m1kgVAqK9AfTycrmk6NFRVRgyJUSpp6aBBlFEQfJyv4pDEyGbqj/G
         zmCj8ir/h3UJKxCGAViokpx4Jlj8HsFpscLfEnrTYrJy+W9rTCTwRcW0c6wYDR1Sff
         /LS5aQJkjuGCowUmRyD//uF5Ro/78c31q1Lm7ARsPH9ab9QYjaxc5sWPntM54kngcX
         3zfR/71fUrRYRNqNQx35HM4VEboHt5AFOQkBHmov7uPfqzQ0mXyTcCeDm7KPzSib3R
         MSEfF4+FonUaQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] ARM: s3c: irq-s3c24xx: include headers for missing declarations
Date:   Sat,  6 Feb 2021 14:36:14 +0100
Message-Id: <20210206133615.119804-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Include headers to fix W=1 build warnings:

  arch/arm/mach-s3c/irq-s3c24xx.c:389:5: warning:
    no previous prototype for ‘s3c24xx_set_fiq’ [-Wmissing-prototypes]
  arch/arm/mach-s3c/irq-s3c24xx.c:683:13: warning:
    no previous prototype for ‘s3c2410_init_irq’ [-Wmissing-prototypes]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c/irq-s3c24xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
index 79b5f19af7a5..3368159d3f3e 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c/irq-s3c24xx.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/spi/s3c24xx.h>
 
 #include <asm/exception.h>
 #include <asm/mach/irq.h>
@@ -32,6 +33,7 @@
 #include "cpu.h"
 #include "regs-irqtype.h"
 #include "pm.h"
+#include "s3c24xx.h"
 
 #define S3C_IRQTYPE_NONE	0
 #define S3C_IRQTYPE_EINT	1
-- 
2.25.1

