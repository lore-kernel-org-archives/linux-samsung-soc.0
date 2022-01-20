Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E98C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jan 2022 17:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbiATR6G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jan 2022 12:58:06 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40670
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233209AbiATR6E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 12:58:04 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A3CFA40037
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642701481;
        bh=bto/xpfUsOVGNmCnHot8/BAzxWmx4lezX3yYM6aPOPk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vhcDZZRFEmkY22c6I7rDHDL1V+VoQMk+AkUsg7tRkTtgS7i5bTgxltllAirbqj0aB
         onvYTPf7zzdO1IUmOX778SJ/I5c4fEoefhVdkt6DtjwMFin5NM/W75vACwUJT60JVF
         dfAZ+xddDrgcuKNn5MVP4rNGW58wrH14yi6SbRq5Lj6gFpI623GBdipUp1w+lLRzV9
         LIu+oiFDhdo7ievbKBKwayvSDvEl4+1Gf2qkm0+yNs7JLkTFQa3mrO0IYLT0DyugJ5
         P/B9eMHnZQtjnDH+XH4iklSCvP82IFUAVt7CGSj6N34KmiqKDoG4bOVhNqb7KDxIdh
         Kf2MBL/ycgarA==
Received: by mail-wm1-f70.google.com with SMTP id a3-20020a05600c348300b0034a0dfc86aaso7405801wmq.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 09:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bto/xpfUsOVGNmCnHot8/BAzxWmx4lezX3yYM6aPOPk=;
        b=0ezy8b6r9FvwptayxmhquazmtO64E+uJDpiDh/W1pkZ+HVc1st0qGvpxPy7muHnYSm
         M6hx0R0vv7TV8IfI7JDZdPEx2jOPEgw8d5T9OU0KdX3XEaQU6o722WEWkEdovYNNlhLQ
         i3CX9pv4oM0R7X14fSzsgGc5YyxnNitz9OrT1uzdvor/vvB+LXRhPTDOrYF8eJ1vANhi
         FzdgjGPndANBIZvsz3WZEEuMbIrdi0iQH68e/G7d3Sbaas36oRw0lUs5WBj6x+XvvxUo
         3kDyh4FyIHYgd0vPVIiyPr9h1rRe++9WLV73HtI/HnyLT5NkU6d5jWRCey/EioEiuwwC
         HD+Q==
X-Gm-Message-State: AOAM530YeyKjzgnYQ4ieuNZ2D0wqI3LxnYhsLBOaC+e+sZZZkcQ2aNbX
        /NR1J9Z+fs7cZW0RR7dPqroO/wY2s2TbZG92IGi1jWyJ2gWYO/ngL7deplGUuJdZpiBfPzRJmms
        UeL30Cnga4919usSJsqllEMByauKpEH+iahWjcHS8/R+Z7crz
X-Received: by 2002:a1c:f012:: with SMTP id a18mr9989434wmb.73.1642701479318;
        Thu, 20 Jan 2022 09:57:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqTIBDSwhzIJAAvThOjafSh4STpzbcmwUKvBnw8h3aAFohpEEpbyymlmGUkzLSw2lwFS1cZQ==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr9989419wmb.73.1642701479169;
        Thu, 20 Jan 2022 09:57:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a15sm3345248wrp.41.2022.01.20.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:57:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 4/4] spi: s3c64xx: allow controller-data to be optional
Date:   Thu, 20 Jan 2022 18:57:47 +0100
Message-Id: <20220120175747.43403-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
References: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung SoC SPI driver requires to provide controller-data node
for each of SPI peripheral device nodes.  Make this controller-data node
optional, so DTS could be simpler.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Andi Shyti <andi@etezian.org>
---
 drivers/spi/spi-s3c64xx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8755cd85e83c..386550fca81c 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -796,16 +796,14 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
 		return ERR_PTR(-EINVAL);
 	}
 
-	data_np = of_get_child_by_name(slave_np, "controller-data");
-	if (!data_np) {
-		dev_err(&spi->dev, "child node 'controller-data' not found\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	cs = kzalloc(sizeof(*cs), GFP_KERNEL);
-	if (!cs) {
-		of_node_put(data_np);
+	if (!cs)
 		return ERR_PTR(-ENOMEM);
+
+	data_np = of_get_child_by_name(slave_np, "controller-data");
+	if (!data_np) {
+		dev_info(&spi->dev, "feedback delay set to default (0)\n");
+		return cs;
 	}
 
 	of_property_read_u32(data_np, "samsung,spi-feedback-delay", &fb_delay);
-- 
2.32.0

