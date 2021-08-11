Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96968C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 11:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FAF660FA0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 11:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhHKLtF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 07:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237477AbhHKLtC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 07:49:02 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A7FC0617BA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:35 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id qk33so3647228ejc.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dVbMUoW3ODB/HqrQj9QMsvg4UcjoOQphLtGJOfXQLG4=;
        b=tLqQ1Q4ZmDF0GWwO+C3F55BzoRVX2dKIyhgtgjHKKcJn/PcEISO/vhg4T66jllGPyg
         TjL2SEOYBd7o3vq+4AF3hONbsZpQByl/Rk2hxzZOAGtutCcFzU52yl9J+ILf6urD6uWk
         3t5Jn8isV1aAB6i+H0GzYszNThuxbsDspjFZ3A/anNv1LF1M3h/KRpVJ3Xveg4LiBPXt
         7WP3eNNpcEqwwR0rFHbuaOYmivA4J05/89x6Bko10CbWApIzxD0+KQdxxTtG6Gab2uAA
         OCrlQrN1jcMFhV/PJcP27Mks2CN71g1Hoy/V/qTiQq+3EGsfugqpRtw2o9PGX9/IjGTl
         zzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dVbMUoW3ODB/HqrQj9QMsvg4UcjoOQphLtGJOfXQLG4=;
        b=d9DFfS4axiJGIrs7zJHohNevLEEK10bTjk4hlR2ouOSdjKikWNkxMnyjCQpc9L04HU
         BsNO3jCsmqzrwTQkRxs35GCP9o/bNSdfXctJNz8BI5EwQfhctr8donaiaJYYnBc9ezq/
         hUuGpmSH8cCkL1HsiTWLKxFPTcFk0H6ObQf4al1hAG+43nYX35rNoti5Dz88JTE56Kt7
         F0/ktHlHwTboNcUu2Z1sMpGqOzbZ3DGwauXb94fDUay2V6+s2go+4u73meVgEo4Tyxv0
         Ho600H8DhVL6/JvP1tG/AK1h2tKFJvA42kRa53V+vVAUSDLiv3kE1sQr4QVBeY1KqPHt
         uY3A==
X-Gm-Message-State: AOAM5339g1zREOdMc6H+8rIeql71lrHxbu/a8kzJm8mhpazm/GPGBWmW
        4ULZpB4YGbOs4E1mvf4VJN+p8g==
X-Google-Smtp-Source: ABdhPJxJLRHsH9CfRsfHJsy6TvmFx2W6Ic3KvGkXHyeQaKob/XnyuXcDZvw12C575KwVBsfnb1InOA==
X-Received: by 2002:a17:906:5413:: with SMTP id q19mr3265627ejo.422.1628682513955;
        Wed, 11 Aug 2021 04:48:33 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i10sm11096232edf.12.2021.08.11.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:48:33 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
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
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: serial: samsung: Add Exynos850 doc
Date:   Wed, 11 Aug 2021 14:48:23 +0300
Message-Id: <20210811114827.27322-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for Exynos850 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - None

Changes in v2:
  - None

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

