Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA566C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 07:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbiEEHM3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 03:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245548AbiEEHM2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:12:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675444757A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:08:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g23so4123584edy.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 May 2022 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=duYWT/Kl8tiyZtY/aESu/b4/GiVt1L4PnTvoWa73yYM=;
        b=OMIT8mlwarcjmie4694HkB4wpke5YY8WBP2MY8g4bLOhmHgVSsCOJdfQhpfyE6iRDU
         +73LfA2ddxMyesirBykiRBtgBuPzUOxclMbRQZ7Bvl6t+gTtInjsOYUhPUBFYbU6sFD/
         8/cTZJnvxHjoosOHQanxNdidtKFkdILDJqnSUBsZCDL4VPcxkSuvMh+udrY6XoW9ZezI
         2I7f+6XCs+I1N81i15+RMD7o+J0GlpAAwbjfo1vP0NY9i+yDOFRp3EZNhzxcmFqKgb5l
         UomDj4aeEPWS0Nqd+OXyIsO9QG6uOGXJboJIFpVKQQeFLue9vOZywAcamtVjNLXeOr4h
         bA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duYWT/Kl8tiyZtY/aESu/b4/GiVt1L4PnTvoWa73yYM=;
        b=YdapeIvWtH2Pl5tYY8WCsdj4pH11qoisg9wGK1ERvMXwm7j8u5cQV59KSON51d5hIz
         KsOYydLQ/g1UKZ0ZYLgKKPXHTcz0Y9vlYIzmkfcKaDZQHU3r6BUjhD8eCcpV9F41I1TN
         IOenqqA0+mNP14fTqNROOzaciPdhDe6YVTXsyUSoLzFSxNbQB81RzOwleUgLAhA3NJzy
         sXwGuTaLujy1pM1DB8EbDNdKBbiFJ9f3Zh9ZzsrCtGgffNpODfNn9Jx5pOXY+STWsvns
         081cBEDDHNw6JgJfsZsgLKnUC0rVT4CpihjwDNtseYsxH5C7L+MPY5+4mdzbtqeTe0qX
         B+pw==
X-Gm-Message-State: AOAM5336GbnukCwyJxIRVcgHvdveJaTmX0/WUXX2xHRoAvr9N5nusk4I
        8NLPkntDSdwhcrWKgUH7zkfKGg==
X-Google-Smtp-Source: ABdhPJxXjwWDCwEVFJTt30OZtNvS3vZ90x+EBahDGCjmESxtkKHS4Jd1qRjgA1LECWkX1FLjJKarjw==
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id ee50-20020a056402293200b00425d7b3e0d1mr28203271edb.141.1651734527881;
        Thu, 05 May 2022 00:08:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b4-20020a0564021f0400b0042617ba63ccsm394386edb.86.2022.05.05.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 00:08:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 10/12] arm64: dts: exynosautov9: add initial cmu clock nodes
Date:   Thu,  5 May 2022 09:08:43 +0200
Message-Id: <165173452272.31721.8927188974111368088.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504075154.58819-11-chanho61.park@samsung.com>
References: <20220504075154.58819-1-chanho61.park@samsung.com> <CGME20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9@epcas2p4.samsung.com> <20220504075154.58819-11-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 May 2022 16:51:52 +0900, Chanho Park wrote:
> Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> 
> 

Applied, thanks!

[10/12] arm64: dts: exynosautov9: add initial cmu clock nodes
        commit: 5394461a31c9d1c6a0452a0312f941e0b4d08d74

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
