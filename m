Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B1EC636D7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Feb 2023 13:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjBKNrn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Feb 2023 08:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjBKNrm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 08:47:42 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F60128D0C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2023 05:47:41 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so8163828wmb.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2023 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNw2mod3gWtSxV8TGsOP4LskTXsTrjJuzsHKbwxb+uQ=;
        b=nP3MfXPXwSqRwAc+vIoE2dSrs3YZ1+8AUIZ7cWGqUlkZQYvs4YZTUnE07Pqco2oitB
         5yJURMsKyg4E7dRCx5QE3tQlVBIfX/k5nDmJeG7IKdq43V+VVWPUMJ/UW/9DScUvv55q
         5JwV51ALM8h+LjRngFHzhzi9alXxQ3kImHPYQ1/oNq4Gel5Fz3OnHipp/GVJZW1epSEr
         57Yt+O2hmgDbdHHGK6rquu5VmuMDr4eIpE6edCVROC4rIzEppanXF1twx5u+ppqAIrj1
         y0QU2v+uQCx8EeE7sjizYEjvPtxN0tEtlw57b2hbml5fO8CQ8HTQzrGM+LcL4vDq6L3u
         R/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNw2mod3gWtSxV8TGsOP4LskTXsTrjJuzsHKbwxb+uQ=;
        b=o8TziWa7G8QdAG5czol7Mc+wYg/qDqh6uFa6+0pfPeLMl8eVsKQnssDs8Jg5UF51Ev
         Rq7TmqmVZvyJF7c5eDo8wHZAMziOBoTqTyHwTnoKW2wJ3DAY+Wf3Qkf2har4Zz25riDG
         qo65vPrDEv1J7xlt0Tvyv+W8MkaBtoMqB5rVVqQ0TjM51fGs2vTIjvwODjBtjvFU4mSg
         6eBAYgnE7m2A692un+zoyw3FefVpzLoD22UA2u9HtPV+mfNF3M4036GmWzvJjlPcFife
         9+CZVnKEo9rSzC3VknW8cJpLCZGdhB+Lxu/PYzljHB4hsKknA3EnMRWcP5raxjsVG3n4
         DLlA==
X-Gm-Message-State: AO0yUKVUMbTT0koY+lyz6hGAwfAM2c2sFjCbFYRon438OgPdnL7vdnMc
        JuSQy1POmtfzoQDafTrD4jaynA==
X-Google-Smtp-Source: AK7set/gA9F4rO7vw/m35L3ozxDwFR/WyvdGiXfXG/ffB/dutI9OO7WFUkGppG57qHHxnFT0lbrWOg==
X-Received: by 2002:a05:600c:3d98:b0:3e1:e149:b67b with SMTP id bi24-20020a05600c3d9800b003e1e149b67bmr1213952wmb.18.1676123259672;
        Sat, 11 Feb 2023 05:47:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y9-20020adfee09000000b002c550eb062fsm1118055wrn.14.2023.02.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 05:47:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ARM: dts: exynos: drop unused samsung,camclk-out property in Midas
Date:   Sat, 11 Feb 2023 14:47:31 +0100
Message-Id: <20230211134731.85957-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230211134731.85957-1-krzysztof.kozlowski@linaro.org>
References: <20230211134731.85957-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The S5K6A3 camera sensor does not use nor allow samsung,camclk-out
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 525f945c4b91..763bd3441c5b 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -592,7 +592,6 @@ image-sensor@10 {
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
-		samsung,camclk-out = <1>;
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
2.34.1

