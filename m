Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B4C43460
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Apr 2021 20:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0EE96008E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Apr 2021 20:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243809AbhDNUe1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Apr 2021 16:34:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50458 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244242AbhDNUeZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 16:34:25 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWmD4-0007R9-PO
        for linux-samsung-soc@vger.kernel.org; Wed, 14 Apr 2021 20:34:02 +0000
Received: by mail-ed1-f69.google.com with SMTP id r4-20020a0564022344b0290382ce72b7f9so3935226eda.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Apr 2021 13:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6iWJ3bgZpUCfwGeaD2iQV5boaIsrvYIQwgNIcJKkeRc=;
        b=bj8JuV9Lckfaghcwn8IQIxrVSrGAKBzscxCyLGHHt0OTRB/y8HCSzydB9KCw8eIm89
         Rxy5s2GR6OpIpBAslmxl1iVJcsam+TobHVQ+wjpQsIjp4d/nBZbfJ14w+OUCt64K2iD0
         6/npQtB6VlD+Xxd59CzSmDGjZhvgtYrJpuOcqT/JzaUmZ/lmbZX0q3MdOB0czaMsvvCj
         75IqtRd5aBY3iCLEIvZyXdbXBjbeqZH2U5/vy7x78PlcJiUUD2eeRZsrzgJi4FN4S79K
         a8tUy7U6mUn16+DvP+WW2uIoJtGTzwJS6gzGtzAumprdIv60JK4BAF8Cr7b1JKcWJTJd
         FiGQ==
X-Gm-Message-State: AOAM530N1MFkrFGniOrs7027dzTCgDkf22lBXWIy8gZdlkLeVtUgQ0DX
        UGv0uHxsSibczHZbtlvvaS8oo8KFZEqmrMRoz3rgwvWyvDoXVZdbalKPOyHQZKnhnHUeZKSZl8+
        8klISFR1iOdBWrmfZ8b8asjB3m+xcWko8jIALIcrCeDeF0oHj
X-Received: by 2002:a05:6402:34d5:: with SMTP id w21mr87966edc.14.1618432442539;
        Wed, 14 Apr 2021 13:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgIg2g0mP+FUvTRFflQtwAfKDR1XJ2BSwJmU+aJUp/4sLcSAVyFpDY3szKBQWx2xkzpd2sKg==
X-Received: by 2002:a05:6402:34d5:: with SMTP id w21mr87946edc.14.1618432442372;
        Wed, 14 Apr 2021 13:34:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id q6sm372209ejt.51.2021.04.14.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 13:34:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 2/3] spi: s3c64xx: correct kerneldoc of s3c64xx_spi_port_config
Date:   Wed, 14 Apr 2021 22:33:42 +0200
Message-Id: <20210414203343.203119-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414203343.203119-1-krzysztof.kozlowski@canonical.com>
References: <20210414203343.203119-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct the name of s3c64xx_spi_port_config structure in kerneldoc:

  drivers/spi/spi-s3c64xx.c:154: warning:
    expecting prototype for struct s3c64xx_spi_info. Prototype was for struct s3c64xx_spi_port_config instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/spi/spi-s3c64xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index c6d7641ea342..eac3c300f806 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -128,7 +128,7 @@ struct s3c64xx_spi_dma_data {
 };
 
 /**
- * struct s3c64xx_spi_info - SPI Controller hardware info
+ * struct s3c64xx_spi_port_config - SPI Controller hardware info
  * @fifo_lvl_mask: Bit-mask for {TX|RX}_FIFO_LVL bits in SPI_STATUS register.
  * @rx_lvl_offset: Bit offset of RX_FIFO_LVL bits in SPI_STATUS regiter.
  * @tx_st_done: Bit offset of TX_DONE bit in SPI_STATUS regiter.
-- 
2.25.1

