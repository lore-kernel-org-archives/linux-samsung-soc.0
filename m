Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C22C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD0C9611C7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhIUHKe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhIUHK3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:10:29 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFFAC06175F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 00:08:49 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d6so36025984wrc.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cyc6wAvsiYvYVdHCei88zIBgag7U9mJqxcUyH3r1CWM=;
        b=EQ6/tvjLOGJ2R/hFuNnnTCnC3AcN5Ge1Dz3gKT8j2pYOuibo305AQJBZ28DeSmOwey
         kgy2cyVUs/8oOsaprC3nuq2fBpukx47phqrIvU2glPkoMWq6t2gzOWSs0Mn+9RwHiJN+
         lwvpXENzFUrZYGWwtwbWjOxPsO5d32qtFdDIca8DcC8yUYzTKLm63eiTUO0iUM/NkMiG
         OzuWjrwmGZWqvOiP7z+RCa6OI/vzA19wb+zFsyJeiYrIVOOEepCGECJ4jmHQ61b9k+8p
         pATfcSEH8tYyMdeTvkMn76kTisaNd4zYTqVyTA7j7Ir+87DSM8yr6SBWe01TN3GpzQ+T
         VlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cyc6wAvsiYvYVdHCei88zIBgag7U9mJqxcUyH3r1CWM=;
        b=mEyS/feHq0pJNmwy3Zvt4pF1op7P9sO302hLlEYkr1cy+VFjRXu1P/flgnKjzMCYQ6
         WGTizgD/2G81sP/9G6Y/fGp1SmH7U8S5s/JNVDKFJnrN//O8risYw1qUxEPKjK4oyUxu
         vl3ZNYt60O9aMJ00hAuBR9C7zt/nmfZwfzNZWzmzzomRnZaNzGm1uitFzn7492lG2gHk
         cA3QiXeg9u1hnJ0gh2eWSmxDN804pQXSp/pMDjCdZnwxV67DmeACSdVrcEFuSbvQ84Sm
         SKmc7kzBNr6ktHHqzRkmej9Q5/2ZDPYIpRondL4biJbGBxDjHQfpP8UEeQXi9G9FPK5i
         hSNg==
X-Gm-Message-State: AOAM532Kv1Ly3EMrxDI2CRB4GF3AXAKEyLP8nTBua3/iDktvT2svw5X8
        YXL57ZAe9e62WYeE0HFj8RHPHp9lHed7mA==
X-Google-Smtp-Source: ABdhPJyPQ/o1Rh01pdww1XQiFIlGSq+2ub4xW3Lao90e3fivXN469GPYJVCY/MaD/ditL/22MZeDcw==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr2886271wmc.14.1632208127619;
        Tue, 21 Sep 2021 00:08:47 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id g22sm1654479wmp.39.2021.09.21.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:08:47 -0700 (PDT)
Date:   Tue, 21 Sep 2021 08:08:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <YUmE/LqlFCiongfn@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Sep 2021, Will McVicker wrote:

> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> a handful of drivers without allowing the vendor to override any of the
> default configs. This takes away from the flexibilty of compiling a generic
> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> modularize these drivers out of the core kernel in order to share a generic
> kernel image across multiple devices that require device-specific kernel
> modules.
> 
> To address this without impacting the existing behavior, this series
> switches the default config logic for the offending configs to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
> verified that these patches do not impact the default aarch64 .config.
> 
> Will McVicker (4):
>   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
>   soc: samsung: change SOC_SAMSUNG default config logic
>   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
>   rtc: change HAVE_S3C_RTC default config logic
> 
>  arch/arm64/Kconfig.platforms    | 7 -------
>  drivers/clk/samsung/Kconfig     | 1 +
>  drivers/pinctrl/samsung/Kconfig | 1 +
>  drivers/rtc/Kconfig             | 1 +
>  drivers/soc/samsung/Kconfig     | 4 ++++
>  5 files changed, 7 insertions(+), 7 deletions(-)

For all patches in the series:

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
