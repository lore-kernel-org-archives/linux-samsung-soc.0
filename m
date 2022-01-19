Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867C8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357331AbiASUKZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 15:10:25 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46358
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357288AbiASUKV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 15:10:21 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 14A0D40052
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642623020;
        bh=YwgxoMtmx5KJnuRvatZdCUmCdGzGOSTGdP5YKiFMjK8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=O8tOWnIemRV7rnry0jL12PqDtVFswNrDW0NYG8kk/YGaPZy9zj1aYXxh65kfeeyc3
         76LuvDosLqrU07lGnZsHE2ag4G3xsTUPJwldVXDBZWWQd2zr9IJYRmeb+DZhaHxCru
         QENYo/J5yf8gjPsdOEMqwpRghqYYkSCiC69yqK8azbAfWKroLfZU80qaNL+zArZvNU
         QZ3ozhD0gFNdn3PNiDe4fERIbXhHCELWp56uqXF6HLeFnUN2kowEizt8/j8+6wChxa
         OOdWEFJKqIsDw4fZuEtgF1g+9KNU2qajFN5Tw2gSYwABiYXa4+j2Lrz7eLWs3cYSvk
         YFwB9hrLEvCCg==
Received: by mail-ed1-f72.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso2583842edb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 12:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YwgxoMtmx5KJnuRvatZdCUmCdGzGOSTGdP5YKiFMjK8=;
        b=z3tqdgR+I3ichjky5HVT7+Fzm1iJIrteHLAA1WhvTJgazWFJf8aJsur25ql3nj+ETy
         lm03Xrxkyal/OCrV2+PlMNAAIkdaUPeJCOJQHf8+Wi6BmZUi4sZgBOGxsziFOHXasmF3
         jNNndfizmomP2PmGtN29nnsq9yVEfRvY49yFyYwmLQpgxLSurpF7x60HMWU2apVw1dn/
         6EJSqhu/4DJ2BeF/LcaaYdIFPaG2mPbUi0nANrj7XsXIcpm0KHlfNF53NjGedKcwhi/U
         UVcybvkChGcCf00WN++BaY+Yg9xwhXr7caLvCLnjZSfz+auv0LT0n+3CEpbaxRBjH/kT
         mvQw==
X-Gm-Message-State: AOAM532AhYOnFXkWMH7ehYCcHoRmRlNjE3ZI0pwW5PDNE/TxDauYjfht
        fITpkf/PZWMZ1hEZM8CjFJjVpnzkG3WbwVIKWOH1FXSZXdlpq97JGh0tcDXP8WXcNBm791KP0CS
        lvZWwj/vYez+iw+EmhNkYud3pSvd7uE9YP7gA6n3p19b2TuQU
X-Received: by 2002:aa7:de97:: with SMTP id j23mr32294141edv.91.1642623019766;
        Wed, 19 Jan 2022 12:10:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzOqDSpL6eHRmaEIopRqHKYyS27y17ZeCOBY9lq/0sAt9XXAM673SNZJ69DyQ4BP6FLp/q6g==
X-Received: by 2002:aa7:de97:: with SMTP id j23mr32294130edv.91.1642623019610;
        Wed, 19 Jan 2022 12:10:19 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a26sm215005ejr.213.2022.01.19.12.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:10:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Balletbo i Serra <enric.balletbo@collabora.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 5/5] spi: s3c64xx: allow controller-data to be optional
Date:   Wed, 19 Jan 2022 21:10:05 +0100
Message-Id: <20220119201005.13145-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119201005.13145-1-krzysztof.kozlowski@canonical.com>
References: <20220119201005.13145-1-krzysztof.kozlowski@canonical.com>
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
---
 drivers/spi/spi-s3c64xx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8755cd85e83c..769d958a2f86 100644
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
+		dev_info(&spi->dev, "child node 'controller-data' not found, using defaults\n");
+		return cs;
 	}
 
 	of_property_read_u32(data_np, "samsung,spi-feedback-delay", &fb_delay);
-- 
2.32.0

