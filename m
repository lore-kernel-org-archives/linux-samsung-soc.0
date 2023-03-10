Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29D7C74A5B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjCJW3H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjCJW3F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:05 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1BC121433
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:03 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id k10so26369883edk.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=YErFPXDcruuSCyquGlOEihSnf5WEX5TfRFUNUpk794YqO+3d2tGrz+SAukBB6cHeeY
         6f+NU1SAcvVQh206gJNQOLThJ1SeBSThVgv4zR1bXtJdov0FTIYm4pigzFzvKgXKFaCM
         O7ycG+h5VlOwwhKy3GFtQqV/qtNb0b1AcXMZV0wUHhPD7Basl1eKhl+JCDJqKZPWCnPT
         eiAullbhW79U2YRzArw66eDxZ8lqWSfLdRvprB+5f0RyrMcAqDsKHRdrQj5P5AgRZ/Kl
         lwTOuZL3qbuXuP2Vo/rSeZNkzRlTRJvk32snxMw8+KJAOonVRC+QO+iD6crmCf0gb4de
         Lk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=Nf2XxzR5uS5wKUCT0cCjGbfKpXy3L5ymJd2tjlT8DMEy2g9NBRJlB+sVDTLvoh+pD9
         uXQV72IFkLTYOWheQGAojFwB5RgV/UhZgsSOa+G/mC69xm7pEKbF/BmNVihX6TkphafN
         mKuyoagn01a1yfWjXTlq4Oq4A9FbtgCdDv6W/nLC+gzyqwsKIL0lEXyaV2kcLhhGI1M1
         hRPIv8k1yyfMDHxaB7wL3mli28p2KcmNnVphYGcKSU/OKqS6HIrVGtT5iW73d3AtkTRA
         QramLbliIhv54PZwl8Jmkax4oan3pmPVqPJraLEe1BkyWXsUlITQk34KZjY+QsaIqjlm
         aZKw==
X-Gm-Message-State: AO0yUKV2DM59aJhu0h2plyV9970YqPAnKHCxLvCQhwDRw3NhCRKcxtQO
        nO6EHFwZQzD49kFK9VQDAZQVOQ==
X-Google-Smtp-Source: AK7set/MN1PmYbla+81mnyLbnX24dl5dsGO4HTEAGHBQdx8CwTY3seLWUkHX5GZDY+FpxIzcnKNvFg==
X-Received: by 2002:a05:6402:1804:b0:4fa:315a:cb55 with SMTP id g4-20020a056402180400b004fa315acb55mr597332edy.21.1678487341960;
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
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
Subject: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 23:28:43 +0100
Message-Id: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
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

  drivers/spmi/spmi-mtk-pmif.c:517:34: error: ‘mtk_spmi_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spmi/spmi-mtk-pmif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index ad511f2c3324..b8583917fa11 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -530,7 +530,7 @@ MODULE_DEVICE_TABLE(of, mtk_spmi_match_table);
 static struct platform_driver mtk_spmi_driver = {
 	.driver		= {
 		.name	= "spmi-mtk",
-		.of_match_table = of_match_ptr(mtk_spmi_match_table),
+		.of_match_table = mtk_spmi_match_table,
 	},
 	.probe		= mtk_spmi_probe,
 	.remove		= mtk_spmi_remove,
-- 
2.34.1

