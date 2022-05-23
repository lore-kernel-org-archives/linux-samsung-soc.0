Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6BAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 07:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiEWHca (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 03:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbiEWHcS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 03:32:18 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F69E28725
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:29:50 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 219923F217
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653288180;
        bh=0Fn1JXeiAOQvsSv4ME7qjx3lVZQDLG08r06uAlMp+Ak=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=js1qMoqoMME8t78ukg0V2HnCD1AdUlBjqU28EN3w2rZecgaRGR/skKawwhXXKx7c2
         UX4gt0IuxAfr7wmAinYY5O1hMjKe7dE9DBaA3/Czga/p+P6cOn+/5CcvQvfrObmtw/
         KKMLwXac6u4XpzPo+fgEn7gfsKgXeqQ+TklNymYRQXfAJhvlz+L51wV0tJMkFhdMT4
         Jt+e9L793wjV27TGmVK96ZwrCsbiHv+B4O/0/UOW+A6NDJM5nhKBjq5J2nxnfNhp99
         pAvROTsuOznz5kB5QCAZbt+227NhNt/CMlwI4wEyIPxYt9T2YwvKaGMJLeIj28YrJL
         MyM0Gg/dUs82w==
Received: by mail-ej1-f70.google.com with SMTP id i14-20020a17090639ce00b006dabe6a112fso5406727eje.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 23:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Fn1JXeiAOQvsSv4ME7qjx3lVZQDLG08r06uAlMp+Ak=;
        b=oVJSbnUSbkCM2IkzYypH1cBBO8PCRJIE51RXuDQFqzD58ZPGANpUSJgfS0SXAfEOLU
         OqJ8+n448Y4V3yrtc8NTbaeLKsGKTSNFo8DvuwM0BIoendHhitnF2/LarvVS3VDtHzfN
         Dn/AFHniLuFG0aprjUMbKdLzoNboJ3km+AOd8Lau03yYtJ3zoLlXpUySuBmdfxuzqZft
         E2VJ2JHAfoOBSuEGZIsan53ZNyzw26c0heZlHvv56MUDzJ7xA5JXsEBvrorXnRr4vcAF
         /hBToinjNs5oxpzTrVkkzzftApf6xKYSIY4WHozZX1JHy9XIJjGx8/7oUzgYLpK/foZc
         CnUw==
X-Gm-Message-State: AOAM533Jtd70tOSVdOnTQv0xV0bfuogJMta+OX5l8f2ggZdMMfvS9ck7
        EsnXEEclR1ySdZVPD8ktr30/e6CQDAVpqE+LYR/ucdFJmue/uRLjpqJFdzIxwvWfBZgTc3B3xS6
        qFdGzMBLbXHH0yY2dwnSRZLghS3PeWYvOuSthneptH/NeVREm
X-Received: by 2002:a05:6402:174c:b0:42a:b4df:3aa7 with SMTP id v12-20020a056402174c00b0042ab4df3aa7mr22241466edx.263.1653288178997;
        Sun, 22 May 2022 23:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXGU3a9rNtXp1i8dxNZ2qWALsHyrukZ0RD+lIEHrPJw1VeHxe4hbjKgVr8+47QB60PgYV82Q==
X-Received: by 2002:a05:6402:174c:b0:42a:b4df:3aa7 with SMTP id v12-20020a056402174c00b0042ab4df3aa7mr22241456edx.263.1653288178851;
        Sun, 22 May 2022 23:42:58 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0042617ba63a5sm7792416edy.47.2022.05.22.23.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:42:58 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 2/3] ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
Date:   Mon, 23 May 2022 08:42:51 +0200
Message-Id: <20220523064252.11938-3-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523064252.11938-1-juergh@canonical.com>
References: <20220523064252.11938-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

While add it, replace tabs before comments with whitespaces and squeeze
multiple empty lines.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/arm/mach-s3c/Kconfig.s3c24xx | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c24xx b/arch/arm/mach-s3c/Kconfig.s3c24xx
index 000e3e234f71..a7625e772905 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c24xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c24xx
@@ -17,8 +17,6 @@ config PLAT_S3C24XX
 	help
 	  Base platform code for any Samsung S3C24XX device
 
-
-
 menu "Samsung S3C24XX SoCs Support"
 
 comment "S3C24XX SoCs"
@@ -268,7 +266,7 @@ config MACH_VR1000
 	help
 	  Say Y here if you are using the Thorcom VR1000 board.
 
-endif	# CPU_S3C2410
+endif # CPU_S3C2410
 
 config S3C2412_PM_SLEEP
 	bool
@@ -342,7 +340,7 @@ config MACH_VSTMS
 	help
 	  Say Y here if you are using an VSTMS board
 
-endif	# CPU_S3C2412
+endif # CPU_S3C2412
 
 if CPU_S3C2416
 
@@ -390,7 +388,7 @@ config MACH_S3C2416_DT
 	  Note: This is under development and not all peripherals can be supported
 	  with this machine file.
 
-endif	# CPU_S3C2416
+endif # CPU_S3C2416
 
 if CPU_S3C2440 || CPU_S3C2442
 
@@ -419,7 +417,7 @@ config S3C2440_PLL_16934400
 	default y if S3C24XX_PLL
 	help
 	  PLL tables for S3C2440 or S3C2442 CPUs with 16.934MHz crystals.
-endif
+endif # CPU_S3C2440 || CPU_S3C2442
 
 if CPU_S3C2440
 
@@ -515,7 +513,7 @@ config SMDK2440_CPU2440
 	default y if ARCH_S3C2440
 	select S3C2440_XTAL_16934400
 
-endif	# CPU_S3C2440
+endif # CPU_S3C2440
 
 if CPU_S3C2442
 
@@ -535,7 +533,7 @@ config MACH_NEO1973_GTA02
 	select S3C24XX_PWM
 	select S3C_DEV_USB_HOST
 	help
-	   Say Y here if you are using the Openmoko GTA02 / Freerunner GSM Phone
+	  Say Y here if you are using the Openmoko GTA02 / Freerunner GSM Phone
 
 config MACH_RX1950
 	bool "HP iPAQ rx1950"
@@ -547,9 +545,9 @@ config MACH_RX1950
 	select S3C24XX_PWM
 	select S3C_DEV_NAND
 	help
-	   Say Y here if you're using HP iPAQ rx1950
+	  Say Y here if you're using HP iPAQ rx1950
 
-endif	# CPU_S3C2442
+endif # CPU_S3C2442
 
 if CPU_S3C2443 || CPU_S3C2416
 
@@ -558,7 +556,7 @@ config S3C2443_SETUP_SPI
 	help
 	  Common setup code for SPI GPIO configurations
 
-endif	# CPU_S3C2443 || CPU_S3C2416
+endif # CPU_S3C2443 || CPU_S3C2416
 
 if CPU_S3C2443
 
@@ -571,13 +569,13 @@ config MACH_SMDK2443
 	help
 	  Say Y here if you are using an SMDK2443
 
-endif	# CPU_S3C2443
+endif # CPU_S3C2443
 
 config PM_H1940
 	bool
 	help
 	  Internal node for H1940 and related PM
 
-endmenu	# Samsung S3C24XX SoCs Support
+endmenu # "Samsung S3C24XX SoCs Support"
 
-endif	# ARCH_S3C24XX
+endif # ARCH_S3C24XX
-- 
2.32.0

