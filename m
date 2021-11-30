Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC52C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Nov 2021 02:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhK3CbC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Nov 2021 21:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbhK3CbC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 21:31:02 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981F6C061714
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 18:27:43 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id j18so24958020ljc.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 18:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVtPKHU/UyhyPfruAPKFG828wihrrr+mzXVKZt4x00A=;
        b=yH9owDeU8M6oLxFmGgW/KvWY+fiBdw3phLJOSsVdQsc2R2oxg+CrxPKoupnXBU3IJ2
         1G4Zhkw8QTXQkHxsQXjvdLqh3FEaAmsNVZWfp5r6iunR5dmSE+txN7B4pJpjZo5EU1ol
         qnfb9z7jknwplAs7lH+XAeLPVCqc8yU6H4Kt4AHl4nqPbIIUmMsp47p8NoPf6mSELmXZ
         orXqhVQ2z3EceXmZg+aGfDYea0Re8AxuUIOqPIMDJ9CHGYg9tXs+f3tSAQyilAXwCvsa
         gD0icHuHTdg3dttpL42FjIdHkOAt64oNRP2wf7EIFx0pHSvf3sXLVg+HkwmvN3nQ/5+3
         tiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVtPKHU/UyhyPfruAPKFG828wihrrr+mzXVKZt4x00A=;
        b=qrWt77+YsDtzOklKS92FUbZUSJaxmB+D45bRDvSQNe+lPsR7BHxIbKT08CM6bvqh3u
         3+mWdNONJM137zG3F36BaHSX71GJeR5D5JXmmhjbuo+8VpenN1KpWXAjHAHFWeW8aF3v
         FxJZe/YSgF73YYQNsGA9GZeCK7LEYsGB5aOljYOlIfC1XwoIXeXRYrvEhikdBuA3unst
         NFqmNtT5Q7DAa+q/R5As4CfVZY1fduEsexQp1g+2Vu1S9hJX1n/JfM2AnbKVum3ZHJQG
         VptLaz6k5qnOOaLANBCVLlD2hHMmNB1kvBh+3bo0x3WiHlyuu8H98rSRhzWn34olgIOz
         lLsA==
X-Gm-Message-State: AOAM5304XhCoalvZ9rdn8IxkJAUeOmhC8AsxIQv11F1i1DDmuMi8y+Sk
        NjM13VDGupiMLRoCE5QtXX9auQ==
X-Google-Smtp-Source: ABdhPJx3iA+USaLENMZnnccCsX0zfNN/OoEasKJUFqY3MkeYddZpOycdziVRyp8u1AOXeiTnmMIwUA==
X-Received: by 2002:a2e:91d4:: with SMTP id u20mr52770714ljg.92.1638239261863;
        Mon, 29 Nov 2021 18:27:41 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b12sm1547639lfb.41.2021.11.29.18.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:27:41 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/5] tty: serial: samsung: Remove USI initialization
Date:   Tue, 30 Nov 2021 04:27:38 +0200
Message-Id: <20211130022740.28784-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

USI control is now extracted to dedicated USI driver. Remove USI related
code from serial driver to avoid conflicts and code duplication.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
 include/linux/serial_s3c.h       |  9 --------
 2 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index ca084c10d0bb..f986a9253dc8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -65,7 +65,6 @@ enum s3c24xx_port_type {
 struct s3c24xx_uart_info {
 	char			*name;
 	enum s3c24xx_port_type	type;
-	bool			has_usi;
 	unsigned int		port_type;
 	unsigned int		fifosize;
 	unsigned long		rx_fifomask;
@@ -1357,28 +1356,6 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-static void exynos_usi_init(struct uart_port *port)
-{
-	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	struct s3c24xx_uart_info *info = ourport->info;
-	unsigned int val;
-
-	if (!info->has_usi)
-		return;
-
-	/* Clear the software reset of USI block (it's set at startup) */
-	val = rd_regl(port, USI_CON);
-	val &= ~USI_CON_RESET_MASK;
-	wr_regl(port, USI_CON, val);
-	udelay(1);
-
-	/* Continuously provide the clock to USI IP w/o gating (for Rx mode) */
-	val = rd_regl(port, USI_OPTION);
-	val &= ~USI_OPTION_HWACG_MASK;
-	val |= USI_OPTION_HWACG_CLKREQ_ON;
-	wr_regl(port, USI_OPTION, val);
-}
-
 /* power power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
@@ -1405,8 +1382,6 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 
 		if (!IS_ERR(ourport->baudclk))
 			clk_prepare_enable(ourport->baudclk);
-
-		exynos_usi_init(port);
 		break;
 	default:
 		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
@@ -2130,8 +2105,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (ret)
 		pr_warn("uart: failed to enable baudclk\n");
 
-	exynos_usi_init(port);
-
 	/* Keep all interrupts masked and cleared */
 	switch (ourport->info->type) {
 	case TYPE_S3C6400:
@@ -2780,11 +2753,10 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)			\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA()				\
 	.info = &(struct s3c24xx_uart_info) {			\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
-		.has_usi	= _has_usi,			\
 		.port_type	= PORT_S3C6400,			\
 		.has_divslot	= 1,				\
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
@@ -2805,17 +2777,17 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 	}							\
 
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 16, 16 },
 };
 
 static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 64, 256, 16, 256 },
 };
 
 static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(true),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 64, 64 },
 };
 
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index cf0de4a86640..f6c3323fc4c5 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -27,15 +27,6 @@
 #define S3C2410_UERSTAT	  (0x14)
 #define S3C2410_UFSTAT	  (0x18)
 #define S3C2410_UMSTAT	  (0x1C)
-#define USI_CON		  (0xC4)
-#define USI_OPTION	  (0xC8)
-
-#define USI_CON_RESET			(1<<0)
-#define USI_CON_RESET_MASK		(1<<0)
-
-#define USI_OPTION_HWACG_CLKREQ_ON	(1<<1)
-#define USI_OPTION_HWACG_CLKSTOP_ON	(1<<2)
-#define USI_OPTION_HWACG_MASK		(3<<1)
 
 #define S3C2410_LCON_CFGMASK	  ((0xF<<3)|(0x3))
 
-- 
2.30.2

