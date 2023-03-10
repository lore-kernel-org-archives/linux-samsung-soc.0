Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD49C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjCJW3K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjCJW3H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:07 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D2C122CCC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:06 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id da10so26541224edb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADHlp/biBCVZeifGXqje13pwL1TD/yH+Vs4GNRSOSmk=;
        b=gOjP1UUs30lsqxRQ45sMLZli5wdZwOUprEKASjWMuOlyLzQDeiBSD2Hq3tIo+JrpKI
         AArmC+ZLrunGz5fN3pTsr9FDr1XBx+iXT2ewlMt4mqhfD1/xs0oPen4jvt8byPCJmURq
         oPDOovgdqKMczeymwr2b7yNBm6QACG+fmkmSzHtc+G9+qsU4Ol1bCgf42TFMSBv5mo0z
         2prH2dORIW8Fj83FHmH5UmMl5Hv7Q0/N53UmQ05E2Zvih2Taqzkpmw+w+q7nolMec0/h
         +ntxOzSypN9XSEK03IgE8Bm20Ofus/MK+h5mh+VvTIfDF5G5gnoSvhCZL49djmgt7RwL
         IDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADHlp/biBCVZeifGXqje13pwL1TD/yH+Vs4GNRSOSmk=;
        b=RzBTLSbHzTytjSFh92f398sR/44i08R332eqM7ejLhzwmltL5Jyc3513UAwBrHodxg
         tmwStvNli+/R1d2OpwoLtzLoO8fOOiY/Hgzg2hX7apFSvtUHgWOBix+lv2qPDW4GdjjH
         vbHc2vPRAWeph2EItwlXDMMv+Ua1k6tk+TrlPAo7IuuJ9EUgY7vLNvuHIuU+kezIPux3
         J4lLXZXuC4Hv97x6y6cTLcScvhdSrgTNy2Cd9NKzciOPpFAqd5/LnzoqyEIMu+LtBiZq
         MXCVcEqEY6SddBaTFsl2ZHuOzAbXW5UVmOhRXuOVGlsZB8YfMdGr9cQaaPEyZvwUwqMA
         J8Bg==
X-Gm-Message-State: AO0yUKWIw7vmlOrXf7IbjVWFlTIXeY6e0q9//5zGBumVojL5UYcHpVUm
        85bPuuLAowHMfkalglynYQm/QQ==
X-Google-Smtp-Source: AK7set8jBrx8YyuYtrKMeUiH9xfKEhHMLTU3KB16tvrIfpqUWe0eJHY4hKaNb7RoSr0Tp0Ya9mPiGA==
X-Received: by 2002:a17:907:cf48:b0:8e0:4baf:59bb with SMTP id uv8-20020a170907cf4800b008e04baf59bbmr28471712ejc.22.1678487345059;
        Fri, 10 Mar 2023 14:29:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:04 -0800 (PST)
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
Subject: [PATCH 04/16] spi: meson-spifc: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:45 +0100
Message-Id: <20230310222857.315629-4-krzysztof.kozlowski@linaro.org>
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

  drivers/spi/spi-meson-spifc.c:434:34: error: ‘meson_spifc_dt_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-meson-spifc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 06626f406f68..af832fbbf258 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -443,7 +443,7 @@ static struct platform_driver meson_spifc_driver = {
 	.remove_new = meson_spifc_remove,
 	.driver	= {
 		.name		= "meson-spifc",
-		.of_match_table	= of_match_ptr(meson_spifc_dt_match),
+		.of_match_table	= meson_spifc_dt_match,
 		.pm		= &meson_spifc_pm_ops,
 	},
 };
-- 
2.34.1

