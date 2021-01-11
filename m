Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A8CC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 12:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A2DB224B8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 12:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbhAKMl6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 07:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbhAKMl6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 07:41:58 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A0FC0617A5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id 91so16271683wrj.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=P+TwWLiTjF1qmaarNqsVKWNM+dj4npSIcBOUzlo8IeXig9P8wZj61dOgCRFAjWO8dI
         el0XHCO9VI68C3rOzzKgrBlH2CqCgMbd52JSicFo/WvKlqHm+SNqmO9Lm7efZqFPkKRK
         TT+EmyCCHP4O95eF+qg/MNDR6lWwZCW3seProocfEtg5DQ7kPEALk9G8qHYILXkyu3UW
         rW041WasCI9qrc8nELQFX5CAZVP1w3LoT95tvPFMuAC4vHBvLWWhDeDdwVGTI46K4r3T
         Ngd9xSOIvSRo4JPqY/OS7UaQsAiHeHpzSBlUWMuWOC/DxyUxyGyLUlI6uT1E1Uhh4lnp
         fVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=QsvSiH7vRdf57XMftsAM/axFO4e/WTg7Bypi1ixapdWtAhhp9d6j5ZCmHExLQ/tMMO
         imqWjdN58O2s0Mxv7ZLku7FtyeM5tmO9K7FfHCc36CAf7Twy/cdHuHzOzdxew+hSsWEZ
         1m3tVfnKS/qmAGz2Pyr9VscpAb9bNhn7+DK8F8dcr/6Q/wNi4FuX2rR2c7bTy5V/lfF/
         0lPVDp1Z+TenYqpidqemAWJyOlbkEu+9lozdgvoXFcaUGh4ohl5H0H467ZM3hiFyUKOS
         YB409Gv/JJgI0w6NzSHA1/721sVWDRQcntF1yPGZ8TCr8eJUHnJTQg+sZBrTjFMDtjNZ
         sw8Q==
X-Gm-Message-State: AOAM531saJMvqOSHBVZKgpm2jKExaPNFoWaXMg6oaHmdiY5Mwh+eNika
        vIp4WiYd2R8ufdBP8ipfAFGDgA==
X-Google-Smtp-Source: ABdhPJx98mZybXSuv26a4jd1+q/Aole2pms6hjLnF+Q1HUOM04J0+ZjH3h0TYXXuX0JtSP1HEmYJ8w==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr16060283wrw.73.1610368837747;
        Mon, 11 Jan 2021 04:40:37 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l8sm26492362wrb.73.2021.01.11.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:40:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 2/3] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
Date:   Mon, 11 Jan 2021 13:40:26 +0100
Message-Id: <20210111124027.21586-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111124027.21586-1-brgl@bgdev.pl>
References: <20210111124027.21586-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can fail if regmap operations fail so check its return
value in probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..e0011d3cf61b 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	ret = s5m8767_rtc_init_reg(info);
+	if (ret)
+		return ret;
 
 	device_init_wakeup(&pdev->dev, 1);
 
-- 
2.29.1

