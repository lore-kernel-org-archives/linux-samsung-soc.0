Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FB0C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Mar 2022 10:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbiCRKjO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbiCRKjL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 06:39:11 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5E189082;
        Fri, 18 Mar 2022 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p2DsKRIfJAKnyrOWZC9Lcb+EyviQhiSJwwjBHtoeu/c=;
  b=ZFXn0x0bj/eZ1cFTbnn8EFZHCMnQRK2z83HGpTM4KUIWFzUfi5OCQ4M5
   PX6a7dGf18WOigs+up4SzMiA8mHL11Glgg+NhAZaGJ69uCOzuCjv3E9kQ
   B8hNpWqOU9b+Jon1n/Ll/q4aogNvqwBOym1rjGMSjRLMU05i3nIdMyj3m
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,192,1643670000"; 
   d="scan'208";a="8935671"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:37:40 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Russell King <linux@armlinux.org.uk>
Cc:     kernel-janitors@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s3c: fix typos in comments
Date:   Fri, 18 Mar 2022 11:37:26 +0100
Message-Id: <20220318103729.157574-31-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/arm/mach-s3c/iotiming-s3c2410.c |    2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/iotiming-s3c2410.c b/arch/arm/mach-s3c/iotiming-s3c2410.c
index 28d9f473e24a..09f388d8f824 100644
--- a/arch/arm/mach-s3c/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c/iotiming-s3c2410.c
@@ -259,7 +259,7 @@ static const unsigned int tacc_tab[] = {
 /**
  * get_tacc - turn tACC value into cycle time
  * @hclk_tns: The cycle time for HCLK, in 10ths of nanoseconds.
- * @val: The bank timing register value, shifed down.
+ * @val: The bank timing register value, shifted down.
  */
 static unsigned int get_tacc(unsigned long hclk_tns,
 			     unsigned long val)
diff --git a/arch/arm/mach-s3c/pm-s3c64xx.c b/arch/arm/mach-s3c/pm-s3c64xx.c
index 4f1778123dee..2529f21736ff 100644
--- a/arch/arm/mach-s3c/pm-s3c64xx.c
+++ b/arch/arm/mach-s3c/pm-s3c64xx.c
@@ -323,7 +323,7 @@ void s3c_pm_arch_update_uart(void __iomem *regs, struct pm_uart_save *save)
 
 	/* S3C64XX UART blocks only support level interrupts, so ensure that
 	 * when we restore unused UART blocks we force the level interrupt
-	 * settigs. */
+	 * settings. */
 	save->ucon |= S3C2410_UCON_TXILEVEL | S3C2410_UCON_RXILEVEL;
 
 	/* We have a constraint on changing the clock type of the UART

