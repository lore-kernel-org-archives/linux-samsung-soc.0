Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E06C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 364EF610C9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346614AbhIXNhZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:37:25 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37986
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346561AbhIXNhX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:37:23 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D866840198
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490549;
        bh=bqjANAhLzTfYF8WKzQgXTtXqvH8y/Gn5SAe1KVujuGM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=uD4HnNysPqiHPHevHXimsEwjQXc6cZgGi0VNs9P5q/xRxjKVP6WyzwbmYTGrfhHUd
         LYJR+yAreGVdocX+rz3RMdUriQPyGaVuJAlkSW+Xtyv+dkYB7k13FbMcLEKGzozU/T
         BAI7ulE4k4Jlyhx3QhjBx/vPc/zGAXPFtS3LeJ65V5ly6Ptn13pyt8fjupjFowho+j
         bXHjrO4g4uvScktdpcHCF8YoXCVW181mNV5Bpfoi4Pv+akn1ShJ95XjHmPro5z0OVB
         NZlqBcAwPFIz+wCzo6Fx+tg1O2ExIYSeWHXBgBYldEekUzTVvn7r/DBUI/AQsEawA5
         +scFrlLQkub2g==
Received: by mail-wr1-f70.google.com with SMTP id r5-20020adfb1c5000000b0015cddb7216fso8112964wra.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqjANAhLzTfYF8WKzQgXTtXqvH8y/Gn5SAe1KVujuGM=;
        b=XXK6/NQks2i8LngYJ18in80fSLamlzFIdbOEoJ/ezgaGccp3oYy5lPyZrIcaEergmI
         E0NbN6tRGEX751etrQuM6GAUPkRG7Mln4dtqb+vQJkEnc8a4b+7qf3Bkuv5MEhP0XIrJ
         KgeWs7y0gYRO9nVIdA82+0hKKTdPVoA5jo5DawvM5O98+7KJMzh8koRKmJaVIVim9jqq
         K/OX3//gPCeqm6cuX0PqY3EoAEkd0funbWMPn81Es3bTZCENMHskK+mlX/2RQ7AICu0/
         71JS4L+4/gTI+6PcnVR8fqBRHhReJYbueSRIzja1naFP8bwT61LMYiIuWRg3hBlCfwfz
         dwDw==
X-Gm-Message-State: AOAM533VyRilU8uKscHQ6E+wvJTTknPAQArxGOntMFe3AoESEzZDUzms
        +4bYIh2SUlbWGTo3r+y3bVq5HhyoI7BantOWH6pkmvByi1qg1r0KA/pkai1tbvLi3plTHUkrZKT
        nBBd9YiOI3pNOnJ/7gB4YwX4yunG2mCpNuu0VjcRdozw2C1r1
X-Received: by 2002:a1c:2289:: with SMTP id i131mr2134463wmi.179.1632490549630;
        Fri, 24 Sep 2021 06:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7rmLq5yNcAl0LcoydbosbByRnsKNYZnWMqikQXlR6Bxuv/lGwl1503lvycrJ3IDL2fFdj1Q==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr2134451wmi.179.1632490549491;
        Fri, 24 Sep 2021 06:35:49 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id 25sm14091675wmo.9.2021.09.24.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:35:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH] iio: adc: exynos: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:35:15 +0200
Message-Id: <20210924133515.112357-1-krzysztof.kozlowski@canonical.com>
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
 drivers/iio/adc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index af168e1c9fdb..6cc1268da184 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -430,9 +430,9 @@ config EXYNOS_ADC
 	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || (OF && COMPILE_TEST)
 	depends on HAS_IOMEM
 	help
-	  Core support for the ADC block found in the Samsung EXYNOS series
-	  of SoCs for drivers such as the touchscreen and hwmon to use to share
-	  this resource.
+	  Driver for the ADC block found in the Samsung S3C (S3C2410, S3C2416,
+	  S3C2440, S3C2443, S3C6410), S5Pv210 and Exynos SoCs.
+	  Choose Y here only if you build for such Samsung SoC.
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called exynos_adc.
-- 
2.30.2

