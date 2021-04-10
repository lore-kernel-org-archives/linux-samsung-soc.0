Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB62C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Apr 2021 16:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D95F611C2
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Apr 2021 16:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhDJQrr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Apr 2021 12:47:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49506 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhDJQrq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Apr 2021 12:47:46 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lVGlf-0008L1-5c
        for linux-samsung-soc@vger.kernel.org; Sat, 10 Apr 2021 16:47:31 +0000
Received: by mail-wr1-f72.google.com with SMTP id o11so3717744wrc.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Apr 2021 09:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yja8hXnSiAu+0aHoGZXireKiKWwNFLqckJS2FN9snds=;
        b=Gjkb8G8HzWbnL0d8KZr+dXG7oP+p9t14N0a/a8Ix9pYsq2dyM9cSXmgATz4BEAuJoI
         /Zw2vbgRe5EpBqEjWj+pQpKo6pRGYggZN4rx/Ue/IweXGYueLA7MyFmqpeyqg0oMgqp0
         jVP28hp+29wVChBox2SteKtem4NbWAWVZhyvZ9V/XmN10DiGdHuQ0sym/gIdh29pQbES
         UojB00/Zl+DcKIkXWHIKgUrH9Wb15A97YTnAogLg91YXtdJAPI7IFxBZDX2m1y9S/5Qq
         1TOswkYdZqqwPRVfUcW5NF9asZTGOA/y+zTsJGVEnNOBoZHxpg9i9hcx5DeIMQceWGNs
         6oVQ==
X-Gm-Message-State: AOAM530huwfc3JEvwSxuQX6lyxa85D3Wl6EqSiIPrOD8JxGC5+M82INT
        tCc1xEXxdkWDwC7Ulnml0CEr8D9VLE/9DTxHQIGaPAxi4DlVIAyeBD4DSo7j/wzV6HaGPhyKrLf
        uWd82nt23jeTF0QxaGwCSImpo0TQCRaP2PtevzrJCamiW+O4R
X-Received: by 2002:a5d:5711:: with SMTP id a17mr2657280wrv.342.1618073250569;
        Sat, 10 Apr 2021 09:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH68hN25kDxZ6InU8FQmZEZIFAyVtxpAPrME+esYPR8r0CNYLqCCdxgrzUaS0vKsgog0iRDw==
X-Received: by 2002:a5d:5711:: with SMTP id a17mr2657269wrv.342.1618073250459;
        Sat, 10 Apr 2021 09:47:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id o12sm10130918wrj.34.2021.04.10.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 09:47:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH]  iio: adc: exynos: drop unneeded variable assignment
Date:   Sat, 10 Apr 2021 18:47:28 +0200
Message-Id: <20210410164728.8096-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The initialization of 'ret' variable in probe function is shortly after
overwritten.  This initialization is simply not used.

Addresses-Coverity: Unused value
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/iio/adc/exynos_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 784c10deeb1a..2d8e36408f0e 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -794,7 +794,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
 	bool has_ts = false;
-	int ret = -ENODEV;
+	int ret;
 	int irq;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct exynos_adc));
-- 
2.25.1

