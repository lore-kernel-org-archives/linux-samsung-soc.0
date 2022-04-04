Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739F1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379348AbiDDV1b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379377AbiDDRD5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:57 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03D840A23
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:02:00 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id p23so4338219edi.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rHmGrV07kY5BqUXebpd1I+1++leGw0LEdhJA+STF0QY=;
        b=mWRHtZ3f4vPDUnyB7eySxcxqsansrCtiWjuIJ3r+F6cnVW4zUoJva6WGvoeppDWMCW
         nsaQFV5wHgpVtmP8L9SL5OyCjYheHThCyYGnwuQfqo4SbwdoY/xQXJ88RHAf+5zBkyBv
         I2iql4tDCNwqWZGXxpqwpT+w8XeM1Vqy7w3O7cNu8JQ/+jqvWUdkpYtlultkUPilmEsB
         M4ZbZB9lXtBWG/9nOB52ozEAA+auNbZ5Teb9Hu+xT/+vUJxwJZBPgtbHq/0nz63s9DsU
         8IUmACMePV1l/9ZhcYRTvGuLYhb8GbPdG8EhdwE4lj3r0IJ33PzF+64fcQtkGFXurccD
         4PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rHmGrV07kY5BqUXebpd1I+1++leGw0LEdhJA+STF0QY=;
        b=eEVR79XLE6QPiyxkBhr6S9whBy9GoS/V2UFTRNsULuZOO2ddUFoE2UDA4jBrFIwmPp
         7pKlkJD3TRBpz7ZCObmr5eYbgOdWKsHsFPsoHzCXp81HSeaPPt5O/JN3lLYkCW7CgISE
         kBK7o1uM/g0v08U6Rlqpp9EovZAWtYJwUWh3tgMlTP0GWkT1z9leukChQQMeDiL9GBUm
         ql8XWM7wSq+debbtZSVlfY3oq6vY+ECKLiEfcGG1F7HFLwAt5fLvisZwwN8gDotmN0Y8
         yzwr2cUQBi/sKSB1KzYw2JnzyOzwx50AnMd3RLIye2Y9aOJwRuW2BSmssQQ59++CGf7E
         /L+Q==
X-Gm-Message-State: AOAM532QXufDHpwf3VmqjUfXoDmKDRp1NAtuHAuJc9xJ+NpLxziCC0hl
        eCfMmsiNBypV9LlyTQ32zHdoXQ==
X-Google-Smtp-Source: ABdhPJyuhVzymu7WwGGXOzOLD6Z5dLjpPgNSkngxJvWAbzaQD7pGZY20Z0k0EhNSCGkxF1H3IodfIQ==
X-Received: by 2002:a05:6402:510c:b0:419:3fe5:15f with SMTP id m12-20020a056402510c00b004193fe5015fmr1176806edd.274.1649091719415;
        Mon, 04 Apr 2022 10:01:59 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 2/4] ARM: dts: exynos: add a specific compatible to MCT
Date:   Mon,  4 Apr 2022 19:01:47 +0200
Message-Id: <164909169270.1688455.3672791121533721760.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304122424.307885-3-krzysztof.kozlowski@canonical.com>
References: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com> <20220304122424.307885-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 4 Mar 2022 13:24:22 +0100, Krzysztof Kozlowski wrote:
> One compatible is used for the Multi-Core Timer on most of the Samsung
> Exynos SoCs, which is correct but not specific enough.  These MCT blocks
> have different number of interrupts, so add a second specific
> compatible to Exynos3250 and all Exynos5 SoCs.
> 
> 

Applied, thanks!

[2/4] ARM: dts: exynos: add a specific compatible to MCT
      commit: cca50a59f60a6b2b5aa2c90d8c173da89f567ee3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
