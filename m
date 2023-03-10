Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661C6C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjCJWaJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbjCJW3i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:38 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E238125AE5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:15 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g3so26538763eda.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBGP8+ktL4ywlJvW0lmVhlwvhFE47q82UhD5J/2MFQU=;
        b=LwLmThATdX5HNobFSO+brNDu9RIY0acCKrwYmzGtVVzjJZhxTQOKm1spvMnktyhki3
         GDwqNCGFwqRn/7kUnE2lvo6YeFswYlvoaGlsKar5EQh1lq3Rcjjwqy6OGpcVDNU3megk
         WFF0BAcHkCebD9I2lbM+rrRRozHdxVVBtVHvFK6l2abJTAdNDYnWD8b36mCK61PQMFeI
         SkDYYKWQY3CFhDmOmFII38SNil/wTwBD4rDZJ7kqUJI1MdEdL2MGcroBZUk2eWcbU7cc
         yDDyqclvrv9smz6jIhBdL78omNdTQvynMcvOFzZBmB1Mspasb8f3jl1xnD5+cYctGRR3
         CY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBGP8+ktL4ywlJvW0lmVhlwvhFE47q82UhD5J/2MFQU=;
        b=hs6Q63rsGxHb6NiiVJ0bP6TiPmaA6Mwl77D8y+HDKTpUr4hybbs7pFkr9fYW1CLitp
         0kyeuRGKKRVFkKaJ0YjWMaJoGvtb2eu0cLOzIzPAkVkHhl5qG1qQgnxp6fxYfqnC1lZM
         qiNtf8bxdoc96oyOrWGvtz/F/5ZNqhEONbFDcg381g0KY0wnp9liDAhB5MOdA0MFVR/O
         Ud/1Dpjw3lcD2HGffoNDOPOQ6OlMgKyeyvQpSXRDl1b+7I/XU+KPjZPK538N2iwk9Ch3
         ue6jybF1WUm//9PZe7sxVOT7uwgqA4Edi9rhckd6eCoK3zTJWQA94qEO+072Cb72hm9a
         dW6g==
X-Gm-Message-State: AO0yUKWbY+R2G6rDdKHqU/rsX3+pNL/t9IXrfCsr5M16msgoJcZqKHTA
        40lldc4oXtc3j8R9qlHQMZUS5Q==
X-Google-Smtp-Source: AK7set8uL4nXFDVb7rsO+o6EWoU4A34ihg/j/XmN4ZE+rbabtjirYsg20d8X3gBVCVm6QRcADU/42Q==
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id n20-20020a056402515400b004bd6b931289mr24124882edd.15.1678487354154;
        Fri, 10 Mar 2023 14:29:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:13 -0800 (PST)
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
Subject: [PATCH 11/16] spi: st-ssc4: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:52 +0100
Message-Id: <20230310222857.315629-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/spi/spi-st-ssc4.c:439:34: error: ‘stm_spi_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-st-ssc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
index 9141f19c7f8e..3fe266c336ab 100644
--- a/drivers/spi/spi-st-ssc4.c
+++ b/drivers/spi/spi-st-ssc4.c
@@ -446,7 +446,7 @@ static struct platform_driver spi_st_driver = {
 	.driver = {
 		.name = "spi-st",
 		.pm = &spi_st_pm,
-		.of_match_table = of_match_ptr(stm_spi_match),
+		.of_match_table = stm_spi_match,
 	},
 	.probe = spi_st_probe,
 	.remove_new = spi_st_remove,
-- 
2.34.1

