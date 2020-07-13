Return-Path: <SRS0=iB35=AY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E77CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF63420874
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1WN0X53"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729895AbgGMOu4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 10:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730129AbgGMOtn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 10:49:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C632C08C5DB
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 07:49:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so13578628wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=we+FYdI1lkoYeqfH+hTSe6pNVLsfmTg5CRQP3bOvglU=;
        b=U1WN0X53vbT4MvhLNRle/Pi49aoyXp8l/FZ9qbfpELXVGRvwteyYQ59YIS581Rx0Xp
         q5UQZNPMwm4gbhy2sGnmyUhu+w/WSyDy8SZwq5gc7YFHp11qt2IevOUpEE0bd15DH/8G
         F0tLllXkjBOGT94L/jRw4tRXmh6xUXZ42RV3KnfYe23GHPr8WB7Izy+DlVxJwv3uNcH3
         spPTiORGerSbhn1gcD3+8ZhgKGlr3WTLewuQPjCmNoxXAWdMLet04UicbcIPSh9F7Dh8
         3s3nrgW8efZiHQaPyILOHhsm0gTtGvlZ75SUX8Oby7yTHrd4vKHUhLfTND2frhv/Mv0y
         EjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=we+FYdI1lkoYeqfH+hTSe6pNVLsfmTg5CRQP3bOvglU=;
        b=OLULOXuCE0b3orNhwM+f8AqfgBB4/0K2qLv54+D9jYWQfIxh6OnUKLTEDyAnyLUpRm
         x1Iy+/JDxAwfOpn81h+03QOcyh9dfcqo6B4b9ye2+61xz8ryw+dp1JZHBzXqE0aL5u/1
         1vYkpLR28hnNXG4egIJSPWLIuhyxxGxcqXdte0g89mE2oli0oEXKZrZhTM/AWGfGMwSG
         4YnLBP5D41pDpeR2dPVo59qhOGhpqzF7pJWqakpJUBNzr4SYj9/Puu5uyS4ZyhQ0pdz2
         4C2QUXPPl2W3LmTCEQHI+CTiG6xYOM2Po9lFx/2rj8JT8Ea2dICW5v8xOqU9UFIINll+
         NrVw==
X-Gm-Message-State: AOAM533HEKfiu5K27CU/levGAD9qR7y3Jh8Gswal3/iufn5Kr5I3goeB
        7Ce3WJ5z0r36CVUQMIHOJoBnEw==
X-Google-Smtp-Source: ABdhPJxoVsuUxdjQrc3CM3WbousZGi/1/+jQn4P+0A7iaqIru6LA4EJm04rEqpNRn1DujBpLMkOpjw==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr311154wmf.146.1594651781752;
        Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 08/25] pinctrl: samsung: pinctrl-s3c64xx: Fix formatting issues
Date:   Mon, 13 Jul 2020 15:49:13 +0100
Message-Id: <20200713144930.1034632-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Kerneldoc struct titles must be followed by whitespace else the
checker gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/samsung/pinctrl-s3c64xx.c:212: warning: cannot understand function prototype: 'struct s3c64xx_eint0_domain_data '

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index f97f8179f2b1b..b8166e3fe4cef 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -193,7 +193,7 @@ static const struct samsung_pin_bank_type bank_type_2bit_alive = {
 	}
 
 /**
- * struct s3c64xx_eint0_data: EINT0 common data
+ * struct s3c64xx_eint0_data - EINT0 common data
  * @drvdata: pin controller driver data
  * @domains: IRQ domains of particular EINT0 interrupts
  * @pins: pin offsets inside of banks of particular EINT0 interrupts
@@ -205,7 +205,7 @@ struct s3c64xx_eint0_data {
 };
 
 /**
- * struct s3c64xx_eint0_domain_data: EINT0 per-domain data
+ * struct s3c64xx_eint0_domain_data - EINT0 per-domain data
  * @bank: pin bank related to the domain
  * @eints: EINT0 interrupts related to the domain
  */
@@ -215,7 +215,7 @@ struct s3c64xx_eint0_domain_data {
 };
 
 /**
- * struct s3c64xx_eint_gpio_data: GPIO EINT data
+ * struct s3c64xx_eint_gpio_data - GPIO EINT data
  * @drvdata: pin controller driver data
  * @domains: array of domains related to EINT interrupt groups
  */
-- 
2.25.1

