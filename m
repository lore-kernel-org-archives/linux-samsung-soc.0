Return-Path: <SRS0=6aGG=72=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2046C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 Jun 2020 21:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8393C2078A
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 Jun 2020 21:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="auZktx6e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgFMVli (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 Jun 2020 17:41:38 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:51028 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMVlg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 17:41:36 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49krdW3qkhz9vCGM
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 21:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GPWf5suKs5YH for <linux-samsung-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 16:41:35 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49krdW20Mjz9vCGS
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 16:41:35 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49krdW20Mjz9vCGS
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49krdW20Mjz9vCGS
Received: by mail-il1-f200.google.com with SMTP id c8so9224384ilm.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LSFpRsDH7hPv0sXcI0eBKridM6HBdGl5vIGKq0rJzoY=;
        b=auZktx6ehAhBajQlNLlI3wm6+d/hAPq8yaPTIV0vlYaeRrgaW3hoVKPn9qzjsia14p
         PiNxeKtm8fOFcqmrbG++0+2KZ2Jfx9ybuCk8eyx1je4TBejzWJzhBwHirnfDeOZNESDe
         b6qaIEBwyW498ZP7ZKeSkzzbpNwlpEXxglPubM78kJo/euKcITeUPzisctzP3RPMwr87
         7UoQ6m8bnLiqQBIElWMX1q7TpOHphL8f38WMAFGB2PmvGYRT1i5wA4mFRvwLyLMlR4lg
         ZbFZc9kcFMeb0XJEv3c0fbE9WsxIcH9/sgZKUa9+qBQwJV/UP28bN7oFf/506QB9gYTZ
         NZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LSFpRsDH7hPv0sXcI0eBKridM6HBdGl5vIGKq0rJzoY=;
        b=Z8OGjV0n6IKld256n20P1HenG6dQVDwdWpyEtTyNCf+dFC35ioTrG6o8xfvmw8Tbfg
         i08Q3mvvOn5fe3bK3in2oANiTD3QK2e+j+eUvYd7v92yeV6kNQ2S/eM2n5fBv+ITM9+r
         1TyOHn2pmveuQQnXNz7cYtmH0Ms5W+BrEp2s2BCDxX+AWWAfjeFMhgLP0qIp+YI27afu
         MLgw3vRtsOthkCG7OB3RoVe8ELyZ84w6Z2WLZIVE4yDqRdH3jPgm4Jm1lStptjMU8U0L
         v1QDfXDqZK3etnXMBBAzSHDRB61Ev2HWmJzxkyEF0VBWPUwNSia8Ebm2hLn8jtfw4g2T
         LfyQ==
X-Gm-Message-State: AOAM532lcg3u8vsBsBW+43ZU5NkPntxvfvjdllmM473UnE0i4VUnu52S
        vZBpgvHz8SI1T5dRxsIT6bZcDO5mS3n0pQLNQ3wszG7mOEyEiQuCmIvxai4Nf1vBoXR9/twK5Oo
        U8vFVtL0p2C5aAOOJ3ePpOagNQ4KUauBzB60=
X-Received: by 2002:a92:c9ce:: with SMTP id k14mr19250703ilq.250.1592084494709;
        Sat, 13 Jun 2020 14:41:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb26JtPoL+OYiwijo1f/aBaj8/q93A9vM3woScZqAS1tFwQgWOSDCRXrCE9R7tquWbd2eGgg==
X-Received: by 2002:a92:c9ce:: with SMTP id k14mr19250688ilq.250.1592084494366;
        Sat, 13 Jun 2020 14:41:34 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id d5sm5174386ioe.20.2020.06.13.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 14:41:33 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] char: hw_random: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 16:41:28 -0500
Message-Id: <20200613214128.32665-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put_sync is not
called in error handling paths. Thus replace the jump target
"err_pm_get" by "err_clock".

Fixes: 6cd225cc5d8a ("hwrng: exynos - add Samsung Exynos True RNG driver")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/char/hw_random/exynos-trng.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 8e1fe3f8dd2d..ffa7e0f061f0 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -135,7 +135,7 @@ static int exynos_trng_probe(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not get runtime PM.\n");
-		goto err_pm_get;
+		goto err_clock;
 	}
 
 	trng->clk = devm_clk_get(&pdev->dev, "secss");
@@ -166,8 +166,6 @@ static int exynos_trng_probe(struct platform_device *pdev)
 
 err_clock:
 	pm_runtime_put_sync(&pdev->dev);
-
-err_pm_get:
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
-- 
2.17.1

