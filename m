Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33999C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4C861039
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346092AbhIXNd0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:33:26 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59724
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346564AbhIXNdW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:33:22 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2379C40292
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490309;
        bh=RftmjF1qZSv6klWcASBW873Ilh1kdlTIzs3Yp04z5B0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OUDvoBWmMz4443YZmaLrGG4ZBaBkFf0aAs47y6+HWmZvSRMRPjevafiL2NUF88KvG
         25AdeO2g4PcBT7r7a8PVsRr9qYU+MdK2PeRepX/duv/tpuj+QloCogGuBgDsjrgvVy
         F0aiyu8qeWxww7lR/jxXgwgerWF8LUEq92tOLNgekgcRrGS3pgccEeqRBRAdDYfsJC
         CaJ9FcHzyF731EV5lM0iuqxmuwZux9lP0Q13/xpTyVeEmdHaDlQWcbWOz+/5whD8u1
         QwJPmhrVoXBvha9qwupOzP0LyIOxD0MMZBKYGN3xOheZi3Njn8Yah4egGaJe6tsS9o
         MZlgoNuRSysXw==
Received: by mail-wr1-f69.google.com with SMTP id r9-20020a5d4989000000b0015d0fbb8823so8052163wrq.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RftmjF1qZSv6klWcASBW873Ilh1kdlTIzs3Yp04z5B0=;
        b=fy6rv7m/VHcgBfdg2NrhbG1ERVGwPmbHRSilUm5xKiV68vxMcsbMYARlgpiQmeQpQX
         fft0/rOctKqwsMHVCEeCqoU5VtIdnkN293O+dDpSOkUmgVpeNtJrRtHUNPUWQ4PcS8pB
         T9S+/s94HvnOl9RBJYa5nXXIq62H4d7Z5PZmzJDwW8Qp6EGmV5Hr9h1POudKpMgGb3OU
         /KjtBL6qkRoG6KFmdsHsBKxLd8feptwLXG/SI02VZWpxOMsvN+oLSEekeT11s+DyMKo+
         Y3IYylRuzvTwm9G1jJYGu7n+OveuJ9UDAV15hlqWBfL8l6cf9mEN0OGgT06PDdTSrXKE
         mf7w==
X-Gm-Message-State: AOAM5317K6ccVVeO8gOyfD9xarRringgOKVxxWAhy/dmmTQAt1K1zlmv
        98JJ24Sym1l/T9BrMpgILw2qYpW4APmA2KLQY/9BtQHgo325Utch1pItuBW3F8KITbeJZpY5gwu
        rO/8T7HRpgd7tGW7+Ej3i/2xcrriOttcQ95o6X3y5czbr1PsL
X-Received: by 2002:a7b:c923:: with SMTP id h3mr2206197wml.28.1632490308540;
        Fri, 24 Sep 2021 06:31:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXBlQtFfnaiO3/Jj1ihFUm30hEdDJWLlsLaaeE+RNi9Ds1tVr6UL5QwkjiPuJ4jdaXffJHg==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr2206188wml.28.1632490308410;
        Fri, 24 Sep 2021 06:31:48 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id u13sm8240290wrt.41.2021.09.24.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:31:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: [PATCH] spi: s3c64xx: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:31:14 +0200
Message-Id: <20210924133114.111777-1-krzysztof.kozlowski@canonical.com>
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
 drivers/spi/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ea824b0012c6..c1c8e15c01a2 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -747,10 +747,11 @@ config SPI_S3C24XX_FIQ
 	  TX and RX data paths.
 
 config SPI_S3C64XX
-	tristate "Samsung S3C64XX series type SPI"
+	tristate "Samsung S3C64XX/Exynos SoC series type SPI"
 	depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
 	help
-	  SPI driver for Samsung S3C64XX and newer SoCs.
+	  SPI driver for Samsung S3C64XX, S5Pv210 and Exynos SoCs.
+	  Choose Y/M here only if you build for such Samsung SoC.
 
 config SPI_SC18IS602
 	tristate "NXP SC18IS602/602B/603 I2C to SPI bridge"
-- 
2.30.2

