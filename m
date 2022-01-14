Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1262BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 20:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237196AbiANUiB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 15:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbiANUiA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 15:38:00 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538ECC06161C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 12:38:00 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d3so33856142lfv.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUGzTTyriTXZ8n39Zh2yraY+YbTAIxFn2aNWIIs8oNQ=;
        b=lHnbPLnlJnWZf4BOMgmL2WqcLhiNaGPR/dRyJ+W4VokrCg0QyE0qjyGQzu70znnfRN
         JgnFwglHtOeXECzW+ZZgqy0HEoSeFG5lKatmVX0JLcK5El8sDxc/Ct8e5poffUjcdpcE
         DMt1jsK2b2xhzdqlUCuoCjI69QqxErIeO3636yS7B7BiWp56sJzMi39LWt2YiSAgPyfQ
         W/J8cKN7U2ztZfhK34tF9fzmwv7A2tHK3bY77Mp+lgO3GhAb6TM3w9H79V+Rjf0Mfc5z
         ocNlQgM9I0QO7kTjTNPSGLMy/pb7iz77FLe9OZ5JsnfCR1SEs9GYj4XY/xnRWn60RcHB
         gHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUGzTTyriTXZ8n39Zh2yraY+YbTAIxFn2aNWIIs8oNQ=;
        b=wUZV61/LSqN338hqEZcwKzbtf0dMttIJGj+/5krpBYeJs/HVyadeXbI9lkB3LUgMlC
         8wiGqYKLMPfD8nT9dawal7/4J5XjKwFB2D6YGYRisDyKpImjsIobyEGtrI8US6/Gb7vu
         m65oJKQ6mh+GrwQt20TTLKJcXhoV8YwHzpZu7a5JPXXPxp3XZX1Kz5ZFcnVWT6ZOWtFh
         +cVHqeZ4QIrNXqxoe3f0CC1D80HVz4kEMchOoelD597deDscr6XP010tpe3EhRZYPHXR
         +oJ80z2r7yGgIdB1wOkPuMDtzlH+K7cj1RqnUc5YMeq54R3IHoV4wD8ribjctP4Kqe9T
         kB9g==
X-Gm-Message-State: AOAM532iy4/W3k2FmRedaa9PxsJJ1bz1r5JRKs6vpnLyWkisM02LJSp3
        G/iaIt+vZz1C6ix2+gYBvu8tfw==
X-Google-Smtp-Source: ABdhPJyeB8FDojDbTY19RElb4UtHYMamhY3DprjLgedvmvQQCZDyifUK3I/wm9pcJvBq8VX6y1Z4jA==
X-Received: by 2002:a05:6512:3044:: with SMTP id b4mr1614836lfb.7.1642192678674;
        Fri, 14 Jan 2022 12:37:58 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c3sm371492lff.261.2022.01.14.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 12:37:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
Date:   Fri, 14 Jan 2022 22:37:57 +0200
Message-Id: <20220114203757.4860-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

GPIO_ALIVE and GPIO_CMGP blocks in Exynos850 SoC don't have EINT
capabilities (like EINT_SVC register), and there are no corresponding
interrupts wired to GIC. Instead those blocks have wake-up interrupts
for each pin. The ".eint_gpio_init" callbacks were specified by mistake
for these blocks, when porting pinctrl code from downstream kernel. That
leads to error messages like this:

    samsung-pinctrl 11850000.pinctrl: irq number not available

Remove ".eint_gpio_init" for pinctrl_alive and pinctrl_gpmc to fix this
error. This change doesn't affect proper interrupt handling for related
pins, as all those pins are handled in ".eint_wkup_init".

Fixes: cdd3d945dcec ("pinctrl: samsung: Add Exynos850 SoC specific data")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 2e490e7696f4..4102ce955bd7 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -585,13 +585,11 @@ static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
 		/* pin-controller instance 0 ALIVE data */
 		.pin_banks	= exynos850_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks0),
-		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
 	}, {
 		/* pin-controller instance 1 CMGP data */
 		.pin_banks	= exynos850_pin_banks1,
 		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks1),
-		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
 	}, {
 		/* pin-controller instance 2 AUD data */
-- 
2.30.2

