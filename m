Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4181C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02CCC22CAF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739111;
	bh=0MX3E7Ne/rPTcgcCD1XqjJDdOiBT4MRY8ces7kKdkI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=A7lQ23ZFow6qwqaSICMTyId+/NqHR+72J5z6Dpah+qDlb++viPVneXJw+qe7NZHhB
	 ApX4OULwI9JScsG58XsvVFU1KO8lmK7zlRdq2J7rXg2NJ0LRzibRxFZ8q0pnEkmv5r
	 0EU74I5NGg6LIjnES1tOukERPExaT6lS6wZvauH4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgHFSiW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbgHFSem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:42 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEDFC0617A4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so44964951wrw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=V3y99kd2tPx0hPfBwbQWWtWVC6kReg6jovRfFDOxi40=;
        b=ultH95NJoSvz5kpjFGtB572RCxTosK97m5bXic8Digmmga0iwF80lYFMuGK0ED2sPG
         bapYdyhOUSDlP3ZL7f/xQBPYPfXeB5Q6K5ePJfHHXM0sCfFTXlm69CJc+FHk7+OGuWSG
         vU/+lLFnkb47te2gsZhhOvlloJXtnCz9zA0YdY/jXXrSQOL42EIYQuOq+PPYpq/daYb1
         7hCb3nYf0zHtMdHUpIp4K3ztkeuzt2s+vlU56to2O1topoZ6DL5nMi8MK9HI3cNORc6m
         7C1L1dQDoEWRBtM5/IH9CD9KVV3U/zW9joRoMW6VshL9j5x3qK2TaZEZ9OGK6fm2UEu5
         SeTA==
X-Gm-Message-State: AOAM530GGY+/jhMeYtxl8vfZgN5ur+AXTp399bar5D5UUBC1iICwopj0
        IWMGAFoie9e69PcJJpbV4VsY4BLLPG8=
X-Google-Smtp-Source: ABdhPJzE8gNyJqOBikEwSNZyOr2vNA+OvrZ9Kq4oo3UhnnzH+4wBYeKZFQBo1gDCmsKJdXUc8nV7MQ==
X-Received: by 2002:a05:6000:142:: with SMTP id r2mr9306418wrx.103.1596738861536;
        Thu, 06 Aug 2020 11:34:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id f9sm7171649wrm.62.2020.08.06.11.34.21
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:21 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541961lta;
        Thu, 6 Aug 2020 11:23:59 -0700 (PDT)
X-Received: by 2002:a63:4281:: with SMTP id p123mr7981709pga.94.1596738239299;
        Thu, 06 Aug 2020 11:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738239; cv=none;
        d=google.com; s=arc-20160816;
        b=qsagtVQ5XEjDzhvtGIO+U10tQTkfT3XLlVVZisasD+Xl1r512pIux5BIbnxR7l+EfT
         51mfwzD/TvDAT7KdJxF9rgrFwuVp3WATOsIiZ/LPr1Px6Vxw5VueiiF/C/fTULrti9cU
         YjTnWVh+I8zgNP7bA7jE2Yc/wHjUA5/G+DpdwXUwLaTVK1usHIJRlM7GE4tTj7T0MJwk
         yTOgl7qH33OH7Ppv/F+wsiIlfg65wOkPNb/x06ulgp9oOUI82ET+zhalBPCPYy5hhsdT
         QINQ1O23Iug5EwQWsI2jTS/j9ibhbpyQsvbexaQUGIKl5SexhYJDsIqQg/nOtLojajpI
         xG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=V3y99kd2tPx0hPfBwbQWWtWVC6kReg6jovRfFDOxi40=;
        b=UllXfSZZoSuL7oElgcqFBsQk99G+wMiwuNpq7EW5qc7rWpvNDtWohkwRzjecphygsP
         9lRkcEDNDsIQwTKBv+ws4zLxKP851iTSDIa6N+iwJFYS/FcIqXNSpfVwQ+84Rn9rmFad
         scBM8JwwGjdYvT8tnm3C8wv8AyF17H1K0a/9QBPmn0hh7poYcnCk65fOmgeANMWTq9Ku
         7zMDw7PEAfK17rLOBWRJekbFeNA5rA50Ok+oIlBeksVjSuhZORbce6jJPeRXpcQZNIJD
         NqYLZO3zDtAkSld1PKoy5W9HvBfJ/M37z+/diJRMe4eYKSLDSkcqp/IshPqNgeHP6NqW
         Ck9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=Fpd7yEIe;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id b3si3808195pgw.510.2020.08.06.11.23.59
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 6A69722EBE; Thu,  6 Aug 2020 18:23:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DB5D22E01;
        Thu,  6 Aug 2020 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738239;
        bh=0MX3E7Ne/rPTcgcCD1XqjJDdOiBT4MRY8ces7kKdkI0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fpd7yEIes202ZGrwsi7XioG0nprsSaGhvANyXicNmF1IjIGUhWmE9/7lvAIMALBiK
         UzCilFjlVt/VkB23Su1aGrP5eF+NC20P24Jgxn8ZBHgS+WWTblxxxZzbJVt0dH1P3e
         DdO2vM6jvaB47RBJfmB1NZYiu8fsK4bL7CWPXc3A=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>, Andi Shyti <andi@etezian.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 31/41] ARM: s3c24xx: spi: avoid hardcoding fiq number in driver
