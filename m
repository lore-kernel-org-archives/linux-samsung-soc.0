Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B47C74A4B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjCJW3o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjCJW31 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:27 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A2C123CE1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:12 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x3so26394796edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/4k4EDtHTwsGrCFmt9A01h3SrewNsUPMEHGiEs4FeY=;
        b=TVdIMwMMrCKmZDAj8bAXcosuz/F+qKLurmGg2tk/JuU0WAeW1zZ3e/5WJFm5zshZxi
         SqKw726uNsBDbGIY2pbSJBufxH78N4ZLW50mMwf71ESTokrIR6XsO7x+je/tAR/wbxyt
         WYxUzBPA1whbkcBPF2K2TOZDDwRH3y2IRF3GPsWajArp2ggTf55DAr1Qk6EvT7FlhPYH
         4+455PnI4SeL9cFUeXrD1nv1O4nsCQkfBMd95Ge0+t3wZzK1f5SMXGVkLeHw7CQi3s+5
         GMsfdtZzfaM1HAp/g0JL3uTpA1omwZTAUUW/0ofTxY2+KChGu+++CqNGcjjsOYO2bQ12
         1obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/4k4EDtHTwsGrCFmt9A01h3SrewNsUPMEHGiEs4FeY=;
        b=ovJpbooYp3yQd0/iskBezhQ2ngU38Ul3MkMQEgxKq/dbUxEV9PZKjAW0gTuUXM/paw
         nJq7oIRPuMZ1U4HY27mZOeeVcX1VsRKhyQtPZfLEHFNRbgIbcix/y91S4GWoZmxxwUzY
         WeFkBABVdltD2Uts+SC2FSOEMJsRcOMlVAGoxPSgdogHGHXipHpmf5dO24anFh9nP20s
         0Bw1M6N243QrGeU8eF9pa2hlKz2rZj36QF2UMi9aYoXsipZYEzsUStGEAc1wssuzVVYo
         S7RLXoyI9yspgh3K770wqqOTsnwhILyASPLARWC/hFIJN/jigSrVIY2B67Y021QAQjIn
         snDg==
X-Gm-Message-State: AO0yUKXTD96OutqhGIJ/ixPRANURb17SBmYXacaApLkPb5pUo2bMdRSJ
        6A0FArAc8QUCpv7n5jI42ELiCw==
X-Google-Smtp-Source: AK7set+a17yOf6VzbwUc0CZ6vTQ58vWyCjXfAH5/wUdFVgNoDsRk2++Q9bB1eIS7zKuhlPF+RpY35g==
X-Received: by 2002:a17:906:9252:b0:8b2:23fb:dfd9 with SMTP id c18-20020a170906925200b008b223fbdfd9mr27625552ejx.39.1678487352519;
        Fri, 10 Mar 2023 14:29:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:12 -0800 (PST)
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
Subject: [PATCH 10/16] spi: pic32: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:51 +0100
Message-Id: <20230310222857.315629-10-krzysztof.kozlowski@linaro.org>
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

  drivers/spi/spi-pic32.c:857:34: error: ‘pic32_spi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-pic32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 5a64ad0c94fe..04896e7ff2c1 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -863,7 +863,7 @@ MODULE_DEVICE_TABLE(of, pic32_spi_of_match);
 static struct platform_driver pic32_spi_driver = {
 	.driver = {
 		.name = "spi-pic32",
-		.of_match_table = of_match_ptr(pic32_spi_of_match),
+		.of_match_table = pic32_spi_of_match,
 	},
 	.probe = pic32_spi_probe,
 	.remove_new = pic32_spi_remove,
-- 
2.34.1

