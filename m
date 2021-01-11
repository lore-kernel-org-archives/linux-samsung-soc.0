Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A26C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 12:41:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF07E2250F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 12:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbhAKMl1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 07:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAKMlS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 07:41:18 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15844C06179F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q18so16298372wrn.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmSSoDbc+2rw/4h75XEqx7jHACxZ7FHCs9p6Wbzi2zM=;
        b=0F+jeZbn/40ig5h5AsQvYwqSYf1roFYcuJpr1OS3UvzrbytMIJ7EiDuCQSDHRaIAMY
         n2CeXadk2IUrJS0x9s3gKYZbz0L1u80EfJBuy0dS6DFLDcc50cSYcNRNCMLrs8nImVU2
         +YRGvIE8jCudGBWitBLK3UuQYHImzdxj9KMNXkwFIIhcjgtVk2OF92mRgFgG7YGOf68L
         GMq0C1WQtguxs5kDudfJ4yq2LJnTyZntoRSXkEWGGiGBmIYwofir4BWaW2IFuWw+YXkA
         yE5hfWrJQH+rpiDuejhQIdeydzg2deecZKAJ2lM7t5sfbNq1ZC0PuzfeoDi2o/XDDy1X
         MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmSSoDbc+2rw/4h75XEqx7jHACxZ7FHCs9p6Wbzi2zM=;
        b=WCEFJ7rvClVQNRC0m1AV7YXzEQwMPewbcVO8D8QI3im2NbxAIowNS1Wm/seeS9C4vK
         1neFBNZBa70u9lOEbFZ5iS/r0hTGDu2xS0WVe9wSc852lpdrmQo7InnNC1lRdcBvReW5
         4tQam+AELc7pncLUQehI9cic6nHY9dIigl0IY8n3Bmx4fwezPNWOH2vV8d7USPEKx+JP
         fQXZclxu7xUhh8OaR84Po43gZzcpRWdhSXVMVrxxY7L3vlslq4nic2NS4Pya434oQup5
         VKBhWudDpowElFzY6boXaLszsZ2Rs+DjQZPbvBJC02j979frd7tpfDOgY7n0WKBx4Fpt
         408Q==
X-Gm-Message-State: AOAM531Knk9u7Nc8dncrfKrv7gBaRttFSB8gwD8/hyCFA0FytMFCqjha
        wFLTho2MBKKQOqs/u4LF1ShRFA==
X-Google-Smtp-Source: ABdhPJx/JvGKoQ6786uAag5YOB20houzOa4TJHJiLsy2xCYGN6LcTS6vCSnTEqTyzHm4gA8W7tQKuw==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr16344895wrn.296.1610368836875;
        Mon, 11 Jan 2021 04:40:36 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l8sm26492362wrb.73.2021.01.11.04.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:40:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 1/3] rtc: s5m: select REGMAP_I2C
Date:   Mon, 11 Jan 2021 13:40:25 +0100
Message-Id: <20210111124027.21586-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111124027.21586-1-brgl@bgdev.pl>
References: <20210111124027.21586-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The rtc-s5m uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

