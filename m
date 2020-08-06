Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B54C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1290D206B5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738953;
	bh=41DB04g7bnvHlbjYbY4BAew/yHdDAUU2eHUM/YHd6eI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=D7tgD4YsDu/xhYl1JQ4iO+Is5hPJ1r5u28zl9ck98Yu7QpJZLdQaWdwUQrG8KesZ2
	 AXqfKEaVH+BOajBzmzSxQH+/GLodvup29dC/Kf4GnGPO1TnvBxs8/W9bevqmUhdddR
	 JZlQB8BDskjo+o9xV0JKdoW6hQOtK0m8Y3eikstI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgHFSfr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265F9C0617AB
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z18so41377813wrm.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=AO8nqkbr85lxncJm7Db/wKIEt/UUR9wqcHp46SsaYuE=;
        b=a1IKTAY8SY0OV2wEVnSy/rEXn3arHhYaza2Go/LeuNxgqps/YvUfHaYCh7D+VL+dfj
         6622kBxKNPeBpx91raPA1nP7ZW2oBB7c4ZTuNCOF/gTpCBIjiLhDrNeXRJFe83xCTzZj
         Pd8co3v2vLhWjwliujRmK/+UrV6F1sXrGtLxj1kkVKy+47jXgHdyngPP8uyIqQOVNpZP
         /1SdQr2iAVVF7TGDRFP/PYkhoykKupeOWDZTvyMj4/8dSZpgoDhOfIpHHmprbcd4lJTr
         74OpLVFE64uBkFvu98LZ6XgYuZjPSYliTmKB1rKKJTSYAwuO0bXJmuJFIeSb2HAkOmHv
         Uoww==
X-Gm-Message-State: AOAM533OikmZUu23a6m4tQhweW8z235VAfD7+3LcGdBq0G14ils1NAZA
        GCDJxPx2ArYkGMN5Vsc6m1wszhMM8/U=
X-Google-Smtp-Source: ABdhPJx53j7ghespoV0q4939aNvrkCKqlHxL1vnsf/LEyWUmvOql7+Cjm5yHGFs+StMMIRCK7mBEZQ==
X-Received: by 2002:adf:b441:: with SMTP id v1mr8655312wrd.61.1596738884448;
        Thu, 06 Aug 2020 11:34:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id p15sm7327090wrj.61.2020.08.06.11.34.43
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:44 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1540869lta;
        Thu, 6 Aug 2020 11:22:17 -0700 (PDT)
X-Received: by 2002:a63:d30a:: with SMTP id b10mr8273026pgg.430.1596738136966;
        Thu, 06 Aug 2020 11:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738136; cv=none;
        d=google.com; s=arc-20160816;
        b=fEQKN7A/1Dy7stHUJpz3QaBPuPoC/O/Jj4rg0Tv2P4ry2TQU9OOZ7lwcxZb8o4YK3J
         OGy9uL5E73uHb3M4ffA+Q7O37o2A7R6cvoyvVSE1s+tosNBzT5BPAy7WK0oA/2Gdm0bU
         cok1iB1rUN6FOStiXeKP6tOP6ZE28h4ztSBlLD/v/re1kyFIrr1cmbjhDD+3f47Pwnoc
         l8RfiPmEqRbkRbgWrEnxdE4bAD2JDKlWnNqIaakLRIxlMdIDlVK7kL64wzmp6ErPrzkL
         gtWBDqeDr+3RRoM6MpIrRrOqmmCnTEZ8NJ9XnXJ+UZTjtkyAn+bgqZdl9A0Ms6q4QrTu
         JBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=AO8nqkbr85lxncJm7Db/wKIEt/UUR9wqcHp46SsaYuE=;
        b=OAF0TWz/bB3LHw6tii1TiYH4lHE4x1GaL0n50ZKpuM+stQ66Vbg8ZMj2ZdOBmz1R4K
         fdqniSkBqFgMY5eHMWz+AjelRk/EF9uFA4CSe3/CTPQA57Fb0ZFz0YpXdgweWKyS5EvI
         yUveiK51cXNpIY1cyGDChJVy8fhOj2T1Y5kAu05A7rnk+oGyoo8fqldTgJ/IPrMfa7QA
         NkFPXsnVFYQpWslp+Syci3o7FlBoChHhROEzjiBtaWS21C4p2I5hVfdpNoRVuTFy63tj
         +oplN4+RQqs+5ckResdHDdLexGEotZfGBrpSI/nvhl8oyrZSv0TUx13cgp4XLlPA0Zkv
         qi4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=SsUMJwrO;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id k17si4046833pls.348.2020.08.06.11.22.16
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id EDB5E22D0B; Thu,  6 Aug 2020 18:22:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F303122D06;
        Thu,  6 Aug 2020 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738136;
        bh=41DB04g7bnvHlbjYbY4BAew/yHdDAUU2eHUM/YHd6eI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SsUMJwrOd4mJyKpNs/CIMXd3noEkrz6TxA8z2JExxEjdCSb3IJJHPuk97wtbWPoNL
         32tVAIKOcDTCI80KbmrW63jnaPqRJp0bKqJ+sE67JAp/icDA8uMjs47IXI8dmZquco
         2hUCicQHgZrDi4A0MumUHAwH2dDYkERdiTunAEqM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 09/41] usb: gadget: s3c-hsudc: remove platform header dependency
