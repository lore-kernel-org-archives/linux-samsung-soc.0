Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35E7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbiCGIJc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiCGIJR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:09:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958DF1B78B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:08:23 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E9BA13F60D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640501;
        bh=eR7Mc9vi/w7iGpwa309YiCzl9zkdxojESdgSBLZGEv4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GQu7LJDK2krr29AH+bK//llfgxyqSmq6XMk4JYubDMCfDeFxwMRRxJt1H1wfyQQjO
         XYFus14KNCwtiAruo3qUl0VoOJwtZ7Qw7Dd9fmtCSmSPBrXPGzUotGTbEU7yjuL6Tx
         ONGnaaESCXN9huK/lL5hm44LYUDyD3lYdiSmNeythvj0OwIiDRquzFVyqZhHe5fcLf
         xffQq/hYLke6HHU0iEERafEUwWngCJkqBZC3zhskQ5VFwL9BI6G5YNTCHkgUb0FjYt
         SwoHDB+EpUOqMylQPCtPDVB3g4MPhzaDNDOz9HpXiHTysfonAAypynDYFJnKF2dLYX
         QMOts8zQfKjMg==
Received: by mail-ej1-f72.google.com with SMTP id og24-20020a1709071dd800b006dab87bec4fso3154442ejc.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eR7Mc9vi/w7iGpwa309YiCzl9zkdxojESdgSBLZGEv4=;
        b=vPqwJGIIpiP7/RirXAXYj3DDH97IF5uU2BVVjGAwCoQpY/WzLRSP5ytuToJwGzB0hU
         dbqP2lpOJ8s03JW94mgWQKhGTd//rx7KeuVlZ+uulDbGlC8sOcgq5g5ha4F5Q3M4q0Kd
         JJ/v6jcMHWF9tKpD6KP4deeDC/bTlcElrhSET+zdmYwnO7McMLA5+QaGLMxYoR6ZM5C/
         e48DicvCFXO92Q+ke501Hs9rja21CE04DX5ygDir75bdh2hzDnYIvBN4Kot73Vyxzm9A
         airPhUueB63uRc1xeZTz38j6jMc/0QlH2KQt9noYUXKrlQN+o3rdqfug7uD8dcDsW2g5
         OJFg==
X-Gm-Message-State: AOAM531kI/jZ27C2HKF0qKq/MI/Ggx+M4E8YdqiLadF8SzTTiJuIP39W
        TE/jTQl8fvnK4H4s+STy+DRG8U8xkzTd1mTcIMoS+CRPaNFQptGnniOuRIc68KP4kTg2CW9eSmX
        etkypZ4zIxyaSUPHfxc40SYx4Nch0ePCSfxRA0JUI84nk4Ryl
X-Received: by 2002:a05:6402:239b:b0:415:a36e:99c0 with SMTP id j27-20020a056402239b00b00415a36e99c0mr9870066eda.283.1646640500562;
        Mon, 07 Mar 2022 00:08:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpUqnQcFhltzbiTgvk4iIo+PNlDFJdT98Fxk5y0pBKW8l18KW8SAiAS4UDqIaBE1SiIT6jnQ==
X-Received: by 2002:a05:6402:239b:b0:415:a36e:99c0 with SMTP id j27-20020a056402239b00b00415a36e99c0mr9870056eda.283.1646640500396;
        Mon, 07 Mar 2022 00:08:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fs6-20020a170907600600b006da8ec6e4a6sm4444584ejc.26.2022.03.07.00.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:08:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] tty: serial: samsung: embed s3c24xx_uart_info in parent structure
Date:   Mon,  7 Mar 2022 09:08:04 +0100
Message-Id: <20220307080810.53847-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Embed "struct s3c24xx_uart_info" directly as a member of "struct
s3c24xx_serial_drv_data" instead of keeping it as a pointer.  This makes
the code clearer (obvious ownership of "struct s3c24xx_serial_drv_data")
and saves one pointer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/samsung_tty.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index d002a4e48ed9..aa5678d03704 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -85,7 +85,7 @@ struct s3c24xx_uart_info {
 };
 
 struct s3c24xx_serial_drv_data {
-	struct s3c24xx_uart_info	*info;
+	struct s3c24xx_uart_info	info;
 	struct s3c2410_uartcfg		*def_cfg;
 	unsigned int			fifosize[CONFIG_SERIAL_SAMSUNG_UARTS];
 };
@@ -2197,7 +2197,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 	}
 
 	ourport->baudclk = ERR_PTR(-EINVAL);
-	ourport->info = ourport->drv_data->info;
+	ourport->info = &ourport->drv_data->info;
 	ourport->cfg = (dev_get_platdata(&pdev->dev)) ?
 			dev_get_platdata(&pdev->dev) :
 			ourport->drv_data->def_cfg;
@@ -2616,7 +2616,7 @@ static struct console s3c24xx_serial_console = {
 
 #ifdef CONFIG_CPU_S3C2410
 static struct s3c24xx_serial_drv_data s3c2410_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Samsung S3C2410 UART",
 		.type		= TYPE_S3C24XX,
 		.port_type	= PORT_S3C2410,
@@ -2644,7 +2644,7 @@ static struct s3c24xx_serial_drv_data s3c2410_serial_drv_data = {
 
 #ifdef CONFIG_CPU_S3C2412
 static struct s3c24xx_serial_drv_data s3c2412_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Samsung S3C2412 UART",
 		.type		= TYPE_S3C24XX,
 		.port_type	= PORT_S3C2412,
@@ -2674,7 +2674,7 @@ static struct s3c24xx_serial_drv_data s3c2412_serial_drv_data = {
 #if defined(CONFIG_CPU_S3C2440) || defined(CONFIG_CPU_S3C2416) || \
 	defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2442)
 static struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Samsung S3C2440 UART",
 		.type		= TYPE_S3C24XX,
 		.port_type	= PORT_S3C2440,
@@ -2704,7 +2704,7 @@ static struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
 
 #if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410)
 static struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Samsung S3C6400 UART",
 		.type		= TYPE_S3C6400,
 		.port_type	= PORT_S3C6400,
@@ -2733,7 +2733,7 @@ static struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
 
 #ifdef CONFIG_CPU_S5PV210
 static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Samsung S5PV210 UART",
 		.type		= TYPE_S3C6400,
 		.port_type	= PORT_S3C6400,
@@ -2762,7 +2762,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 
 #if defined(CONFIG_ARCH_EXYNOS)
 #define EXYNOS_COMMON_SERIAL_DRV_DATA()				\
-	.info = &(struct s3c24xx_uart_info) {			\
+	.info = {						\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
 		.port_type	= PORT_S3C6400,			\
@@ -2811,7 +2811,7 @@ static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 
 #ifdef CONFIG_ARCH_APPLE
 static struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
-	.info = &(struct s3c24xx_uart_info) {
+	.info = {
 		.name		= "Apple S5L UART",
 		.type		= TYPE_APPLE_S5L,
 		.port_type	= PORT_8250,
-- 
2.32.0

