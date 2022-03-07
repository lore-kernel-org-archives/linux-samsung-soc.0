Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2FDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiCGIK3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236084AbiCGIK1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:10:27 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCC24BB9E
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:09:33 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AE2823F5FD
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640572;
        bh=kV9bWky3aqex0YOWejd45KPzqFNsCZcNjbYJT0yjx5k=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=aIjwsEm048n+4LT3nzCMcEuHtqFBhrux1xhatEkyeAP1W14lmGaoXWVR2SSub8Eio
         9v4IlV1bWe21JugiIzrDpHANB4Zf7rGJq+o81YPqRw/m82HyxSv17AV+UdFlLWdrX2
         MlH2m5UYnlML0bkF4cgmR/6biwPjWfeFxoDEcoO5JBBsdwkPD5XjsuPOqlMeQ20qwm
         tvSi3d0f5DBQdmdlA6c5co8ldtxcVyrRSCmEg6yrbIvYqlFXtOqm+8UISvp/pfqyWX
         +C/pT9J+Pqo6lkzx31gSYGCEltDl+NxsXmQ57xbF1Y3iAruP956nINkIrCdH9vRuGa
         c72HJlxvEAg2g==
Received: by mail-ed1-f71.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so8175321edw.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kV9bWky3aqex0YOWejd45KPzqFNsCZcNjbYJT0yjx5k=;
        b=aTKJmtlTZkiv4gTZ2KUmOuMve8y6mz4j0yv5E9CBK9DEtHy/cYZlHFskVyUZYqc2e6
         JUA0SNGDpmKNW3JRN72WxxmWCtiNBNoa5mS04FcbcwKfUpudtHKgBimDPaWAfH7do+Sm
         W///OD2bJp/WFxGfq5X9sZqzrdEOPNWYmKTbOHt5JSEARBzT3fr94/s21blP2B+LDVxd
         qy3Pts/0gRlfYoieekUBxUtbczuyJhfStsapTtzOJ06/W065KEQa+crezUNTpVBb4tgf
         F+joQ2iREzC9PIKZx0Z6TIoYL3PS5pEyHw8DFOSHgejcEnEIicWCdy/Fiu5sQr6lg0xV
         OE+g==
X-Gm-Message-State: AOAM530g015ZHIyDOMtDAcPQmbQp8ol6Z8/XzrwlqxVUdVHFuAsKImhe
        52qHqD0uGOPs3jMSKAJt6dWliW69Kw8v6BcHpp2HZrjDh+jLJnSO9yDX5eFLsIyldFp5tBDCAq4
        taAknTtmqeCDcjlBiiY+1CaMwcryZvpDKg0/XgytJwgvPFJSS
X-Received: by 2002:a17:907:9956:b0:6cf:cd25:c5a7 with SMTP id kl22-20020a170907995600b006cfcd25c5a7mr7978722ejc.635.1646640572156;
        Mon, 07 Mar 2022 00:09:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu85jkg65tIPk5L9NKONVRpMHiBi3IKZigN9L3D0ZJ8f0joA64x28uwWQqTpa7qj5dJKGMqw==
X-Received: by 2002:a17:907:9956:b0:6cf:cd25:c5a7 with SMTP id kl22-20020a170907995600b006cfcd25c5a7mr7978714ejc.635.1646640572014;
        Mon, 07 Mar 2022 00:09:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq14-20020a1709069d8e00b006da650af5a9sm4472594ejc.3.2022.03.07.00.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:09:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] tty: serial: samsung: constify s3c24xx_serial_drv_data members
Date:   Mon,  7 Mar 2022 09:09:23 +0100
Message-Id: <20220307080925.54131-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver data (struct s3c24xx_serial_drv_data) is never modified, so
also its members can be made const.  Except code style this has no
impact because the structure itself is always a const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/samsung_tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 7025306f76b7..b9783d8fb440 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -85,9 +85,9 @@ struct s3c24xx_uart_info {
 };
 
 struct s3c24xx_serial_drv_data {
-	struct s3c24xx_uart_info	info;
-	struct s3c2410_uartcfg		def_cfg;
-	unsigned int			fifosize[CONFIG_SERIAL_SAMSUNG_UARTS];
+	const struct s3c24xx_uart_info	info;
+	const struct s3c2410_uartcfg	def_cfg;
+	const unsigned int		fifosize[CONFIG_SERIAL_SAMSUNG_UARTS];
 };
 
 struct s3c24xx_uart_dma {
-- 
2.32.0

