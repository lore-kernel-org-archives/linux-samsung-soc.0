Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E27C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71B0B6138F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhJTQHB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhJTQHA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 12:07:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F9AC06174E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 09:04:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j15-20020a1c230f000000b00322f53b9bbfso1251504wmj.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6LK3dgO19Er8A0Vy4HuLuhd8am1JO5JwDs4yYmEsMCo=;
        b=tGO2NXmyYBwerSCN1mWMRMkZqppRDAJWppgejQTRXFqjUCOOoVZInPDt/Z/v5CqTwH
         17M6dBOHDGrlNzPZ7qwbIZSAMToixKv1isD01pR/2CjNf2/PVFSAt77d77QGNuSK1FTk
         JMclBtzWNiSg5nCgYEliLj9xYQCXccmeaRETE/nom/EgpuiRyRyiDai87z0GDsdn/Ed+
         7abMC8TglZiLM1muRh5D50kqVK/z4vV1lfhdl+X4Q6mBwSOsVkAs1gkX6sn54O/1VFIi
         0c31BVO/Ak/Ku2he2II+yThklRSRsMt9Q6tduehVhmQOciHNNXYsO2QZZg8lbYOW9ntC
         itvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6LK3dgO19Er8A0Vy4HuLuhd8am1JO5JwDs4yYmEsMCo=;
        b=kVqrGuVLsVVIG/sHzsWSdVYRwjRRq2603zjdJMxhA8QpvUdk1chPpXPxdpoc5Ic0h1
         SGqNu/DFK0dgm0oQST2k+pWvI9UglTBeLDj2z4Aj1AYL2TjaptfMA9U16oFQDrGIUgtA
         yfW8DC495UAXp6xHzFnGnL0o2wZujJXON744i64LZLTfCS+F3UjeeN4uovigO9l/vSnA
         YrLLQPWPxmdtv9N8bW+XnF3A59FBf/W8g0I0iXWnYcIuiJj4l4DzG92bBgPmuARbCs4Z
         IpMGntBtW5hlJdFvGZu8hbeJWKNww4t81K+GsD8pimQa5mqMSuUxbPbMi9kG+0Qo2Bhl
         +nIw==
X-Gm-Message-State: AOAM533mvg5FKn5qcRuUwm/FCmrhc9jd14g0Db2diovfKyJxe8tWXO1i
        r3rmzV+tfTf0Kx7E/S3j37Hs9Q==
X-Google-Smtp-Source: ABdhPJxKzqGnu0kt8uL8SHSZ9aX357bKN0VD4bfSXdYMzAhgxn6H1uxkKKKo97ooott+OzBeU6J+eg==
X-Received: by 2002:adf:c986:: with SMTP id f6mr138627wrh.216.1634745884615;
        Wed, 20 Oct 2021 09:04:44 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id g25sm2433383wrc.88.2021.10.20.09.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 09:04:44 -0700 (PDT)
Date:   Wed, 20 Oct 2021 17:04:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YXA+GoTf6u/Y4qLX@google.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 06 Oct 2021, Krzysztof Kozlowski wrote:

> Hi All,
> 
> Changes since v2
> ================
> 1. Add Rob's tags.
> 2. Remove "regulator-name" from properties (all regulator dtschema).
> 3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
> 4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).
> 
> Changes since v1
> ================
> 1. Drop DTS patches - applied.
> 2. Fully remove bindings/regulator/samsung,s5m8767.txt .
> 3. Minor subject reformatting and few typos in text.
> 
> 
> Intro
> =====
> This patchset converts all devicetree bindings of Samsung S2M and S5M
> PMIC devices from txt to dtschema.
> 
> It includes also two fixes because later conversion depends on it
> (contextually).
> 
> 
> Merging/dependencies
> ====================
> 1. Regulator related binding changes depend on first two commits (the
>    fixes), because of context.
> 2. The mfd bindings depend on clock and regulator bindings.
> 
> The fixes and bindings changes (patches 1-10) should go via the same
> tree.  For example regulator or mfd tree.
> 
> Another alternative is that regulator patches (1-2, 4-6) go via Mark who
> later gives MFD a stable branch/tag to pull. Then the clock and MFD
> bindings would go on top via MFD tree. Or any other setup you would like
> to have. :)
> 
> 
> Overview of devices
> ===================
> Essentially all Samsung S2M and S5M PMICs are very similar devices. They
> provide the same functionality: regulators, RTC, 2 or 3 clocks and main
> power management (e.g. power cut to SoC).
> 
> The differences are mostly in registers layout and number of regulators.
> 
> The drivers are built around one common part, mfd/sec-core.c, and share
> some drivers between devices:
> 1. MFD sec-core for all devices,
> 1. one clock driver for most of devices,
> 2. one RTC driver for all devices,
> 3. three regulator drivers.
> 
> The regulator drivers were implementing slightly different features,
> therefore one regulator binding for all devices does not make much
> sense.  However the clock device binding can be shared.
> 
> The final dtschema bindings try to implement this - share only the clock
> bindings.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (10):
>   regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
>     is disabled
>   regulator: dt-bindings: samsung,s5m8767: correct
>     s5m8767,pmic-buck-default-dvs-idx property
>   dt-bindings: clock: samsung,s2mps11: convert to dtschema
>   regulator: dt-bindings: samsung,s2m: convert to dtschema
>   regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
>   regulator: dt-bindings: samsung,s5m8767: convert to dtschema
>   dt-bindings: mfd: samsung,s2mps11: convert to dtschema
>   dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
>   dt-bindings: mfd: samsung,s5m8767: convert to dtschema
>   dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies

Looks like these are ready to be pushed.

However, I am not in receipt of patches 1-2.

Am I okay to merge 3-10 right now?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
