Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A2DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0504461208
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhKKJPI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:15:08 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34112
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229625AbhKKJPH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:15:07 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 086CD3F1CC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636621938;
        bh=COHbret3CYWs1LPEWi5njubL+5DtolSP4rEmltng+R4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=Fk8ng5vx+o6hc0/vMaTokO/Z7SeUqv6ukmF/lkDSvxhrEgocFt2h743KP9MmLT0ch
         38DoKGryqszVUNs0Dk66YMAqnw3XF57fnCilnfz0I7/bkETHBvaPZLc9S9Co9T4xWu
         EqjLVFLwyLeMW5PWdr1TG7WDmefbHcoSRobsTJ0M8eTB09B/L7JKGBepaBZPh2yiDx
         uEYyuWXIDR3H9afMG79aQLBjLJRuRbWa+dSm3TeVWFxxe9nrqnV6/PNAJEgkS2rqA8
         mneJs7/pnWZ7Gyh7UXqBQ5zAZrt71cfmRG8KoGzDzHbZnWiJ/DafDFGHD/PVdQeKTq
         iAe5HQ+ZZBgXQ==
Received: by mail-lj1-f199.google.com with SMTP id f6-20020a2e9e86000000b00211349f9ce3so1536148ljk.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COHbret3CYWs1LPEWi5njubL+5DtolSP4rEmltng+R4=;
        b=ooCMXjvhN3ds+ujJsslWbFNDEQt8KeSb1q9TG1XT0VDUzpye/ZDCoYIBs4fZOUgYKH
         GD8iDNalqgoY00ENhV6zSI6swMHhEEFS2Mnun7wsC5nsOgtrK7VshjhoQs7TJlir0w+s
         M1HeE0xRa08LIh9dukOHFvauZoSvGHekbUsDEfYGGn9TwGU7FX2Nbd3HqiTBGYNWP5Px
         RYoXQtHI805Wi52cyUhPDbxyF9jf8qkadoPrG21uGUWsWTIDfDt/aKqljGZnNt0cCe39
         3ztRkJzcwJZbQw4Ix3szGEoxONFAXafENxWFCzgsKp1CBj6+jzrx4HgTqYMm9cLsRhmv
         WY3A==
X-Gm-Message-State: AOAM530Iayl2vx7ey4x0MViJEdIraPzQnepQKBkVwcm8vvC44b0RPUfz
        wiq5IVnBIWUe/qyzrjEb5cAq9cEFFkk907+xhczTjV1JcIhjRHi6RbY+3E+0vaCs6dOMR+EU4ij
        nolPeVd+/zhcy/LboZCHDKO9xqm1P6ezq0hROLKYog6uPE3Hw
X-Received: by 2002:a05:6512:159d:: with SMTP id bp29mr5203079lfb.257.1636621937525;
        Thu, 11 Nov 2021 01:12:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw50uaVBUyMp68i8IYHq/Zi1gbhDBuJB9AdjaC3oCIQ1IUx0+dBC99oJabniaazPTA5FmmCGw==
X-Received: by 2002:a05:6512:159d:: with SMTP id bp29mr5203063lfb.257.1636621937265;
        Thu, 11 Nov 2021 01:12:17 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g22sm230580lfr.237.2021.11.11.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 01:12:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: s3c: include header for prototype of s3c2410_modify_misccr
Date:   Thu, 11 Nov 2021 10:11:23 +0100
Message-Id: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Include the header with prototype of s3c2410_modify_misccr to fix W=1
warning:

  arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
    no previous prototype for ‘s3c2410_modify_misccr’ [-Wmissing-prototypes]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/mach-s3c/gpio-samsung.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 76ef415789f2..fda2c01f5a08 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -35,6 +35,7 @@
 #include "gpio-core.h"
 #include "gpio-cfg.h"
 #include "gpio-cfg-helpers.h"
+#include "hardware-s3c24xx.h"
 #include "pm.h"
 
 int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
-- 
2.32.0

