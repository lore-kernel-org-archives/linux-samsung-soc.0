Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C2DC43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhLQBaR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhLQBaQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:30:16 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F408AC06175D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:15 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b19so852967ljr.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gMoyGZFMOrtFD2i+WoXh7qozc6etdJzwaY+U9hXibg=;
        b=Q1bgyZKSBo51wkneapHn9To5VF7IeoH9ZAKXK3FtqsSvQVWoK4r1rvLYiFyvQJFcav
         T2A5OaU/TwayBCjcldondyZnYw8YV0eeuP11nSoMdhrnDwVUVCD+LAOEfx/mGy9CKGYq
         iubzfSBm+RbEB1LsNaCnuFuwypWXNJqlNfmZL4ysBbJw97MeyJlo6uogxv9KII4bpGD/
         nwID//auOXpKtVCPuJSFSfAECIju2pikpUEsN8N24VekhriuMYiVROx1JSqAFv/2/VLx
         /mF7JsGaZSswYsmyVuGdssqrkI9XRAEgG5OdMvXNft672EGJMa4Nwq+7FExnity92/e4
         kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gMoyGZFMOrtFD2i+WoXh7qozc6etdJzwaY+U9hXibg=;
        b=g+OheI0e2/LZNYPRoZb91nTerm084/JMOAujVG0p+oMALJioBQCsuCJdlAHrxlJ7w4
         2U5V+qWW3Ip/6/+iKe8jnOISrv4ojI78H+vfmP8tE4AFi/0SpW+TquTiqJaa5JHTXp4x
         H2z4L4BCM69rn8huU3+g7XPkmirA8ZFwZZqDpNLgjaPwILqou4Ch4JyeeemoPQijZ7Of
         p3XxxcAiWw99c0Z5IKGLatYMIp1BdTpFyPzjn2jwNLKTXuKNnq4My1S9+/n0Ufva38S+
         5MM7wQC7UgzxlMVD5WT/cbeCUZC/NmCspI0mtHqe+cetbPt9d1mMKv/knXenlSk9s0sr
         HSaw==
X-Gm-Message-State: AOAM533a6qySMrhzXCli2udUb7UGdATVOrzEPNebYRiOfzWfZR2oGmoX
        iLsNzUGpd4ti4IIgs4TX/ThoHw==
X-Google-Smtp-Source: ABdhPJwYGpaI3GK2jyICva2hvw6KK49b/X0iRkfEL7ZJ1jOxB5cBp5dJq4iwrfStYWcZEw39OYgwyQ==
X-Received: by 2002:a2e:b6d4:: with SMTP id m20mr669927ljo.471.1639704614273;
        Thu, 16 Dec 2021 17:30:14 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id t7sm1129670lfl.260.2021.12.16.17.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:13 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Fri, 17 Dec 2021 03:30:03 +0200
Message-Id: <20211217013005.16646-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217013005.16646-1-semen.protsenko@linaro.org>
References: <20211217013005.16646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
block correspondingly.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Added Ack tag by Rob Herring

 include/dt-bindings/pinctrl/samsung.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b1832506b923..950970634dfe 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -36,7 +36,10 @@
 #define EXYNOS5260_PIN_DRV_LV4		2
 #define EXYNOS5260_PIN_DRV_LV6		3
 
-/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
 #define EXYNOS5420_PIN_DRV_LV1		0
 #define EXYNOS5420_PIN_DRV_LV2		1
 #define EXYNOS5420_PIN_DRV_LV3		2
@@ -56,6 +59,14 @@
 #define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
 #define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
 
+/* Drive strengths for Exynos850 GPIO_HSI block */
+#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
+#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
+#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
+#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
+
 #define EXYNOS_PIN_FUNC_INPUT		0
 #define EXYNOS_PIN_FUNC_OUTPUT		1
 #define EXYNOS_PIN_FUNC_2		2
-- 
2.30.2

