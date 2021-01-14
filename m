Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF55EC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 10:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CEAF23A3A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 10:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbhANKXq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 05:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhANKXo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 05:23:44 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C1DC0613D3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id m4so5152685wrx.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hXpzk7OffqSrHKLaiatk3ajUz4KlXJ/8J4lT5+GFR1I=;
        b=cWyvmtck+Ru9tLEC4AUdUbsEbLrYRwRdybsVkqPeCM2TUIIjtN3OHHDW3IdyMudlYj
         5f2VFMwVgFP6SSaYv5z1jl2LZaiRZjVJ2k8DtX6P3hdDyKjFVK6q8hu379tYgf021QB5
         kswXTpkzhVU3ZKCbX0+krkA9oAiiAxEnDg7iPptBxcEROkJrpxV21vZnLH9Pje/eOUKB
         CT8SzZftfVBQi2Mo3LCIekP9hfjc1D2UDeafyPA2/pVp7zIjGU0ITBMaJ60RG2AoowoB
         lbrqpKeHqvhIvOfwMlV8Ph8uFput3brC3y6nCOAMFQWfryZl9PYBfU5qcXvGTD+Kt864
         V0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hXpzk7OffqSrHKLaiatk3ajUz4KlXJ/8J4lT5+GFR1I=;
        b=YDA1PSQvZ31kN4kWxXS+nO380WVubbdmco4dfEsRXeqijBcHQI+yuzEO8073IxYfGi
         Tk3yWk1nRMICbzoWo1Pom0Pty8d29TGOJv0AEVsyGJQvaQpU5u9xcW+tgDdou/7LqNXd
         rpS9Oi4aNUNvib1wB23oS6ZZ63vnwqL9ibsZw8aSOsEhVd0FBUqwOY75uy/Q33+TBycv
         /vNsjEqbLZ6vqY5ipEM5uPeT33B79FpnASN0N5+epiLWMPrKJry44flSR765K7HHgEDL
         w3LyECvx4By2h/Pu+OsBi2lPS88oqH7qJmyBv7+N4M4uQk+NXwxubUBjgvAvwkZPF1oU
         yUkw==
X-Gm-Message-State: AOAM530BClcSe2sh6Vzqb5hDdxf/Ns7wDFc4806zrMPf/zNG38rs0Xp/
        LqOnmiu8dEwLur6qtG+JZGtnfA==
X-Google-Smtp-Source: ABdhPJy9v8GD2EuiKN4Wxze5S5VeDveDx+zR3Z0+C06KqZtUssyCPZ/2SPqRiLUhxyOD++aqmszTDA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr6863125wrt.223.1610619743596;
        Thu, 14 Jan 2021 02:22:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l7sm2468467wmg.41.2021.01.14.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:22:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 1/3] rtc: s5m: select REGMAP_I2C
Date:   Thu, 14 Jan 2021 11:22:17 +0100
Message-Id: <20210114102219.23682-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210114102219.23682-1-brgl@bgdev.pl>
References: <20210114102219.23682-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The rtc-s5m uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Fixes: 959df7778bbd ("rtc: Enable compile testing for Maxim and Samsung drivers")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6123f9f4fbc9..e4bef40831c7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -692,6 +692,7 @@ config RTC_DRV_S5M
 	tristate "Samsung S2M/S5M series"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	select REGMAP_IRQ
+	select REGMAP_I2C
 	help
 	  If you say yes here you will get support for the
 	  RTC of Samsung S2MPS14 and S5M PMIC series.
-- 
2.29.1