Date:   Thu,  6 Aug 2020 20:20:26 +0200
Message-Id: <20200806182059.2431-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: uGa4uWozuy+A
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There is no real phy driver, so s3c-hsudc just pokes the registers
itself. Improve this a little by making it a platform data callback
like we do for gpios.

There is only one board using this driver, and it's unlikely
that another would be added, so this is a minimal workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[krzk: Include regs-s3c2443-clock.h in ifdef to fixup build on s3c6400]
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Include regs-s3c2443-clock.h in ifdef to fixup build on s3c640
---
 .../include/mach/regs-s3c2443-clock.h         | 49 +++++++++++++++++
 arch/arm/plat-samsung/devs.c                  |  6 ++
 drivers/usb/gadget/udc/s3c-hsudc.c            | 55 ++-----------------
 include/linux/platform_data/s3c-hsudc.h       |  2 +
 4 files changed, 61 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
index 6bf924612b06..682759549e63 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2443-clock.h
@@ -10,6 +10,8 @@
 #ifndef __ASM_ARM_REGS_S3C2443_CLOCK
 #define __ASM_ARM_REGS_S3C2443_CLOCK
 
+#include <linux/delay.h>
+
 #define S3C2443_CLKREG(x)		((x) + S3C24XX_VA_CLKPWR)
 
 #define S3C2443_PLLCON_MDIVSHIFT	16
@@ -184,5 +186,52 @@ s3c2443_get_epll(unsigned int pllval, unsigned int baseclk)
 	return (unsigned int)fvco;
 }
 
