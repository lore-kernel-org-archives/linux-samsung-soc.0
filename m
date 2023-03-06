Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EF6C678D4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 14:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjCFOag (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbjCFOa3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 09:30:29 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F43212BE
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 06:29:58 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a25so39551912edb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 06:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678112917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmy26/h8ZpqCDoD8NgfNomf5KMzB/1KHZ5Wln1BijJY=;
        b=N8ji7KFXfBC+j6EmX58zz4T0Mun0G9IDEiu417dAjJ4IYcJ+B4mAAFxA0ufwAYMGlu
         NFNqvgSqpNDfmT5yNv9OUXR6JOI5oWH8GCVHeK/NhkxOuxRCkaL/Ia7dkUc+a6QCiTmi
         pt55dCtPI2Ehs3PcHrMCe2Fc9Ih7r13abNqs1QwoZboMKz+dqLFv9oFWz/rclDvGyLv7
         YbeVs/HXSxS96J+7SMJ4LrEOK8rsvudWNEd0bgY4NBF8Oum0zAlqS5cxCU2dg4GzpL74
         hCF4Q7Tm0QQ3S43CP3Tg89mA25A4N0eQ50djsPiTt/jIei5kxRWGf/L0JpPdTwPASdlO
         ST4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmy26/h8ZpqCDoD8NgfNomf5KMzB/1KHZ5Wln1BijJY=;
        b=nm2IUGhfF6nmSkflhVILnYiDzzE88PkyqX47rMXqiTSkxePBPIb8O62h/s62XvhxXL
         2ZdorKMrFQIOtVYOeo3r8Js/fk/FIlcyrpp0EQQ7KTY/GyhnZ+zdmWKZm0ASizrXMcA8
         7ei/83JHT70QxXKmyTakUNOOECBxLHgWE5WfyZXNWKC781wZ8Qq8FGytn85Cw5D+3s8a
         W4AHfdoKBisvIQSY9sknKCendUAH9ChXIynyRF/A8riSsWlnxcnvmvF0ohJJAbYhTWvG
         DBY1dUX75pKKVzVyptw9e/tUGo6ckooWjZ+fStCiZUMmE7h5nRkgLGHavoe7aZ2NnHBu
         s40w==
X-Gm-Message-State: AO0yUKUBS5fv7VB6wfSyDrk0VBrauaeB4pTFWiGqHnVhgbdRDufrqfho
        Sv1vGuyJsceGP1mQO6AD3KEhCw==
X-Google-Smtp-Source: AK7set84NdE45wadG7UnHcLdzGzJlGTey9l6uquHFp4z/vgUrm2BJPWiCPYKlCGcuksiJUcjHjfh0g==
X-Received: by 2002:a05:6402:690:b0:4ad:7301:fe77 with SMTP id f16-20020a056402069000b004ad7301fe77mr10117782edy.9.1678112916963;
        Mon, 06 Mar 2023 06:28:36 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id y64-20020a50bb46000000b004bc2d1c0fadsm5245545ede.32.2023.03.06.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:28:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
Date:   Mon,  6 Mar 2023 15:28:33 +0100
Message-Id: <167811290503.11716.15730246749418548221.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223042133.26551-1-semen.protsenko@linaro.org>
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 22 Feb 2023 22:21:27 -0600, Sam Protsenko wrote:
> As a part of preparation for PM enablement in Exynos850 clock driver,
> this patch series implements CMU_G3D, and also main gate clocks for AUD
> and HSI CMUs. The series brings corresponding changes to bindings, the
> driver and SoC dts file.
> 
> Changes in v2:
>   - Rebased all patches on top of the most recent soc/for-next tree
>   - Added A-b and R-b tags
>   - Minor fixes
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
      https://git.kernel.org/krzk/linux/c/067ba1605806e52118bb598afb357718df9f0e19
[2/6] dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
      https://git.kernel.org/krzk/linux/c/e289665ed0d6df9fca3ebc128f1232d305e4600b
[3/6] clk: samsung: clk-pll: Implement pll0818x PLL type
      https://git.kernel.org/krzk/linux/c/a6feedab8ab9a9e4483deb0bcc87919d92c88b7e
[4/6] clk: samsung: exynos850: Implement CMU_G3D domain
      https://git.kernel.org/krzk/linux/c/c5704a56893b4e77e434597c7c53d878bb3073b0
[5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
      https://git.kernel.org/krzk/linux/c/d8d12e0d079aff4b1d8079a0a55944c0596f1d67
[6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
      https://git.kernel.org/krzk/linux/c/ad8f6ad9a4f219950df65731a8ff91baa022c4b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
