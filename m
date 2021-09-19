Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E4BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 785D2610A8
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237507AbhISJct (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 05:32:49 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36374
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237581AbhISJcs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 05:32:48 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 96CCB3F4B9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632043882;
        bh=l8YXmTXMZ/iKcjkLim6IYDwfujCxIJBCjNW3dt7zqMc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=JScp05qFjaXB2fKc4KbEReBcD28QIxTqWSAjTSaM4m5oQGCRROhq0dssfDCWy/xsk
         4HAMY5juPN2/IJMggyBhlx8ZE5X5NovGR815oGqWmHoC4po7GOk8UAIAzbsAjSUMKe
         DavpTAbLIHxUVG5rZnl2ek4Xd+Xpy1HwccFSoKaiYXw/kOVynbKWOE6TwzlJoz84Il
         hHsHyAcEuBmUIoFrj8V9dpk9FDgRSrrbG8GLR+yOfko/rhVj1aIJs+KFZbkeIpLUzi
         Kzi/4dvILp25RgVlKWeHf4epv4997iqNhNQLF5ATDnYIBHuCZd4taRjhF+xfrS+2ks
         SvD07zSYLBKcQ==
Received: by mail-ed1-f71.google.com with SMTP id j6-20020aa7de86000000b003d4ddaf2bf9so13084747edv.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 02:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l8YXmTXMZ/iKcjkLim6IYDwfujCxIJBCjNW3dt7zqMc=;
        b=AoYOqTbJcstUMiAggXbcloC76ebQA05tcFlOQlvUGTOq8U7MIEe1nXa6vObwA/Gdpq
         z709m+Lh8F+sQ0iIRDKmsVRS8DRTfl5IxDjIFsEAJBx52NjE/HONbqinhf8CehJejGKm
         TWYbSoIV0+sdszXY1mrT49mFYl8Gprq3uDiWmppk9OelEGa/qxv6tr/QUa3wdXfyYzTl
         E04UAKG36+xFl6yK4ezavJmIYGjyXAoSFsE3mL/fbXUw4Z73NiGZbAwqwPiVjD1739N/
         16NG7I0Vy8eymSk567Wg1clrjIRgajOx0bPW2F5H29R/JhMcrK0b5FOQ5baXs4TC906K
         mGKA==
X-Gm-Message-State: AOAM530Ou5mpccChBtyyuW1kRFAVAktYa99YmX6d0jNnt7CIT/wOxVNb
        lxxQ5HNSOImQm6r9ulMEL1UFjARVmlnWgRidzCZcUQ4ZQ2Gmon/1OwBkgBMLjblF9vYS3vvkYWB
        IQGcR3vm1mpRUz5snsFgJ2Q7QhmH+bUZ+odr4dk3Q3tl1iqZp
X-Received: by 2002:a17:906:38db:: with SMTP id r27mr22326043ejd.338.1632043882303;
        Sun, 19 Sep 2021 02:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYvfoLSFre+KE2ZP+ET/ZNmRuRODsi3g4LGtgTi3G5DkG0kV48HP/d374F2ehLDbB/piMRvA==
X-Received: by 2002:a17:906:38db:: with SMTP id r27mr22326024ejd.338.1632043882150;
        Sun, 19 Sep 2021 02:31:22 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p24sm514111edq.27.2021.09.19.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 02:31:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/3] soc: samsung: exynos-chipid: avoid soc_device_to_device()
Date:   Sun, 19 Sep 2021 11:31:12 +0200
Message-Id: <20210919093114.35987-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

soc_device_to_device() seems to be discouraged [1] so remove it in favor
of printing info message with platform device.  This will only change
the prefix in theh info message from "soc soc0: " to "exynos-chipid
10000000.chipid:".

[1] https://lore.kernel.org/lkml/20191111052741.GB3176397@kroah.com/

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/soc/samsung/exynos-chipid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c1d0f97f766..dcd9a08ce706 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -104,8 +104,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(soc_device_to_device(soc_dev),
-		 "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+	dev_info(&pdev->dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		 soc_dev_attr->soc_id, product_id, revision);
 
 	return 0;
-- 
2.30.2

