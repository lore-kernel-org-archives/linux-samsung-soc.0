Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06882C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4ECD61038
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346118AbhIXNbo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:31:44 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59602
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345349AbhIXNbk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:31:40 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DF3F240784
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490206;
        bh=F70yOyVZZjxlDll0pjQntOrMr5BdXyTooQkEjSqxu5A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=p3OPG05jmZFoz+Vj6jlyX83cYRfVRStNntZv/z69jPq8/hSvoJhC1gZxV1pAQ8gez
         0wHLj0O4WQPzgVln+BW6CFr2/2y63kEO/jL4tjE4OefUZ/4fZ9NVceZA+GEUUFb6Dd
         PyLe4YmUY3X4nMIczFH8yrpQ6G265NUDwckUiE9V2RpDcx3oyyyrwNQPo/xmsA3RyC
         K4vrgjIM0ufAobx7u/hupJ1Te8md1C6E+dGIMl5RkrnYrmZjAuMnS5Onb418TPIw1Z
         x3h6zQy6agJOVkJhHmYucFtReHaa2SAF5gPiHEYWE2UN23KwQ6/CfXM1NcSrU5szzN
         6hpkLrob/1G3A==
Received: by mail-wr1-f71.google.com with SMTP id h5-20020a5d6885000000b0015e21e37523so8068981wru.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F70yOyVZZjxlDll0pjQntOrMr5BdXyTooQkEjSqxu5A=;
        b=SjYwUFpRBKp9vgV8FULCExSB3bvMmUUIRAEjso5jSaLRx7IPF0utzdNYhOJn1zxvMC
         fYj2j1ri9T1eBlRcmNoTRYvA8Wz1JElYzq0mgAAcDDqS4VMNeDsClbdY+W3HZ95YPV5y
         kwUHIgzpB4xLGqAegzocu+ka/BKUkJ8eY7OlkXDHJ7a1fVx3YFCK56e+lnYf+CgYcx9W
         cWZScR4Vxn0GU0RI0Tk8Wjouo2ejp781gXStR9sEQAtWZIZ7GOo22Uc3lc9MCUeT4kaX
         ZHeCVcE/Sc9ERJU0xmBLB6YPaYY8B5dRBE52MC4qzBXsfw0d9rlp6p/mEQVVZcv+CzE2
         cs+A==
X-Gm-Message-State: AOAM533TASBg/e1Rt41UlvHYrSgg85lT3SBlKlnKobB6NU/HOdJ3ltk7
        Z+v886lfq0ibhnf1s+r39vXepwy+ih8zDJwKOz0abSOxKkCAZhfTooBG+eGuFjwird3lVrOy+b/
        B98W3AD5x7qNqqCvhMyYYavmj07OgRRy4vbLtQu5HAuEUcK1/
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr11248674wrt.209.1632490204794;
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkbc8Da6V2TsZslzItTVmktEElS+30iL6GeasX73+gONH6uwFQeCmkiLeu5/Bg32tsZMpPnw==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr11248655wrt.209.1632490204659;
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id i2sm8034262wrq.78.2021.09.24.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: s3c2410: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:29:30 +0200
Message-Id: <20210924132930.111443-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/watchdog/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b81fe4f7d434..75591ba261e2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -496,16 +496,18 @@ config S3C2410_WATCHDOG
 	select WATCHDOG_CORE
 	select MFD_SYSCON if ARCH_EXYNOS
 	help
-	  Watchdog timer block in the Samsung SoCs. This will reboot
-	  the system when the timer expires with the watchdog enabled.
+	  Watchdog timer block in the Samsung S3C24xx, S3C64xx, S5Pv210 and
+	  Exynos SoCs. This will reboot the system when the timer expires with
+	  the watchdog enabled.
 
 	  The driver is limited by the speed of the system's PCLK
 	  signal, so with reasonably fast systems (PCLK around 50-66MHz)
 	  then watchdog intervals of over approximately 20seconds are
 	  unavailable.
 
+	  Choose Y/M here only if you build for such Samsung SoC.
 	  The driver can be built as a module by choosing M, and will
-	  be called s3c2410_wdt
+	  be called s3c2410_wdt.
 
 config SA1100_WATCHDOG
 	tristate "SA1100/PXA2xx watchdog"
-- 
2.30.2

