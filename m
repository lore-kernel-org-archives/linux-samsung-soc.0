Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A21BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 08:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbiCDIFC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiCDIE4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 03:04:56 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0881910BBE3
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 00:04:07 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BE90E3F5F5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646381045;
        bh=T44npRNeKYD0vpyzx7RQhW2Cib6n/i6fxec+7s1/j58=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qoMxXMODkwW8A8gli0H+ZRx52NzLj7+8Pf+CLTJJckbYz9d/r+tncdhzSVhRQkIFc
         Xhuzse3v4UWpUeaPS0N8YrF3D+wN0LECRocikKBY+jryALvh03kynGUO7Dbn7m19hp
         bypZO4tXaZ1BmSICl24yXFVl77PRdXc2KQQID1f8J46+M8gb4+gv3+nUUr+5IqnUhU
         gy2OtpWupcPhYpVJIM9eQL6QkjJF8ws0Ru7ypVwiRvHek9eeRhlmpCH0tf/YPv9CD/
         WN3PMoyxLZJsrrCT3Peo0kC6vcdua3EY2ASjhcUkf3/5Piecu8xghTJ7yTNzTYjEYU
         0hugcZmviFFag==
Received: by mail-ed1-f72.google.com with SMTP id u28-20020a50d51c000000b004159ffb8f24so4219160edi.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 00:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T44npRNeKYD0vpyzx7RQhW2Cib6n/i6fxec+7s1/j58=;
        b=B+kJgrNyB4nb1gvmAtgSL5jNp+aWtvUXAhPjVTMEdBdzrQXflF4g2IoSLUNhMo3zds
         dlQ0hcHDRcrchDUPq0fFbegxsNLUAA6Cfz1IwxP5BtDKxIjgjJc4WpIZBNH2rEUZpRpn
         t4tT6HTfODaQJciTx/dAiPedgjxokVFhzF2S0ux7J8qi1BUgwbJQ06uYa4DopQRqOjpv
         k+RVtOTidOrrKR3CJ7d8IDq7I96CMTENVwaX9v+OfHu4vMUl5u18034Pjf58C7XAGeZq
         XP2gqJltD4jAeOFEmiKF9z4IqGTNUDfDvHYVpzzTgCTVtBNYTbCmKjMu/q+K0xaNKRy0
         CE6Q==
X-Gm-Message-State: AOAM532OYamZExJmYuUmcNUhxQNgwCJ0oF8mCdSQbC1bXfTxM5LmGdSA
        7AptIQWY0eLXiQVoSmmw7oqADs+gTJWMLej4j2Y7+yAfPMtxPEewjIHj9m+hpEhXaVJ57E6nM9u
        fqL5baruqinEqCKLx+ejriCzvPbeqs8CCu+T/oa8fY9xm5G5W
X-Received: by 2002:aa7:c1d7:0:b0:415:9906:8900 with SMTP id d23-20020aa7c1d7000000b0041599068900mr14995502edp.360.1646381045100;
        Fri, 04 Mar 2022 00:04:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQx+JALUcgr+aV10z5DLRK2lWPO6mxFP6+bRPUxVe5mDfuxGx3aQWGNaHOFHObaAzRiHXZiw==
X-Received: by 2002:aa7:c1d7:0:b0:415:9906:8900 with SMTP id d23-20020aa7c1d7000000b0041599068900mr14995487edp.360.1646381044922;
        Fri, 04 Mar 2022 00:04:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id rv11-20020a17090710cb00b006d5c0cd5e0dsm1481465ejb.82.2022.03.04.00.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:04:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] tty: serial: samsung: constify s3c24xx_serial_drv_data members
Date:   Fri,  4 Mar 2022 09:03:46 +0100
Message-Id: <20220304080348.218581-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
References: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver data (struct s3c24xx_serial_drv_data) is never modified, so
also its members can be make const.  Except code style this has no
impact because the structure itself is always a const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/tty/serial/samsung_tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 279c413f2300..eecefff5c4a4 100644
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

