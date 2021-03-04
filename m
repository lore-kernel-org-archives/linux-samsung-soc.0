Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F56C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Mar 2021 07:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7941764F02
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Mar 2021 07:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhCDH7Z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Mar 2021 02:59:25 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:35941 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhCDH66 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 02:58:58 -0500
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lHisD-0003aH-0o
        for linux-samsung-soc@vger.kernel.org; Thu, 04 Mar 2021 07:58:17 +0000
Received: by mail-ej1-f71.google.com with SMTP id si4so9485119ejb.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Mar 2021 23:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZS+Wjj9yifYGxgztVZfL5BlLqq5E4PMFpP+6y9L/pU=;
        b=aEi/m6AQJ2Y/rTXMYXxiziXku4zS2LCoJ7/gz3TFRgFGoZFgHVy4CWZvnP2K8bZwCn
         YIL8IA0Yu29GbLa4BKBGjIVFFyKfBeuEgfRPPJ1hE5X6LOUOm7xX+eawYDfJBhskvKSW
         9HiO8uJI6i2vQBty/R//fR6cVolul7DL6AheViiqML3GLruuY6CWDCqe+I5nXU2szbC8
         RHZeIKKqwA+JKB66VUCB0oMp4Rxw78T87nozONdm2NGBF3gaKCls78U6jW/6opZIGmJf
         5F+zEc5J6EAU0mMeTjq8kS0OeD1+lls2MM/Vuhe5Ib3eKY5pGM6Nj+Rum1pscP50osIC
         tPwA==
X-Gm-Message-State: AOAM530i3Hv5PM3t2qLpnyv/Ytc6o3QK3WtK5WSgWc7/y4Fg7Pjkr5Ry
        1IhIGVi5O6KafDnWdPiv0Va5q4nWTr+8fu4M5dw/AJl5Zt5Ar3OWDui6Dl1ogb0HKRPwwb8pdJG
        AukmPbUx7Stqi1beEt82VVCKuBqhNW/4MyI7k2DP2TIagLo7U
X-Received: by 2002:a17:906:5d06:: with SMTP id g6mr2946693ejt.216.1614844695855;
        Wed, 03 Mar 2021 23:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5dcwJ/TO31H0otx97FsiYbczrVgHQVISPQNcxBSA18N6EMSggzX74CUtObMjvnlulxjHazw==
X-Received: by 2002:a17:906:5d06:: with SMTP id g6mr2946682ejt.216.1614844695730;
        Wed, 03 Mar 2021 23:58:15 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id j24sm10181150eja.61.2021.03.03.23.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 23:58:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: use Krzysztof Kozlowski's Canonical address
Date:   Thu,  4 Mar 2021 08:57:51 +0100
Message-Id: <20210304075751.9201-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since I plan to use my Canonical address for reviews and other
maintenance activities, reflect this in MAINTAINERS to avoid any
confusion.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d3b62796495..27adef3975b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2375,7 +2375,7 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -10879,7 +10879,7 @@ F:	drivers/regulator/max77802-regulator.c
 F:	include/dt-bindings/*/*max77802.h
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
@@ -10888,7 +10888,7 @@ F:	drivers/power/supply/max77693_charger.c
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
@@ -11540,7 +11540,7 @@ F:	include/linux/memblock.h
 F:	mm/memblock.c
 
 MEMORY CONTROLLER DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
@@ -12887,7 +12887,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
 F:	drivers/regulator/pf8x00-regulator.c
 
 NXP PTN5150A CC LOGIC AND EXTCON DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -14178,7 +14178,7 @@ F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -15701,7 +15701,7 @@ W:	http://www.ibm.com/developerworks/linux/linux390/
 F:	drivers/s390/scsi/zfcp_*
 
 S3C ADC BATTERY DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/power/supply/s3c_adc_battery.c
@@ -15746,7 +15746,7 @@ F:	Documentation/admin-guide/LSM/SafeSetID.rst
 F:	security/safesetid/
 
 SAMSUNG AUDIO (ASoC) DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
@@ -15754,7 +15754,7 @@ F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -15789,7 +15789,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -15814,7 +15814,7 @@ F:	drivers/media/platform/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 
 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Maintained
@@ -15834,7 +15834,7 @@ S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -15866,7 +15866,7 @@ F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
 SAMSUNG SPI DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 M:	Andi Shyti <andi@etezian.org>
 L:	linux-spi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
-- 
2.25.1