Date:   Thu,  6 Aug 2020 20:20:48 +0200
Message-Id: <20200806182059.2431-31-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: o4q7iWKhFpf2
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The IRQ_EINT0 constant is a platform detail that is
defined in mach/irqs.h and not visible to drivers once
that header is made private.

Since the same calculation already happens in s3c24xx_set_fiq,
just return the value from there.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/irq-s3c24xx.c | 12 +++++++++---
 drivers/spi/spi-s3c24xx.c           | 18 ++----------------
 include/linux/spi/s3c24xx.h         |  2 +-
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/irq-s3c24xx.c b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
index b0e879ee14c1..3965347cacf0 100644
--- a/arch/arm/mach-s3c24xx/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
@@ -376,14 +376,17 @@ asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
 /**
  * s3c24xx_set_fiq - set the FIQ routing
  * @irq: IRQ number to route to FIQ on processor.
+ * @ack_ptr: pointer to a location for storing the bit mask
  * @on: Whether to route @irq to the FIQ, or to remove the FIQ routing.
  *
  * Change the state of the IRQ to FIQ routing depending on @irq and @on. If
  * @on is true, the @irq is checked to see if it can be routed and the
  * interrupt controller updated to route the IRQ. If @on is false, the FIQ
  * routing is cleared, regardless of which @irq is specified.
+ *
+ * returns the mask value for the register.
  */
-int s3c24xx_set_fiq(unsigned int irq, bool on)
+int s3c24xx_set_fiq(unsigned int irq, u32 *ack_ptr, bool on)
 {
 	u32 intmod;
 	unsigned offs;
@@ -391,15 +394,18 @@ int s3c24xx_set_fiq(unsigned int irq, bool on)
 	if (on) {
 		offs = irq - FIQ_START;
 		if (offs > 31)
-			return -EINVAL;
+			return 0;
 
 		intmod = 1 << offs;
 	} else {
 		intmod = 0;
 	}
 
+	if (ack_ptr)
+		*ack_ptr = intmod;
 	writel_relaxed(intmod, S3C2410_INTMOD);
-	return 0;
+
+	return intmod;
 }
 
 EXPORT_SYMBOL_GPL(s3c24xx_set_fiq);
diff --git a/drivers/spi/spi-s3c24xx.c b/drivers/spi/spi-s3c24xx.c
index e7a4732590db..d6f51695ca5b 100644
--- a/drivers/spi/spi-s3c24xx.c
+++ b/drivers/spi/spi-s3c24xx.c
@@ -229,17 +229,6 @@ struct spi_fiq_code {
 	u8	data[];
 };
 
-/**
- * ack_bit - turn IRQ into IRQ acknowledgement bit
- * @irq: The interrupt number
- *
- * Returns the bit to write to the interrupt acknowledge register.
- */
-static inline u32 ack_bit(unsigned int irq)
-{
-	return 1 << (irq - IRQ_EINT0);
-}
-
 /**
  * s3c24xx_spi_tryfiq - attempt to claim and setup FIQ for transfer
  * @hw: The hardware state.
@@ -256,6 +245,7 @@ static void s3c24xx_spi_tryfiq(struct s3c24xx_spi *hw)
 	struct pt_regs regs;
 	enum spi_fiq_mode mode;
 	struct spi_fiq_code *code;
+	u32 *ack_ptr = NULL;
 	int ret;
 
 	if (!hw->fiq_claimed) {
@@ -282,8 +272,6 @@ static void s3c24xx_spi_tryfiq(struct s3c24xx_spi *hw)
 	set_fiq_regs(&regs);
 
 	if (hw->fiq_mode != mode) {
-		u32 *ack_ptr;
-
 		hw->fiq_mode = mode;
 
 		switch (mode) {
@@ -303,12 +291,10 @@ static void s3c24xx_spi_tryfiq(struct s3c24xx_spi *hw)
 		BUG_ON(!code);
 
 		ack_ptr = (u32 *)&code->data[code->ack_offset];
-		*ack_ptr = ack_bit(hw->irq);
-
 		set_fiq_handler(&code->data, code->length);
 	}
 
-	s3c24xx_set_fiq(hw->irq, true);
+	s3c24xx_set_fiq(hw->irq, ack_ptr, true);
 
 	hw->fiq_mode = mode;
 	hw->fiq_inuse = 1;
diff --git a/include/linux/spi/s3c24xx.h b/include/linux/spi/s3c24xx.h
index c91d10b82f08..440a71593162 100644
--- a/include/linux/spi/s3c24xx.h
+++ b/include/linux/spi/s3c24xx.h
@@ -20,6 +20,6 @@ struct s3c2410_spi_info {
 	void (*set_cs)(struct s3c2410_spi_info *spi, int cs, int pol);
 };
 
-extern int s3c24xx_set_fiq(unsigned int irq, bool on);
+extern int s3c24xx_set_fiq(unsigned int irq, u32 *ack_ptr, bool on);
 
 #endif /* __LINUX_SPI_S3C24XX_H */
-- 
2.17.1

