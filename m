Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA75C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B0A461039
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346449AbhIXNej (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:34:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59776
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346199AbhIXNeb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:34:31 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC5D740783
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490377;
        bh=FL7LN+mY0sAFsfGJS3vJofU8rnqGhT82V24fURNA7ik=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=L9G8tsAVQLAsYQH70/lxIuYF1AbQLFfKQmd+jTxO3xEf3tAwFMbRe/jzgMiXXCoZB
         C0/AOj9BvoKvD6lMgrC6OttrgAxMDgKdVACv5FxXoZ4S1ESVcEAYx/irg/c0u1uKh3
         bW36yEQR6A1WJ0/BapkcUTihYPzIzfbgmtpPiXbup4kztnD5gptMW5GepxNS/yfZ68
         n+7y0UqXTR3zjfBLKIZj8jVfPfhQEbooMkuL+lDI7mIOYhbXNQZvTg6k/BPOH6GyE1
         mHOwgCeh2dYqF1IxZhZwGHsZUfdlemTM6sq55kkjbPDAJFhb/W7uM/hRDxR0WIjxIg
         54fonPEQ4tumQ==
Received: by mail-wr1-f71.google.com with SMTP id s13-20020a5d69cd000000b00159d49442cbso8081616wrw.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FL7LN+mY0sAFsfGJS3vJofU8rnqGhT82V24fURNA7ik=;
        b=bph1HvsMdSeH4jAGZw4Rf9If3QvioyLSffEwkjo8jcarNsWGIk8IhFvsTJja74ADYz
         mnTN1PniFJSrkgnQU4/JD8Dq/XfyPgqoQF9aKWvLFnhfBwDaKDn/mMlxzO8JPVThql2O
         znj9kx49O39fiBuyf7KZhiKc96rnqBjJrIAaXghzqAP9fj3RnXhxP+bXHDnnQCekE37+
         YRoGhh4PEzGvwbEZMOWsohHdNWaRV3gpBI2x3MrbBA5EeMQVCmesdFGjMDgV+HzGWCWj
         DGiCZrr7j9tfcoipULJM/hbbJBINuXKOX8aIJGCeKNe4A7sCAWBp3QcbNljqq2q9uSwb
         HO7g==
X-Gm-Message-State: AOAM532PQpTyvec+4XYQ/LqQN7b/pQgzN+5k+WOJyrk9JBscbihafJN9
        KGT2jvDkVrU3T1+y5sg49JPJYTbID7v5g8QkVd8Ss3/SDRwY5B6pyh99SXFrAxhCVDoOujgTVAN
        n7gDLhkiqrd0wpld6vchKnDL+FDNcIcQknGqt2S+MmcBRCcR4
X-Received: by 2002:adf:f011:: with SMTP id j17mr11519327wro.320.1632490377450;
        Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtCm9RyYQOc1rQoJs64djwg6MaktARYE5Dwo4MkZ1BJhhhsyVf6I7Y3jYFIqesDDyEsd9yIA==
X-Received: by 2002:adf:f011:: with SMTP id j17mr11519306wro.320.1632490377305;
        Fri, 24 Sep 2021 06:32:57 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id i7sm1003094wrp.5.2021.09.24.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:32:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: samsung: drop Exynos4 and describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:32:23 +0200
Message-Id: <20210924133223.111930-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

None of supported Samsung Exynos4 SoCs (Exynos4210, Exynos4412) seem to
use OneNAND driver so drop it.  Describe better which driver applies to
which SoC, to make configuring kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mtd/nand/onenand/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index 1a0e65bc246e..34d9a7a82ad4 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -33,11 +33,12 @@ config MTD_ONENAND_OMAP2
 
 config MTD_ONENAND_SAMSUNG
 	tristate "OneNAND on Samsung SOC controller support"
-	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS4 || COMPILE_TEST
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
 	help
-	  Support for a OneNAND flash device connected to an Samsung SOC.
-	  S3C64XX uses command mapping method.
-	  S5PC110/S5PC210 use generic OneNAND method.
+	  Support for a OneNAND flash device connected to Samsung S3C64XX
+	  (using command mapping method) and S5PC110/S5PC210 (using generic
+	  OneNAND method) SoCs.
+	  Choose Y here only if you build for such Samsung SoC.
 
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
-- 
2.30.2

