Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233F5C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjCJW3E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCJW3D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:03 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3146F120846
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:02 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id cw28so26491955edb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=60PuEIm35j5/lTNeJPhlkXRZcGNjzFmtFVCVem+hEDw=;
        b=LEfc0zEi+LQ5St5qp/OpSxRZTLSGwJrZ1Hg1Bjj2BqrW0jf1MDtYIRP0HBSYpqADEj
         WF3P0M3JfPUzD+0gnosaMbTzjvm7A21OxNXWw1cCY3V/EijHD8A57mAb+tmulhwrtNmZ
         /ey6MnBObA52rMXrEjca40rbROCtoOkxo00ygLa6tTa4IPsuDoy8BCLW4mXNNsI/mb3R
         JtMWGx0rRuUOJTylIlHrwVyQ7uG44r5J62FtVEjBEXguCGv+0Um5Q7oEhqDemugm9lCP
         n2LNdiqGW9semV4b/A988X57tQIYizAda0dcfvCxdBt2WybsTGqY6mRciCT0f6OPhsrB
         qMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60PuEIm35j5/lTNeJPhlkXRZcGNjzFmtFVCVem+hEDw=;
        b=taOaIr7F19/+/9sz44Z39wMhzxZHfveNeUPsq3EXPTA5QGLjUQjyk2/afjcq48CzVJ
         H18LUjStDxVFiSlehVXDWxSvV0kg0494aMHFQ79JEaDRQA3z9MNaugmOymSqg/8z/BaH
         p1/xc8JfsSTGaAOWdqMhSAgOA1ukNC5KCAOXYI9+ZLeiH9UjmsGHXJGzLrN59QOj9ARn
         KRyuXFG4DHoGRntE1eRz+BjmrLYatiFyDQ8ox6jGCNUyAt6rgB9JUSgxrHtMUiD79DQB
         XXNXDz3vf8hWxtflRcn7C4TZj/uTkdhjiIlPbgX/b/jcZAoM2lg6J9V/6qmM94Yt3SRN
         JFAQ==
X-Gm-Message-State: AO0yUKWqdOnqxalz+7pmG3zjdZ/lAT79S+woE6hjkAI3kTM4a+TCq450
        RgzoRdYZvj8bLqNnFQWWMeGAyA==
X-Google-Smtp-Source: AK7set/w56mrFx7St5tpjzC1nqrpGgftY5conmyuZ6lJBZWH6ul1PMXKHMQPItpT75fNAsz/ObHAxg==
X-Received: by 2002:a05:6402:1506:b0:4ac:c7b3:8c27 with SMTP id f6-20020a056402150600b004acc7b38c27mr25909175edw.28.1678487340674;
        Fri, 10 Mar 2023 14:29:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:00 -0800 (PST)
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
Subject: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:42 +0100
Message-Id: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/spi/spi-armada-3700.c:807:34: error: ‘a3700_spi_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-armada-3700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 6a7e605f73bf..feb7371940bc 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -919,7 +919,7 @@ static void a3700_spi_remove(struct platform_device *pdev)
 static struct platform_driver a3700_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(a3700_spi_dt_ids),
+		.of_match_table = a3700_spi_dt_ids,
 	},
 	.probe		= a3700_spi_probe,
 	.remove_new	= a3700_spi_remove,
-- 
2.34.1