+static inline void s3c_hsudc_init_phy(void)
+{
+	u32 cfg;
+
+	cfg = readl(S3C2443_PWRCFG) | S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	cfg = readl(S3C2443_URSTCON);
+	cfg |= (S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+	mdelay(1);
+
+	cfg = readl(S3C2443_URSTCON);
+	cfg &= ~(S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+
+	cfg = readl(S3C2443_PHYCTRL);
+	cfg &= ~(S3C2443_PHYCTRL_CLKSEL | S3C2443_PHYCTRL_DSPORT);
+	cfg |= (S3C2443_PHYCTRL_EXTCLK | S3C2443_PHYCTRL_PLLSEL);
+	writel(cfg, S3C2443_PHYCTRL);
+
+	cfg = readl(S3C2443_PHYPWR);
+	cfg &= ~(S3C2443_PHYPWR_FSUSPEND | S3C2443_PHYPWR_PLL_PWRDN |
+		S3C2443_PHYPWR_XO_ON | S3C2443_PHYPWR_PLL_REFCLK |
+		S3C2443_PHYPWR_ANALOG_PD);
+	cfg |= S3C2443_PHYPWR_COMMON_ON;
+	writel(cfg, S3C2443_PHYPWR);
+
+	cfg = readl(S3C2443_UCLKCON);
+	cfg |= (S3C2443_UCLKCON_DETECT_VBUS | S3C2443_UCLKCON_FUNC_CLKEN |
+		S3C2443_UCLKCON_TCLKEN);
+	writel(cfg, S3C2443_UCLKCON);
+}
+
+static inline void s3c_hsudc_uninit_phy(void)
+{
+	u32 cfg;
+
+	cfg = readl(S3C2443_PWRCFG) & ~S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	writel(S3C2443_PHYPWR_FSUSPEND, S3C2443_PHYPWR);
+
+	cfg = readl(S3C2443_UCLKCON) & ~S3C2443_UCLKCON_FUNC_CLKEN;
+	writel(cfg, S3C2443_UCLKCON);
+}
+
 #endif /*  __ASM_ARM_REGS_S3C2443_CLOCK */
 
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 2ed3ef604a25..0607d2984841 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -40,6 +40,10 @@
 #include <mach/irqs.h>
 #include <mach/map.h>
 
+#ifdef CONFIG_PLAT_S3C24XX
+#include <mach/regs-s3c2443-clock.h>
+#endif /* CONFIG_PLAT_S3C24XX */
+
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/adc.h>
@@ -1037,6 +1041,8 @@ struct platform_device s3c_device_usb_hsudc = {
 void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdata *pd)
 {
 	s3c_set_platdata(pd, sizeof(*pd), &s3c_device_usb_hsudc);
+	pd->phy_init = s3c_hsudc_init_phy;
+	pd->phy_uninit = s3c_hsudc_uninit_phy;
 }
 #endif /* CONFIG_PLAT_S3C24XX */
 
diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index aaca1b0a2f59..7bd5182ce3ef 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -30,8 +30,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 
-#include <mach/regs-s3c2443-clock.h>
-
 #define S3C_HSUDC_REG(x)	(x)
 
 /* Non-Indexed Registers */
@@ -186,53 +184,6 @@ static inline void __orr32(void __iomem *ptr, u32 val)
 	writel(readl(ptr) | val, ptr);
 }
 
-static void s3c_hsudc_init_phy(void)
-{
-	u32 cfg;
-
-	cfg = readl(S3C2443_PWRCFG) | S3C2443_PWRCFG_USBPHY;
-	writel(cfg, S3C2443_PWRCFG);
-
-	cfg = readl(S3C2443_URSTCON);
-	cfg |= (S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
-	writel(cfg, S3C2443_URSTCON);
-	mdelay(1);
-
-	cfg = readl(S3C2443_URSTCON);
-	cfg &= ~(S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
-	writel(cfg, S3C2443_URSTCON);
-
-	cfg = readl(S3C2443_PHYCTRL);
-	cfg &= ~(S3C2443_PHYCTRL_CLKSEL | S3C2443_PHYCTRL_DSPORT);
-	cfg |= (S3C2443_PHYCTRL_EXTCLK | S3C2443_PHYCTRL_PLLSEL);
-	writel(cfg, S3C2443_PHYCTRL);
-
-	cfg = readl(S3C2443_PHYPWR);
-	cfg &= ~(S3C2443_PHYPWR_FSUSPEND | S3C2443_PHYPWR_PLL_PWRDN |
-		S3C2443_PHYPWR_XO_ON | S3C2443_PHYPWR_PLL_REFCLK |
-		S3C2443_PHYPWR_ANALOG_PD);
-	cfg |= S3C2443_PHYPWR_COMMON_ON;
-	writel(cfg, S3C2443_PHYPWR);
-
-	cfg = readl(S3C2443_UCLKCON);
-	cfg |= (S3C2443_UCLKCON_DETECT_VBUS | S3C2443_UCLKCON_FUNC_CLKEN |
-		S3C2443_UCLKCON_TCLKEN);
-	writel(cfg, S3C2443_UCLKCON);
-}
-
-static void s3c_hsudc_uninit_phy(void)
-{
-	u32 cfg;
-
-	cfg = readl(S3C2443_PWRCFG) & ~S3C2443_PWRCFG_USBPHY;
-	writel(cfg, S3C2443_PWRCFG);
-
-	writel(S3C2443_PHYPWR_FSUSPEND, S3C2443_PHYPWR);
-
-	cfg = readl(S3C2443_UCLKCON) & ~S3C2443_UCLKCON_FUNC_CLKEN;
-	writel(cfg, S3C2443_UCLKCON);
-}
-
 /**
  * s3c_hsudc_complete_request - Complete a transfer request.
  * @hsep: Endpoint to which the request belongs.
@@ -1188,7 +1139,8 @@ static int s3c_hsudc_start(struct usb_gadget *gadget,
 
 	pm_runtime_get_sync(hsudc->dev);
 
-	s3c_hsudc_init_phy();
+	if (hsudc->pd->phy_init)
+		hsudc->pd->phy_init();
 	if (hsudc->pd->gpio_init)
 		hsudc->pd->gpio_init();
 
@@ -1210,7 +1162,8 @@ static int s3c_hsudc_stop(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&hsudc->lock, flags);
 	hsudc->gadget.speed = USB_SPEED_UNKNOWN;
-	s3c_hsudc_uninit_phy();
+	if (hsudc->pd->phy_uninit)
+		hsudc->pd->phy_uninit();
 
 	pm_runtime_put(hsudc->dev);
 
diff --git a/include/linux/platform_data/s3c-hsudc.h b/include/linux/platform_data/s3c-hsudc.h
index 4dc9b8760166..a170939832d5 100644
--- a/include/linux/platform_data/s3c-hsudc.h
+++ b/include/linux/platform_data/s3c-hsudc.h
@@ -26,6 +26,8 @@ struct s3c24xx_hsudc_platdata {
 	unsigned int	epnum;
 	void		(*gpio_init)(void);
 	void		(*gpio_uninit)(void);
+	void		(*phy_init)(void);
+	void		(*phy_uninit)(void);
 };
 
 #endif	/* __LINUX_USB_S3C_HSUDC_H */
-- 
2.17.1

