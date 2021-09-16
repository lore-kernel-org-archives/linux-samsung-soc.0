Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2C2C43219
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 16:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6664F630EE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 16:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241396AbhIPQsz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 12:48:55 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53276
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242607AbhIPQql (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 12:46:41 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 208733F338
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631810719;
        bh=Bsa8JOGGCKGqD18D4sehfiJwGit16PjwUVoBvcbwuaE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=FOFao9op70RKIETayHtyeTujsjwJlRD796Ak1KKguLOI6LnEXXtlK4Rfy6V333ys/
         FK72QFGK7H/Iv8FjQbNCUiRiOPb+SWCLgHc/jSUtWmTM7TnhAupdGvaNLbOu28ZiG8
         oImL7ezfjZCoEbv4eQlcHQ7X6p3VMiGj2PgrA6I8xvNWm/Hw0f+8EwuPQo9HJFQLMY
         1BBDBj6hMulWHY3xiZLeGsWhAHBHU4iu5Mm0xDbsI8a6q9p3hUEMv1+m0XA62v6FsC
         +9eTQR6dE23RrfNBbOx4eHZeiT5NmSL1D5b6idYA0sL/5EJ11fO9mMdnF81H+0/K3P
         LYbQ+KYksu0Zg==
Received: by mail-wr1-f72.google.com with SMTP id i4-20020a5d5224000000b0015b14db14deso2661631wra.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 09:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bsa8JOGGCKGqD18D4sehfiJwGit16PjwUVoBvcbwuaE=;
        b=kRvy8vCkd8g8Y1q8L+SYg0fNa5TfGTLo2+f0omT+q0cx2Vz1ctE8KrfRLIbkRY8moW
         pSd9g9dNdVCoHWmjwGL7vEGz6pYTaH4KTGUIZSW4JFGEmoCV6Ar3tbmIR7BxyvuOam+2
         qBl1aZ2c+KLxzAnEm24zyc9xXVQdZF0vzrU9o4mkMpO7fuBo7tXqd0hFu2UX4rz7zHKA
         7YGj//1M8sGBsJXUm4Cd9BIWaoB4YDctpHmmyK8BAgU/rm3ex3iwQY43X+QrBh63hNJp
         phW83h3p3uzeeM/ff5PiJyhLGR6Lz27MbPLItco+eub4vU0FN7td6osYJQ+8oLz/jeap
         KXgQ==
X-Gm-Message-State: AOAM53376hLsf1Jq3cUsQLt5grQ2WkDFcVBCsigj6m7gvQSnj2iRmhRl
        cBSvuzA40FJA8CyuaCPAJvuxNKCAJgGbg44uFuTVBTSp4TEvzN0ucuuUjG5LRCswwrhBI9RegyJ
        sNT01ESp0akkVou5U/H1JU5IofzCAv5QuhJhNtfn5rvjz4Mb0
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr10706131wmj.84.1631810718438;
        Thu, 16 Sep 2021 09:45:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2JuDX3DqgsifbIvvV1lhfVqk1firlNmZ4F0o08GsrlrdHsnMaJzFPqkY3TSk0PC9I7m7bQg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr10706126wmj.84.1631810718312;
        Thu, 16 Sep 2021 09:45:18 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j27sm3388187wms.6.2021.09.16.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:45:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] rtc: omap: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 18:45:12 +0200
Message-Id: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index d46e0f0cc502..4d4f3b1a7309 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -1029,6 +1029,5 @@ static struct platform_driver omap_rtc_driver = {
 
 module_platform_driver(omap_rtc_driver);
 
-MODULE_ALIAS("platform:omap_rtc");
 MODULE_AUTHOR("George G. Davis (and others)");
 MODULE_LICENSE("GPL");
-- 
2.30.2

