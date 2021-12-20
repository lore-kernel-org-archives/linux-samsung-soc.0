Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05646C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhLTJhe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:37:34 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59580
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229782AbhLTJha (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 04:37:30 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1356C402E1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993049;
        bh=EtKf6IRMM8iueW0p5q6XbiNdaopaG6efPQ7iJfoChDU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Tu9asVWo6SxrvvVN2iHsXG//Ww7D/LxNsqI7sXs/uxF5UzMLZPWIX/mv6s5yMeIgJ
         k8vH5jqtPL1Wlv4RKsoJbv5xyDP6m0DG7HwFODfpbT8W2oh2fdq10HF52PDFQk1zUW
         V6kmKq6LN+RLFiJAvwMi4+BucLSaxVCDWAoBngpMo/mvpfTvGQjOeNbkiHFe1dst/r
         QWUQungxvF0U/R2QzGVNyhUOAi3RYUd6TrA343mfw1QXTLSZNRaHSMwcbH7rbKVAZY
         2BCW3akt1ubGUf6ei3hApbVNhqttd82HXa7ts4xs7RO4F1vw4Jfw3+PFhr7mtmO/TB
         e8aC/kOzIAsYg==
Received: by mail-lf1-f72.google.com with SMTP id b35-20020a0565120ba300b0042604bb4857so297069lfv.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 01:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtKf6IRMM8iueW0p5q6XbiNdaopaG6efPQ7iJfoChDU=;
        b=Muu+8gyfqHT71w8KPgG6EHbgMCny8nwvhvlAUh+smziueGihKojGgzctThKpYRnAIp
         r3nixSfLtmxAHdrAO2OGU2BhA30T/rHDcIt9j0/4wTaqVAS0FVV9LcTOr2Dfo6JohHON
         mGs/w6xDG6WxfRIf4zF9Dh8kf2606wfqof0GGk6lXrIh9JngjqLhubWogNlfPrksmmH+
         WkI0yPclh5f/jexOcTwOuyraKBik9TdhZ8O8/yX1AKcWDNbMTJMijzCoyx9WT1Q21sfb
         CsY7/wfSOzGRI7/4UaHQo8pKGc23SS8rBfFGCPRgRd5l1+wdAbLTf/jTqgDcuptLNWyc
         YpaA==
X-Gm-Message-State: AOAM5324oagBTHiW8h0DIlX5KNUNhBhj64R5Sgd9RwwtBehsXxRtgAgZ
        ZILri81CWzYeYwNCQ1Oee1MaClu8p/2u+5YycdfmnY4tEwL/YsoHSX4DVubK5H5SC89yBnKbje4
        1hOoRDeKQi3elo7+XXDmpo6CjIszwmtte53hPB4xHwO+7mzwZ
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr14016815ljf.497.1639993046245;
        Mon, 20 Dec 2021 01:37:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIkwvFqU3wYWHIgpVZw9Z5JT9qVuDKhFv5H8dQQSdjuibUG61Vez4uKkxqPYFYPyzR9oHMVA==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr14016791ljf.497.1639993046094;
        Mon, 20 Dec 2021 01:37:26 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h15sm93443lfu.103.2021.12.20.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:37:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: (subset) [PATCH v4 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Mon, 20 Dec 2021 10:37:20 +0100
Message-Id: <163999303689.14127.13377459150089115698.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217161549.24836-6-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org> <20211217161549.24836-6-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 17 Dec 2021 18:15:47 +0200, Sam Protsenko wrote:
> All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
> except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
> block correspondingly.
> 
> 

Applied, thanks!

[5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
      commit: 51b1a5729469cef57a3c97aa014aa6e1d2b8d864

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
