Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F415C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 08:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiCDIEz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbiCDIEy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 03:04:54 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16856C680B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 00:04:05 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B1E6C3F5F2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646381043;
        bh=0kJxljmXqNGTN5eMb3x4xxptqrabkXZDbHX7wYX3Zgs=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=cFdcUYxtPoagD1biMVr8ktNpVhWvJ76/Rk71XC8qmFPiwtiHoSqySVbWyDAAS7E5H
         VFtSgMzEKDJw/AagkV8tsYhjP1+xFaNaIo5953N7HelWmSoL5lX2uVUp1+7SJ16ANQ
         agtswAjZGNNaV48KF8xZnVFvd+oVTIKLbPzKkZ458eIub4s6gXqvx/AqAkPLMD/0a3
         bY+yyZAEP2Yo7aPFsOTKlrx3q0qlI5cwa+zfIKzutmNeX3CWZubxAuMFTcFBzU8vdr
         UzD+OVT+wOZcnqAFD9n64+3eytgm+T+ZylgW8Nh15xx46eC4D0C7AK57L/wmJDE28u
         zvymKI7ygfBNA==
Received: by mail-ed1-f69.google.com with SMTP id y26-20020a50ce1a000000b00415e9b35c81so1963121edi.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 00:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kJxljmXqNGTN5eMb3x4xxptqrabkXZDbHX7wYX3Zgs=;
        b=BOGgKHUwcaLmKjJDyD8/ZAuKLp35pxyvaOosh7x4h91GAMX9YpowC3j7zxQ/YmDQru
         5BB7a/FEqDhq26M5gU8/hX47UYw32a/6J8cWtldkEr2s6xZ5+dExj/q/wqWxSQB13wvT
         kQFSe5QJcdaDF9FkPO712gJWa02/o1joYmA2TDiyhapTR2rQ4YBV454lCO+GQXWem4aW
         86C/b6qXYh/UoaPWaRC6gLqSuw5sDyrAAwpfjh5azk5VHH6yDCXr8U0tf75eBE3M7L02
         +mn0zGsyzHgwdPNyKGuC3x4H39a+osqBCg+BvFpN6NEkHaXZgcAFPNLuuN4j7Zm9cjuN
         fGzw==
X-Gm-Message-State: AOAM533nLL+nbre+YkeYgOFGgFpqMlzlRBeTa1V4pt9N8mue/w1OpolM
        RBK136m6D5w9rkHOHTr6bpVXfmnUxkb3CGESh4F3AQXbQ0u2jEv/fzAaMboDhbeqzeb6WVDX/aR
        PG7fQ4PC3HZKIQmA9mNKSw89WrucSz5zTLkEvOTSYqSfdamzz
X-Received: by 2002:a05:6402:3486:b0:409:8ed0:9340 with SMTP id v6-20020a056402348600b004098ed09340mr38136583edc.255.1646381042926;
        Fri, 04 Mar 2022 00:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+80NQg1qjGxzXwSnkNAPo7pilmgr6uO9HNvq8gSWafsXxSwmS24hqLp+IqtbfmR78BXE2qw==
X-Received: by 2002:a05:6402:3486:b0:409:8ed0:9340 with SMTP id v6-20020a056402348600b004098ed09340mr38136568edc.255.1646381042702;
        Fri, 04 Mar 2022 00:04:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id rv11-20020a17090710cb00b006d5c0cd5e0dsm1481465ejb.82.2022.03.04.00.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:04:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] tty: serial: samsung: constify UART name
Date:   Fri,  4 Mar 2022 09:03:45 +0100
Message-Id: <20220304080348.218581-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
References: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The UART name from driver data holds only string literals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 0b4f40044e87..279c413f2300 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -63,7 +63,7 @@ enum s3c24xx_port_type {
 };
 
 struct s3c24xx_uart_info {
-	char			*name;
+	const char		*name;
 	enum s3c24xx_port_type	type;
 	unsigned int		port_type;
 	unsigned int		fifosize;
-- 
2.32.0

