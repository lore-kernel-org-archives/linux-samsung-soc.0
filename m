Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F501C76186
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjCJW3R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjCJW3P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:15 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B234123CDE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:09 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id da10so26541688edb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSow9olcoHPDQWGX+9sZKUw+pImGguqL+rxp9AEhbQU=;
        b=WMD94TIdueIJwD4R0dzXoVlrA+lBE3XxCJOkt5lcGwJl3T9aSx5oXLSImUAdS8gGWj
         nevEWuDRfJ5RPH0TtzsEO8S3/WbblgN6c7T0caLdrg4JVyKOqAgZy1gYCF24w5rLBjjL
         MGSsSfrwG4aZGC+l8fhUpOJRtBywlP3akFV3IGOYCLF3G4b5n7kiyAbJDLHKhRR8a7LS
         Z2ZsSKJ0xALhO2Jtv+CXbxq0jXTpVzfN+2istoSvNEtpe8cznSwbbzPN3KeRr/R4kSF7
         IFSRNgff5R+GmFDJEXkLP5PhiObPKCY/RCtarbKc44EdzHR0zp2QleIG+ceGsJi5jxoD
         dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSow9olcoHPDQWGX+9sZKUw+pImGguqL+rxp9AEhbQU=;
        b=QB9/I6bsjKvjdIpAqB9FJLCNB1C0KZSYEjRW/xSa5j9hDy2xtg9LPd2Ed8oZip9Rn2
         hZXr6LIfgCXPcjqtXKRxn1iliVlUqA8UsqUa17UZAi8nS25iQE1muPy36am+W8sSajL/
         vva2OHS+I+p6VaoTFg3yFCiD5dXQd7RqcRo0+vSlVgXFr8RbA53Edzg7SCWKNv/ARaXq
         6lEtaJuyN0KAaCQO2kWkers7ZB9w27yY21WAnhSwwS/CCU+F6Wx/c7SGLVA7FAjp1pBD
         9Vl6vIRfaDOO7DLzz8E32JjhWOk560eyWCEh80sr0peLrTViwKuGsXWpGwSaik3ZBGNt
         Nt/g==
X-Gm-Message-State: AO0yUKWbBCvLNVV3v5LmGKrZXi0gc8WpZz+cpimqjE89JvMtKV2m0P2o
        5mCKYQExx81JUojv+28lo1pGJQ==
X-Google-Smtp-Source: AK7set+ZEfdl5RMmf1uVdzsphu0VuJcqw6uo7c4Au9pdNtDAtzSnz6tjiqyq5MBaqY6lf3+ZmyTllQ==
X-Received: by 2002:a17:906:8156:b0:886:221b:44e5 with SMTP id z22-20020a170906815600b00886221b44e5mr26872458ejw.62.1678487348858;
        Fri, 10 Mar 2023 14:29:08 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 07/16] spi: s3c64xx: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:48 +0100
Message-Id: <20230310222857.315629-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can match only via the DT table (all platforms are OF-only)
so the table should be always used and the of_match_ptr does not have
any sense (this also allows ACPI matching via PRP0001, even though it is
not relevant here).

  drivers/spi/spi-s3c64xx.c:1496:34: error: ‘s3c64xx_spi_dt_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index cc69f8ffdbdc..7aec496070e2 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1526,7 +1526,7 @@ static struct platform_driver s3c64xx_spi_driver = {
 	.driver = {
 		.name	= "s3c64xx-spi",
 		.pm = &s3c64xx_spi_pm,
-		.of_match_table = of_match_ptr(s3c64xx_spi_dt_match),
+		.of_match_table = s3c64xx_spi_dt_match,
 	},
 	.probe = s3c64xx_spi_probe,
 	.remove_new = s3c64xx_spi_remove,
-- 
2.34.1

