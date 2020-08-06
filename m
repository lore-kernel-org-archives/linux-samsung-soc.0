Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86CBC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45DDE221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738953;
	bh=b29MRqxgBIgA1mPnrXZBfnyrkbkNCjVraaT6UXOtfEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dF0f+VaaZK9Llu8B2h5hPvyd0/mCGSBFSEw5XEP9ooyO0Xjr0VEvvgOtTlIz5CbP9
	 Z9eSXukBW+LPpQLssOkRMavE1iWkeYnqO/mNf8Jje5NRsde4iGDXTq8rW3DLNObVxL
	 dk79e1OKSg1uoUJoWoaeqw3/8G5jKGCv/lnPUo2o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHFSfs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683CAC06138D
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:51 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z18so41378025wrm.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=l+Y4PAA9fdGSBBBW6oqoMtbOkO4wr96TBxesjGmzsTA=;
        b=ousxLHlYJl1gw2dtRvajuyLSF3JbJpjR97BqPFBc17X64higOHK9lMLjSW6aNdaZEY
         5EcEKQWT0R79QqBIUIYKQHpUzicQzvUTFQX4jtAJ+RHN24Aq8U4hg71Cu2zi43e+Mad6
         AjiIJbVP6WFLYwMeBx3eVnK44DMhhkuPNFSeiUIqHainZnXnxq/wZWA0KmGBRhV3yUHT
         WL3yUq+FYeGQ9OR7PRWmmNWMHkRmjTRrsAyHwpzJEPifTbrIzFOJ1GLY2hep0HlBi3lx
         TmZozvj5upKYto2y5+UfGBMh92lXH8Lock7S4y0gy41H2W3qIgiKjHyPML3avTmZxpOU
         Aopg==
X-Gm-Message-State: AOAM5325E2JnBwVMuQLp2tOqIJSjLyE+TcEQBhSh68E7mLOS6JSEHTVA
        2LiWC+z132tOJNddHxoAq4IgpbmzH9M=
X-Google-Smtp-Source: ABdhPJwoUPcBmpIp43kwCp3/rjzyKRHB26n/V8xWYWz7DFb7GsgorYBmfnaytY7Cq3UjFDhiv+GHuQ==
X-Received: by 2002:adf:c108:: with SMTP id r8mr9113243wre.41.1596738889739;
        Thu, 06 Aug 2020 11:34:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id v15sm7771100wrm.23.2020.08.06.11.34.49
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:49 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1540624lta;
        Thu, 6 Aug 2020 11:21:54 -0700 (PDT)
X-Received: by 2002:a65:608f:: with SMTP id t15mr7008343pgu.197.1596738113809;
        Thu, 06 Aug 2020 11:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738113; cv=none;
        d=google.com; s=arc-20160816;
        b=I3Ohv+I4rX6FZxoBmHBszFPDD2x/nBpMDrx+v5NABFc8zwGd9+Hp1EP/TS0H/Jz7T+
         mcfZwflwqPrN0pvjsKZ/TveBu9SEImlFXPHvLJKE3CYEVh3QcoDfekbLjHCiIMpnhV++
         wyIsaZg+fU6fcQw2W+Uz4w0tZp5V/+cq2sgit71QwlJ3iyUO3CadxSYbpsEqYlWMjfv9
         XioaZlZEaGZZxyyboU/+N5KQ2YvTSk+1m3O6CsDrA4FM76PZGUmhIUxcZoXtkGcUkOpJ
         NXg86r0mZrPmBZmVHb/4iQ/EcXVR/VHvGUkV6tToZJgBoCpXZ/7IVsjfbJ/Rcw2SCOv7
         ztjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=l+Y4PAA9fdGSBBBW6oqoMtbOkO4wr96TBxesjGmzsTA=;
        b=AQpSYZlF5/4K+3j0wd8uHoolSe9+7AO64sWChMGzoaRPFHm4HHz4ylI4PeCOnhajnk
         zNTSZZVUOqBtSy4QPcV3y+C0R8zjl7baMmeIklvaFX4HTYrghETMvK+AaNg1LoQcJdZq
         Hqj9IgQes1axnhDd+p/8TndjFvSepB8eHw1+oQFQ1cFiXCrptyyhRo5Ta8hjsoei/y5+
         2iDkRq2I5HtwyPCR1zA+OkgPVIj6yxDFH7y7c3rPxGK+3rQFqpXOvRq9XT4wQMPww45s
         dsSRZnpaVJYXAvnHC0d2jgi/HOLLNVbveSdOXP9CrVCzFm0f9rvDvEzKHVQ3oa7KD4gA
         MGzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b="P+Ms/qcK";
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id bx1si3948901pjb.147.2020.08.06.11.21.53
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id E308922CF7; Thu,  6 Aug 2020 18:21:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E5922CF6;
        Thu,  6 Aug 2020 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738113;
        bh=b29MRqxgBIgA1mPnrXZBfnyrkbkNCjVraaT6UXOtfEc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P+Ms/qcKNO2G0FWOOgD//IvyVOPidSgAKCGv1rXKO4QNsR/Xl/94V1mjKVGuZOytZ
         Wbtxpv2tmyd6r9c0MhBnahAazeRFJkoNiLl/HofTWEm3/tluO7xSK+AnttSq4Ph+MD
         x53DMsu/ZjR/Mi0g1D+If0GHf1g/IYfWYy6F/cUQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/41] ARM: s3c24xx: fix mmc gpio lookup tables
Date:   Thu,  6 Aug 2020 20:20:20 +0200
Message-Id: <20200806182059.2431-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: Qsznb6OG7Fgi
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The gpio controller names differ between s3c24xx and s3c64xx,
and it seems that these all got the wrong names, using GPx instead
of GPIOx.

Fixes: d2951dfa070d ("mmc: s3cmci: Use the slot GPIO descriptor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-at2440evb.c | 2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c     | 4 ++--
 arch/arm/mach-s3c24xx/mach-mini2440.c  | 4 ++--
 arch/arm/mach-s3c24xx/mach-n30.c       | 4 ++--
 arch/arm/mach-s3c24xx/mach-rx1950.c    | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 6da4dcfd5c0f..fe8f9f1bdc0a 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -141,7 +141,7 @@ static struct gpiod_lookup_table at2440evb_mci_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPG(10) */
-		GPIO_LOOKUP("GPG", 10, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 10, "cd", GPIO_ACTIVE_LOW),
 		{ },
 	},
 };
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index c09f61d35d57..9c71472c939f 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -467,9 +467,9 @@ static struct gpiod_lookup_table h1940_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(5) */
-		GPIO_LOOKUP("GPF", 5, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 5, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_LOW),
 		{ },
 	},
 };
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 5bfe9ef62716..65f48094114e 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -242,9 +242,9 @@ static struct gpiod_lookup_table mini2440_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPG(8) */
-		GPIO_LOOKUP("GPG", 8, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 8, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index b9ceacfdd6ef..152f09242579 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -388,9 +388,9 @@ static struct gpiod_lookup_table n30_mci_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(1) */
-		GPIO_LOOKUP("GPF", 1, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 1, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPG(10) */
-		GPIO_LOOKUP("GPG", 10, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 10, "wp", GPIO_ACTIVE_LOW),
 		{ },
 	},
 };
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index c46fb6b9e11a..65440c39500e 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -570,9 +570,9 @@ static struct gpiod_lookup_table rx1950_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(5) */
-		GPIO_LOOKUP("GPF", 5, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 5, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_LOW),
 		{ },
 	},
 };
-- 
2.17.1

