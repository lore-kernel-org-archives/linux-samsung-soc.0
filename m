Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1D4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbiCGIKY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236085AbiCGIKX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:10:23 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B5A49F08
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:09:29 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E28E3F605
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640568;
        bh=Hr6l7tR8wCFPpDLdPVRbiwm0w/8EJx3zWKyr1VFg4Q4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VFDZZetJDBZau1NmMUCvSxLHT0eviZWktWgjEPXu0LN6trKjHRXBNM9FuYPyeJ+4h
         WoVazzxc9u6838sLO84mUe4mu3WYLjiFYtOBYP711MyGqlBl8ByGpmZfvjmKzm68Oh
         9AnKd6fPKY71puJSnDtDfSijkWZDTgLRhKSy/jnWu7My25YdoM8lRtbw0MCo/2Df+Y
         b7ffC07nhDjeRkXeGcT6fgM0niQKvR4EEAsmG7NL+/qTms5Cd2/6mdNo0gyf7mAERb
         +4U7YT0Mz+Rtb3StZq019z9UznjEP/IhjNoBOvIZPpsOpZREDHb/SV0wBbUpy5DX43
         VZEwGvV93jp2A==
Received: by mail-ed1-f70.google.com with SMTP id bd4-20020a056402206400b004162b6d8618so2398767edb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr6l7tR8wCFPpDLdPVRbiwm0w/8EJx3zWKyr1VFg4Q4=;
        b=mN2fYmTCpiV+E1ClIR65To7GNHjQSlHWFc4txIgFcADm1LvEBfolTWZ3W/bqaPDdpx
         7T66pqJDpgJNqhHBbkud+tyePqAdICA+R9C3OmSFT4tcwku/K6R94hps0bBmVrHf+gSI
         0giCKyTuCm49NGgOe6ChEVxMlk9oU9O86qzgCC3hFhsMuOW2QTuBHGzuH9fcRg+HZ36Q
         ZeL3QYQy65sAnpDgeQ29bk/4gQZWyu67tCAoN3uzd7bmMcPIM3ZQ5VLfvE9Nr2SvXuHw
         vGqeEMv5GbgpNONk0vsxb18XNgnSTf+b2tVJst2qaan/WJfcm55NpwUTl1nIDzKTuqTo
         AQ+Q==
X-Gm-Message-State: AOAM530VhmqybFiWwEpCRW2LDyVlqyb/qkvPCIuU12dciicNENco4ttP
        FSYk+vK8wSjeyzqZbWrVSdukYs/kp8Mu4yycbZEtDKa94DSPtS1jQqAiighh+Zsy8Iiw+DNoeIj
        EgiL4S+EP/aSHMrok+8YhWINjiYAKp9xr58GkTBxEbyicYs7t
X-Received: by 2002:aa7:db07:0:b0:415:d33e:a8ea with SMTP id t7-20020aa7db07000000b00415d33ea8eamr9897825eds.342.1646640567892;
        Mon, 07 Mar 2022 00:09:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNaH7lGnyROX1lQxu8WqlZ1+w74vQK+Ouvk0dc1jxOnopJEO9Ambl+7Snfxcdo3gz4WsL+eg==
X-Received: by 2002:aa7:db07:0:b0:415:d33e:a8ea with SMTP id t7-20020aa7db07000000b00415d33ea8eamr9897806eds.342.1646640567675;
        Mon, 07 Mar 2022 00:09:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq14-20020a1709069d8e00b006da650af5a9sm4472594ejc.3.2022.03.07.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:09:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] tty: serial: samsung: embed s3c2410_uartcfg in parent structure
Date:   Mon,  7 Mar 2022 09:09:20 +0100
Message-Id: <20220307080925.54131-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Embed "struct s3c2410_uartcfg" directly as a member of "struct
s3c24xx_serial_drv_data" instead of keeping it as a pointer.  This makes
the code clearer (obvious ownership of "s3c2410_uartcfg
s3c24xx_serial_drv_data") and saves one pointer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/samsung_tty.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index aa5678d03704..a9a75b5b9705 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -86,7 +86,7 @@ struct s3c24xx_uart_info {
 
 struct s3c24xx_serial_drv_data {
 	struct s3c24xx_uart_info	info;
-	struct s3c2410_uartcfg		*def_cfg;
+	struct s3c2410_uartcfg		def_cfg;
 	unsigned int			fifosize[CONFIG_SERIAL_SAMSUNG_UARTS];
 };
 
@@ -2200,7 +2200,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 	ourport->info = &ourport->drv_data->info;
 	ourport->cfg = (dev_get_platdata(&pdev->dev)) ?
 			dev_get_platdata(&pdev->dev) :
-			ourport->drv_data->def_cfg;
+			&ourport->drv_data->def_cfg;
 
 	switch (ourport->info->type) {
 	case TYPE_S3C24XX:
@@ -2632,7 +2632,7 @@ static struct s3c24xx_serial_drv_data s3c2410_serial_drv_data = {
 		.clksel_mask	= S3C2410_UCON_CLKMASK,
 		.clksel_shift	= S3C2410_UCON_CLKSHIFT,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= S3C2410_UCON_DEFAULT,
 		.ufcon		= S3C2410_UFCON_DEFAULT,
 	},
@@ -2661,7 +2661,7 @@ static struct s3c24xx_serial_drv_data s3c2412_serial_drv_data = {
 		.clksel_mask	= S3C2412_UCON_CLKMASK,
 		.clksel_shift	= S3C2412_UCON_CLKSHIFT,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= S3C2410_UCON_DEFAULT,
 		.ufcon		= S3C2410_UFCON_DEFAULT,
 	},
@@ -2692,7 +2692,7 @@ static struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
 		.clksel_shift	= S3C2412_UCON_CLKSHIFT,
 		.ucon_mask	= S3C2440_UCON0_DIVMASK,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= S3C2410_UCON_DEFAULT,
 		.ufcon		= S3C2410_UFCON_DEFAULT,
 	},
@@ -2721,7 +2721,7 @@ static struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
 		.clksel_mask	= S3C6400_UCON_CLKMASK,
 		.clksel_shift	= S3C6400_UCON_CLKSHIFT,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= S3C2410_UCON_DEFAULT,
 		.ufcon		= S3C2410_UFCON_DEFAULT,
 	},
@@ -2749,7 +2749,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.clksel_mask	= S5PV210_UCON_CLKMASK,
 		.clksel_shift	= S5PV210_UCON_CLKSHIFT,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= S5PV210_UCON_DEFAULT,
 		.ufcon		= S5PV210_UFCON_DEFAULT,
 	},
@@ -2778,7 +2778,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.clksel_mask	= 0,				\
 		.clksel_shift	= 0,				\
 	},							\
-	.def_cfg = &(struct s3c2410_uartcfg) {			\
+	.def_cfg = {						\
 		.ucon		= S5PV210_UCON_DEFAULT,		\
 		.ufcon		= S5PV210_UFCON_DEFAULT,	\
 		.has_fracval	= 1,				\
@@ -2827,7 +2827,7 @@ static struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
 		.clksel_mask	= 0,
 		.clksel_shift	= 0,
 	},
-	.def_cfg = &(struct s3c2410_uartcfg) {
+	.def_cfg = {
 		.ucon		= APPLE_S5L_UCON_DEFAULT,
 		.ufcon		= S3C2410_UFCON_DEFAULT,
 	},
-- 
2.32.0

