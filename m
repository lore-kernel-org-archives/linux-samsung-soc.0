Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E06CC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Apr 2021 20:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 597C961177
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Apr 2021 20:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244721AbhDNUe0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Apr 2021 16:34:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50452 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243809AbhDNUeY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 16:34:24 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWmD3-0007Qc-MV
        for linux-samsung-soc@vger.kernel.org; Wed, 14 Apr 2021 20:34:01 +0000
Received: by mail-ej1-f70.google.com with SMTP id c18-20020a17090603d2b029037c77ad778eso217701eja.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Apr 2021 13:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2hO5DXMeLJZo3Sq4pJYNG0FO8H5GrNmCBQcI+p7buM=;
        b=a2LjFkghuwmUPKd6maMUl1AYsLnemKpNm3r1RRVM36JtK48zlaxBWH6P2dBdVxAXUE
         KhluGEb5XiJA0K8VWU4OW1c2Vh18+8kjU7+s6tmMul2BQ76yEvCKyBLywt2DA5HSghUs
         MYf5Dd3Jc7s6+4RAd2mwcqQEsL12HFwDxO25uvsOKtchQeFSrCW8DIKlLM5KZogT+xAZ
         OZjFPH4ONL8eMpw7yHzjs9gTSf7mRU0KJ9/Cl1J+znI0K+p/ynJSEbZUOWj+yCKLLkYS
         FRTTEKlFLfBGhShFHyb2rTlbM8LT+LZDXd1kiQsKD7TJsGooPh8/5kyD5zHBmK/wOlQC
         YY7Q==
X-Gm-Message-State: AOAM531BIqKEDEUf1qEdH0cx92KaOocnNYPTXGYcVYIXMIdc3fjeV0QS
        fRDeADNBimSTuBD+z7BuEDSb0Ht5dtvbTocTLKNtuqb/5mepaPww9oU0cwYkibEdMUotstfcOUb
        gWmLHUbl3qLmdPzeDy7563Dn2rXCahl5r2DeOBTE2ZOMmByEp
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr72096edd.168.1618432441434;
        Wed, 14 Apr 2021 13:34:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Z5ptlAYigxFNCd5S/xT8AwrP3ue/ADlxR9AJcWKfkq3TLq+hwkPI3X1JJfIFB9MPghvAVg==
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr72086edd.168.1618432441295;
        Wed, 14 Apr 2021 13:34:01 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id q6sm372209ejt.51.2021.04.14.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 13:34:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 1/3] spi: s3c64xx: simplify getting of_device_id match data
Date:   Wed, 14 Apr 2021 22:33:41 +0200
Message-Id: <20210414203343.203119-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller and to
remove the of_device_id table forward declaration.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/spi/spi-s3c64xx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index dfa7c91e13aa..c6d7641ea342 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -15,6 +15,7 @@
 #include <linux/spi/spi.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 
 #include <linux/platform_data/spi-s3c64xx.h>
@@ -1048,17 +1049,12 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 }
 #endif
 
-static const struct of_device_id s3c64xx_spi_dt_match[];
-
 static inline struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 						struct platform_device *pdev)
 {
 #ifdef CONFIG_OF
-	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(s3c64xx_spi_dt_match, pdev->dev.of_node);
-		return (struct s3c64xx_spi_port_config *)match->data;
-	}
+	if (pdev->dev.of_node)
+		return (struct s3c64xx_spi_port_config *)of_device_get_match_data(&pdev->dev);
 #endif
 	return (struct s3c64xx_spi_port_config *)
 			 platform_get_device_id(pdev)->driver_data;
-- 
2.25.1

