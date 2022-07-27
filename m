Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B35C00144
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 01:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbiG0Bd6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 21:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240086AbiG0Bdz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 21:33:55 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5345C3B942
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 18:33:54 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id r13-20020a17090a454d00b001f04dfc6195so344660pjm.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=1N3h8/3xSQWX6SxOF5BPCgS/YJL4wXTsZ8CkYeFIT3M=;
        b=QpSGMoTn06o1HCqJaequgVUCWVDL6y7V2pJAXhgcZslE7hepnB5qO5bhCsayf8BgZT
         ioAnJDRO4dHDHZqT9epxdMWWuTHPxYpYQv7N9ry1QlIk5/V+cdUycj6fXPdRo+zdPUo4
         +0Z324w4ZR5jGLPTe46w9q+JE1ZZ5ABziZoQBzBQTrwwhqWlRBOLEcHVBm9L7dK5/Xdi
         xfKd8NoIGd/LYe/RpZOiwPs5NxYvdylykP+HFfsBwc/HIFJB2XohGmZzvFpXtiCPc2sI
         KLyTgTV/B/ZJi0VZmQ1yZMC9+h2YpRh2EOANQBwbCIdYGeqvIQFkcbdQymaE9OuWqLHy
         Y7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=1N3h8/3xSQWX6SxOF5BPCgS/YJL4wXTsZ8CkYeFIT3M=;
        b=43I3vReYn4zEbEY7uBQjNLUqe4g9A5fxziS8A5E6B0OxaJFbmpFitsqOgh8TkuRRtN
         GtMUxzThYISkDom8heNC5x4z2kurI2Ufrq1T00uWLCVXCKdZOeUuD/SIf/rgp4k1mnWO
         sxLnj4JIAjhfD4aqCdX5dX7OKkemXeYVwtLUnWM7o1BldPMu27Fg4ze0wx07txPkWyBe
         jx/YWWOJNL3fqVlHIHyi0Uvyz6t/bESmpPbJsr7I0eD/JwPBasG9Xs/K38Qw2nSJiak7
         3WLuN1z9sRx+bBM7fK6IhRm6IoFkx6Z9aWbXE936+IH38VDuubN7mruq3STpDdkhz2Vr
         SKGg==
X-Gm-Message-State: AJIora8CI3T4HzPidKcfSd0MdWomXSF2SHdjgb9FanggrHbfk4UV6Dpm
        dXCIigOG0dwga3yYl8zhyc/sxVyxpWdb++g=
X-Google-Smtp-Source: AGRyM1tNXxJJfexei0sXfG1FBir9ecawTKSUmr8oBmd7eGPMiF6IiFNkyG65ifGlltihpNEjyyTucthrEgJjoHc=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:f771:727:f95a:5335])
 (user=saravanak job=sendgmr) by 2002:a17:90a:6b45:b0:1e3:3cfa:3104 with SMTP
 id x5-20020a17090a6b4500b001e33cfa3104mr1862493pjl.113.1658885633796; Tue, 26
 Jul 2022 18:33:53 -0700 (PDT)
Date:   Tue, 26 Jul 2022 18:33:48 -0700
Message-Id: <20220727013349.3056826-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
From:   Saravana Kannan <saravanak@google.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As soon as a gpio is registered, it should be usable by a consumer. So,
do all the initialization before registering the gpios. Without this
change, a consumer can request a GPIO IRQ and have the gpio to IRQ
mapping fail.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 26d309d2516d..a302b38a63a8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1168,15 +1168,15 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_banks;
 
-	ret = samsung_gpiolib_register(pdev, drvdata);
-	if (ret)
-		goto err_unregister;
-
 	if (ctrl->eint_gpio_init)
 		ctrl->eint_gpio_init(drvdata);
 	if (ctrl->eint_wkup_init)
 		ctrl->eint_wkup_init(drvdata);
 
+	ret = samsung_gpiolib_register(pdev, drvdata);
+	if (ret)
+		goto err_unregister;
+
 	platform_set_drvdata(pdev, drvdata);
 
 	return 0;
-- 
2.37.1.359.gd136c6c3e2-goog

