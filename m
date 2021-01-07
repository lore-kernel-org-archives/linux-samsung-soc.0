Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E898DC43332
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jan 2021 13:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2F8322D75
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jan 2021 13:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbhAGNmt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jan 2021 08:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbhAGNms (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jan 2021 08:42:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117EEC0612F4
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jan 2021 05:42:08 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i9so5701162wrc.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Jan 2021 05:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=rZXJ+p7nRYeGl9SWPfS1whanzVkdZoIbBxEWvnNvDx/P/T0FRcoy/6H3OM1Frz/1nx
         FGRs5WxCLAFOz+d3ap5a+xHiHJQD2cWlqY4yVKXYrNzLqpg3RnnIJt6LT8ApD8Az3bQj
         u2besmmV3asVZJMii9cWrsryRvCpxgytlYSBlxswLNANwutC01QhPpzXGitSwWh/SjPU
         TZJIcYYqyWT35SBhhjUnFOInUGdeiQ312TAL/EM6cwWnyOLROZxRXoQtLHqCSCymLyG6
         zcYVQ83WNbjUOk1j2HifRpdEzc4SKVFMrBfOsWF0yCzIquI0NwYUyKHcS4q7zK6AFU+O
         oxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=pbXj34rXQBp+M5V2h4SkdVK9mlesmuGDprRbEMxAbVUOdqgVEAiFajhbW1bmKI5QeB
         Xtu9SedwIwEmzppf9azIDDBdnBSlZ9Qbpr+gicsfd+Ozo9nGUYLgPdwbVbpKCDsoQoMb
         z2MxynskWxgLl10d0BIqDe67LD7DHkickcqEtGtV3ktrhSEnKaSTfDLxXdV4A3Uy2lUG
         dKnMOzPWxu/jwBZKDxSA5Y3y6u2Lyu4i40GX75f5r6PsMAbj9fK8/cUw628YNN2aNu6L
         /v50QWdUfW3Dvq4pqOWzPG3PqHj+LOWy4onbrPNp9icA8Gz8MqxRQKnU9jpkKzpAemmL
         4iaQ==
X-Gm-Message-State: AOAM533Dy5UY+Ft48/Pb3mPjisOCOBLeEjd2Wx35yv2Px6cCs9eCVAYm
        mwl6yekRv7b5TbINAwMydlEVrw==
X-Google-Smtp-Source: ABdhPJyoOYIbXOl7BaXgxmBR2MYncdd+LZgqtPeWdOiP64bRsHmgX+TEX8fh5IC7i0elOaJDb61gew==
X-Received: by 2002:a5d:4dc6:: with SMTP id f6mr9216369wru.336.1610026926883;
        Thu, 07 Jan 2021 05:42:06 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id g184sm7852710wma.16.2021.01.07.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 05:42:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
Date:   Thu,  7 Jan 2021 14:42:02 +0100
Message-Id: <20210107134203.9388-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
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

