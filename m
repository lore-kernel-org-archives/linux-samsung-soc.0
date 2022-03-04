Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADD4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 08:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiCDIEy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiCDIEt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 03:04:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13EDB6D20
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 00:04:00 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B137B3F614
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646381039;
        bh=HoXAShC7EBsK4KdfVtpMogYLZUITR5x/YL0IUbkIHfM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=VrhWRmCRE/QVBHW75Y3d+85aXbktwpGLZDRIzeVCOkHQmgSlOvCrN9omPWHfiYCIJ
         tsqZskCbWM4YFXmtNlBm4xCmJCBQSM0adZ1K3OFiwWfd+AN2zRdE0QMhTxbWSxfNPq
         H0b3HxXVgjz8ematiUqLkTp/SJ88ToNnxaIFxtlQxh88Tez8hihxCbBBtnZGZ8ZKmE
         OS13d8dhy8U5FDm9m6lqdOtoxNAZnFqC/e0KSyCpxVuhE+uhqYmLv7jbL3ef4kQmmE
         vP1bNKqv+prZqNG5xWhHxY/SiOGFY/IBpq+KI03rUhhzP+ydhnEjCl6Lt20Wd8yUqR
         OHT9oWFKntirw==
Received: by mail-ed1-f71.google.com with SMTP id y26-20020a50ce1a000000b00415e9b35c81so1963054edi.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 00:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoXAShC7EBsK4KdfVtpMogYLZUITR5x/YL0IUbkIHfM=;
        b=KGclo2YP7Js+SappmScQPoNwKVA0rAugp4VLFsQN1ouEzLYuY7mSZPG5LsCuYKa5RS
         e4MSFvPaHjfWJ9XDnz5iTdFXJW6BBm1H9eI4hGEi3O5/Owf2229znfsoM295ldAPAznl
         a/nQ2/L8XB3Vje4qVNR6w4IFswDYy5f+8Y6jqPyuSaFG9TjrMjaG+SMsPZIus3A9BYpb
         T8NqqhuFXfVVDslYE8E1gWW/XIFxU5bwEKzJucHwtn0Kwe9yYnaAc7Usq6/5MbcIkEck
         lsUrsgh4OLlnkTxvrnq95m00QXt4OYladmir3i54B62V4ZFVaFWOrGRsP61m8XaiMx3w
         H7dQ==
X-Gm-Message-State: AOAM530iN/GIpowyyVL8QMbeRJ5EjctZ7r/aq4XOkGSTZtwAxpxN/5TS
        e452OEmiyypMcCfsdpz/7AX0odAHUJf9Hrlw232loAyYSe8LmJulc4iwcsFS/nvSoUNNLdDhWQ0
        ZLj+0JfvPaeRTp40xcQPhpCnxV2wGSwZUFbmwELdmqmuwq6+Q
X-Received: by 2002:a17:906:5011:b0:6cf:82ff:f1bf with SMTP id s17-20020a170906501100b006cf82fff1bfmr30210333ejj.69.1646381038695;
        Fri, 04 Mar 2022 00:03:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz43El0g6b5OISJGpRpQ/02j8Wy7rzIIgM4+un5VZ3Pj2PD9d8J1Duaat4JpHIv+dYxCDdCwA==
X-Received: by 2002:a17:906:5011:b0:6cf:82ff:f1bf with SMTP id s17-20020a170906501100b006cf82fff1bfmr30210272ejj.69.1646381037705;
        Fri, 04 Mar 2022 00:03:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id rv11-20020a17090710cb00b006d5c0cd5e0dsm1481465ejb.82.2022.03.04.00.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:03:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] tty: serial: samsung: embed s3c24xx_uart_info in parent structure
Date:   Fri,  4 Mar 2022 09:03:42 +0100
Message-Id: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
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

