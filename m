Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2548DC6FD1E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjCJW3Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjCJW3K (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:10 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A15122CFA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:07 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x3so26394104edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4hsdqWnTrZCw8a5RzNxKgld2eq5ESSNSd43t/rkHbA=;
        b=sQ9AnmWrtkGTib7XAuvnkd/mECJ9fJ3H135f812M5x+86PSP40RwLIlTRgQ1T4m70O
         /5u/uQm3FN3/qjs3kbzAn3amwi8BH54NeZ9ak/3qqOHRxONcHK+LS0jQ2lZFKn5gYTUc
         RpRtfSA2m+jUdaaoLfdezgQ0HnabwAw5Zd5UJ5dqV3uQXLsbWK3iN7ntET4GLmfonbHG
         HqTHQEpi57dXBQigF2FBMVwrXUfCvgWj/8SOoCpunzh11ZkB+PNH65nvKVZkueb62SGb
         mXX9xdEOWyKpvgeLMJaW+kaCM65dZySOzCAtYIZjl7k+9cAThGz1l/FTIQEQq4iT2/ER
         RJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4hsdqWnTrZCw8a5RzNxKgld2eq5ESSNSd43t/rkHbA=;
        b=eSE1qvxRzpgqTkbUxisk5X5l5/PyBYu6Aujv4GFz02yM4oF00lKwA+6sWFEu+f1yL6
         9EUSSkvmdoEOuWeCl1DB+aU2h6fp+LXNn0idRhGqTmIcO+ibJzC+V1vv+eZaYuSzLYSZ
         YYS+nffOv+jfiZheL2zjtavVDrhg38UiK2S9KywgPzi/GHC0loFugBJp6j+cfY6K2cBh
         1FHRKmQoO2x65z4OeAFvxMsu91CCWHIf+I8pCLUcNpQZHBdFYzSkRnJNGz3jy2T/ItUS
         Wv9vhn7fjkRUKTXQyliZmnl4W8Ug6aR235xj0tftGAD+W3iDUezZ4HWZJlOgHVQdEaJK
         TNeQ==
X-Gm-Message-State: AO0yUKWsyLDtrpVxtG2OylL8Fba+kpGFn2/0rewwmwXuwOrcMIexbsCw
        FlD7VPOYR7C+e/i6iWvfgnWdQw==
X-Google-Smtp-Source: AK7set8req7DR8ncW0h8QB4fOrmA/Kz78djHJzJDXsGh0OSt5DpOgdDc5EHeCp2kQeLQUU4yam/Ccw==
X-Received: by 2002:a05:6402:2028:b0:4af:70a5:55ee with SMTP id ay8-20020a056402202800b004af70a555eemr23535448edb.3.1678487346365;
        Fri, 10 Mar 2023 14:29:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:06 -0800 (PST)
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
Subject: [PATCH 05/16] spi: orion: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:46 +0100
Message-Id: <20230310222857.315629-5-krzysztof.kozlowski@linaro.org>
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

  drivers/spi/spi-orion.c:615:34: error: ‘orion_spi_of_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-orion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index e79d1fe0bca4..c63b75c1829a 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -852,7 +852,7 @@ static struct platform_driver orion_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm	= &orion_spi_pm_ops,
-		.of_match_table = of_match_ptr(orion_spi_of_match_table),
+		.of_match_table = orion_spi_of_match_table,
 	},
 	.probe		= orion_spi_probe,
 	.remove_new	= orion_spi_remove,
-- 
2.34.1

