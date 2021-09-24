Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C36BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 004B860F4C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346189AbhIXNeF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:34:05 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59742
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346284AbhIXNd6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:33:58 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 41DDF40790
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490344;
        bh=WNNN/oInJzxgO+63uGtXtE4bZ4URhmkG4TzZ5wV565c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=GpHj8e366DJQx/PSG/WWvAloiyKtpR1XdGF32+ufXq6XAQvkWlPlXzbwmwGWsBmLT
         0vVFpOnz2ooOe7OdAXwTyOGTprrE9KFIbRvnZzz5S8AOgC44AV1x6VvxJKSEvPtHk3
         EwjbR9owjTtAOkBypc2Sb6QCQBZwHYRP7v2/oyVtqfEcd/hGWwxqmE/c/E5TjSCr7O
         RPJEdrkDAXqwH79Vp8JY+vHRXVtU1o7y31pd1UtzJPh1S9bYKZHqSl4a2lTa0RTm4x
         fGp5mVikRaF1MgDGM5526UArTHMEqz8E5Kh5UxL4UebyMMEvih0jhnuyArgP8LtXwK
         VPm9YsjN1iZrA==
Received: by mail-wr1-f72.google.com with SMTP id r9-20020a5d4989000000b0015d0fbb8823so8053899wrq.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNNN/oInJzxgO+63uGtXtE4bZ4URhmkG4TzZ5wV565c=;
        b=JFpr1fwY65Yj3u/Gm70IIQBRKJQ0O4lv6LMm20dHQfo9pfwdbrDSXGipNzpOjUCbSb
         X1oy2TJMtdAX6nfEU5BjJswXaKt+ddHPHnly291bB1c6kbMm9kDjyo54q7DwzfizsxLe
         NcdpcjecywvKElA5uNeQvWME4n+OB9nJIa3bXeZJ07xgM+h0Dt68yu+Yq9Tm89Bs0Ada
         Occz+FPUIcy84YWfmVij0jsjmIWn0WY8JGaoPfJDPl2fCdwEI5ottpYia53AZc2tpCT1
         /wVXtL2UbZUA1VsDEJrzBs8gesqMATXuqbqB8ThnRlaM3uRXfGZvg0FUX/FjlJX/05va
         YLfQ==
X-Gm-Message-State: AOAM532vlijKBbVCfU5CWpgb5REigB+2YDL16OHn5PO8o3yMS/FAB2+h
        /kAcvPYkNFl6lksQY0bXqNHcSMdguRZbUs2NqxPkf7BE/vgoI0sM+vdqf12l2KfKcWsluXeOeCT
        MR12RXUbRDtcGRHOJGlPIoazggM/cTfi/uG+56H01mRcSFeye
X-Received: by 2002:a1c:7f57:: with SMTP id a84mr2175627wmd.34.1632490342961;
        Fri, 24 Sep 2021 06:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxdm8BNCQifJ7uMGJIzTnRdy/iOjAr/qBwQBxmwjwyGKGSg/k4Yt8m0Ov2/oVtlzy9V/5yqA==
X-Received: by 2002:a1c:7f57:: with SMTP id a84mr2175602wmd.34.1632490342836;
        Fri, 24 Sep 2021 06:32:22 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id v18sm8400743wml.44.2021.09.24.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:32:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        linux-pwm@vger.kernel.org
Subject: [PATCH] pwm: samsung: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:31:48 +0200
Message-Id: <20210924133148.111845-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pwm/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index aa29841bbb79..21e3b05a5153 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -476,7 +476,9 @@ config PWM_SAMSUNG
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  Generic PWM framework driver for Samsung.
+	  Generic PWM framework driver for Samsung S3C24xx, S3C64xx, S5Pv210
+	  and Exynos SoCs.
+	  Choose Y here only if you build for such Samsung SoC.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-samsung.
-- 
2.30.2

