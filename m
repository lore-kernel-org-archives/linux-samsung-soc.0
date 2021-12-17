Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C655C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhLQBqY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbhLQBqS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:46:18 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EF7C06173F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:18 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 13so890396ljj.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wPYKsc8hcAcKM9XkSJHD3tyTG5SQVtY0a/Z6LIBZghA=;
        b=QGvC3xOyql4NDBA6cTKXRHgndFdXiBo5Or3c7LvJJcY3Md4xyI6swTam7aRSXilDUX
         rBtuF2rq7iv3YnwzUb6/5yz6WFFDHpTLJFUzrUpd/mHi8pbedp1wcINONNimvqPNlJSb
         t0SmFrpxou3/InfrTDxq+C4UW5T96h0avXH+6A/5a4IEdyRoZVYzw5pZKZGMmlk+x0oz
         Hc5WbC0MX3uK3P1MIvY/xHvUPrBV1o9IAk0/er8v7H6qU+l6yPSCkmHDlJimb2zQ2+xB
         YUahyyH78GSS4eDSjpFFqQ7GnCp7Luk3CEGRtBPfG/PabYPmCRhs4+N9i10hzn8a+hjL
         4zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wPYKsc8hcAcKM9XkSJHD3tyTG5SQVtY0a/Z6LIBZghA=;
        b=dLpHw1AQRl5lqRU0JHp3GizLvoTR1NvFB3V58eXHpVf7OQBepXhYKYXUNypIIBn8Hn
         Yp0SWllHDze06kj3WYXiJvktVLkqbqA2q6MexcRTsWIdJK3CRH/1ps6cBYFZ9+WhX1VZ
         Oq0rgCkk+7dDAXLeaqLCBKX5pijGw7LZEt/C6eafToxzto0SJmz2C3gLFVLNi6zFz0QN
         ZGzRGeoXYdOT+LHx2Fz7LWPdqscapJBmkDpoYabZMxwMAI8oXMEof1T1mOHj8uNGM9Ky
         FNB1SOjcX2eKJ/rUqS7B19H3Nn0VAqCBjTj0eTESBHP8bPsLJAdj2S4yqaBg+qq0Bojd
         SZEA==
X-Gm-Message-State: AOAM530YR34JrzWElPpJC3QGkmD4HR+Sb16x1lthlUiRsss32ohbrOBe
        kt/8bXbfxVgMPUjfnHN/L94UWinlKjtTlgtX
X-Google-Smtp-Source: ABdhPJwJb6DTzGCHn/WXRc1Rc5MCy/Rjaj87m356hD+6H10qL8vzYfafwcWdiA97udrqHv9pKyDcxQ==
X-Received: by 2002:a2e:bc10:: with SMTP id b16mr701256ljf.247.1639705576507;
        Thu, 16 Dec 2021 17:46:16 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h24sm1386438ljg.106.2021.12.16.17.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:16 -0800 (PST)
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
Subject: [PATCH v3 1/7] dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg clocks
Date:   Fri, 17 Dec 2021 03:46:07 +0200
Message-Id: <20211217014613.15203-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

System Register is used to configure system behavior, like USI protocol,
etc. SYSREG clocks should be provided to corresponding syscon nodes, to
make it possible to modify SYSREG registers.

While at it, add also missing PMU and GPIO clocks, which looks necessary
and might be needed for corresponding Exynos850 features soon.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - (none)

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Rob Herring
  - Added Ack tag by Chanwoo Choi

 include/dt-bindings/clock/exynos850.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 8aa5e82af0d3..0b6a3c6a7c90 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -82,7 +82,10 @@
 #define CLK_GOUT_I3C_PCLK		19
 #define CLK_GOUT_I3C_SCLK		20
 #define CLK_GOUT_SPEEDY_PCLK		21
-#define APM_NR_CLK			22
+#define CLK_GOUT_GPIO_ALIVE_PCLK	22
+#define CLK_GOUT_PMU_ALIVE_PCLK		23
+#define CLK_GOUT_SYSREG_APM_PCLK	24
+#define APM_NR_CLK			25
 
 /* CMU_CMGP */
 #define CLK_RCO_CMGP			1
@@ -99,7 +102,8 @@
 #define CLK_GOUT_CMGP_USI0_PCLK		12
 #define CLK_GOUT_CMGP_USI1_IPCLK	13
 #define CLK_GOUT_CMGP_USI1_PCLK		14
-#define CMGP_NR_CLK			15
+#define CLK_GOUT_SYSREG_CMGP_PCLK	15
+#define CMGP_NR_CLK			16
 
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
@@ -167,7 +171,9 @@
 #define CLK_GOUT_MMC_EMBD_SDCLKIN	10
 #define CLK_GOUT_SSS_ACLK		11
 #define CLK_GOUT_SSS_PCLK		12
-#define CORE_NR_CLK			13
+#define CLK_GOUT_GPIO_CORE_PCLK		13
+#define CLK_GOUT_SYSREG_CORE_PCLK	14
+#define CORE_NR_CLK			15
 
 /* CMU_DPU */
 #define CLK_MOUT_DPU_USER		1
-- 
2.30.2

