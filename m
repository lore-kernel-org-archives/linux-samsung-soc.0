Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD1C41537
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73F4360C3F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbhG3OuA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Jul 2021 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239542AbhG3Otr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:49:47 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5DBC0617A1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cf5so1994437edb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JbUamQBQTeeK5FgvIv/xtu/RYU45rMZWaCOPLzo3D4=;
        b=r4nEdjAhktIKR3JHq/4i/7OL56PxGxvFITxQ2YHvG0hMvzdzChamM+0y7HGpkWbJ0S
         W+gaahiGEYZJUnwoDNHCjarA5xjhwRpvKFzpQyZDGaykdcbsRkh4558wVRz+Z6vpJs8C
         px0t8+H0rRgHvzTOo6hUMFbm6l8hJ1k37IG22v726mIIC9SUX9+Tu5sQW0Ln+zMk6csg
         mFMLPvdyYWuBUz+MzhlBRgy/0V7jyFjQScYnYv61AyqEXFA3IUpaHEn4xBpTgysWz5yS
         bmbfAZttptO2e72KrwJYsE4sdSw9ziBSCmW9nzXZwvJjEBIOz2XTBqIK2e8bPPNSEGIU
         MTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JbUamQBQTeeK5FgvIv/xtu/RYU45rMZWaCOPLzo3D4=;
        b=cpgVN59kFRLA7+y4qmFEMwcYAl+1GDCNovPf+YqsV/Zly4+guTflrNHD/hpgMK4H3r
         f8TptvretdONrXLkSBaOT7gf1dLSIo2bGL7U4OKusVWY90Y09ZmCr7dSjUXzqCVxvwDQ
         6P3WT26oaanqICn9Enwu95N3h9sJHqsdee/4RnQhlUcTJchO2xWz9qLGwn29WVCcAbFU
         rL7iy24t2ETQiA+z5golfCBFozXd6/lQCj1n4zJtp9rrJBkF8pz+8sN2VynWEXajZeai
         T9HeXVQNyxXXD+H8Deg7ldJOpJ1AZEGlEBsx9ue2eGocbx4OE/7urBITmnjdzp++cmrP
         aEaA==
X-Gm-Message-State: AOAM530cmRvH4lJiZ+87kTAQEnOYJr08cfni20Nslc3Fv/4r9/LKLf68
        TZrGgF0Ja25Ij7YKhfO43VRBJQ==
X-Google-Smtp-Source: ABdhPJz42jwFfl72k417UQvTasfCAm8Hz1S5wW2zANurMaS3m2WAqU3tYXM2it7TQZzrU0ZmdahAYg==
X-Received: by 2002:a05:6402:278e:: with SMTP id b14mr3338823ede.277.1627656574578;
        Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id og35sm647731ejc.28.2021.07.30.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 07/12] dt-bindings: serial: samsung: Add Exynos850 doc
Date:   Fri, 30 Jul 2021 17:49:17 +0300
Message-Id: <20210730144922.29111-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index f064e5b76cf1..2940afb874b3 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
+          - samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.30.2

