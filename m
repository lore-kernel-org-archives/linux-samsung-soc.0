Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A47FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 311E861175
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhIUIT6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 04:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhIUIT5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:19:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0841C061756
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 01:18:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q26so36623888wrc.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nNVr+7Y3y0DjrwtJDXXuwygIO9f2oy/hZH+WtVNESd0=;
        b=wh+sim1Zg6DC6668hwXycB8Dyk/tZS7ZXwtfBWceYu6QVs0o4Opzx6VZxvwiHZlAEA
         tps08+EK9AepLKtndlNIkswpBeoyg8RljktaQHSkzUiMPN4HfIvMD6bhZ8BLRWWRk6Oe
         pNcoQ4H98LXnyB6NuFzEui8UU74+9JLcvDoaoUCuNYuaUwtS8gtVkl0W600Y4K16Mpg+
         jw5fYR+Sx0OgNA8bW1H553LidGwULO43ERxbq+3mWVMA7N68xPrabyIy3JBvWMGLs7HN
         Haj7NHF93cDl7DGOq3sCTgjm8891XRki4Sujc4ZWFekx0Qs0WdlPJ8nt4VDG/R9ZWB7k
         aNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nNVr+7Y3y0DjrwtJDXXuwygIO9f2oy/hZH+WtVNESd0=;
        b=z7lfGAmNRz+5F58inMysKKpsumk/Fcqh880zuY2rpqNZndHRN0s7kbHpNGZpXdAkAb
         PKTLe6wiPm8fPfKctOxwe7O4g8l/yzFPfhm+1M+lIWmwxxjRlVgcsrKMHQkfoFKzb4Xc
         KJGprkY5w23hOesF4T2mp7BHm1IXmS6KmmWuVXN94nbGczy9xPyG8IfCVshPuD1mNzil
         0Wv0NTIypswDtbhBiP+Z74wSYqIhN2FGgCCn4Q/E7mqcgUNNlatYe0UrW1P5mZvfY7xA
         OEKPPQ82k2hsE9QjE+GifkBhPojQnZSB3zy0ztNi9xtQSazrv5MQ6Q4H56o+DbotQkhg
         OyTw==
X-Gm-Message-State: AOAM532XLBEC1t1+JA/iO2VBDY41AY4jE2JH0uQ7DyrAyxp+Gm4A6FF+
        eW1cdh2/mhBlVOBzSHNMgOgT9w==
X-Google-Smtp-Source: ABdhPJwRjVdNHhTPUc8PqFcM0ueenx5C6EDv8QgXwM59Ary8kojlg28OQkgEpgIs9zyANEgUQxxaSA==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr3173294wmc.85.1632212308066;
        Tue, 21 Sep 2021 01:18:28 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id b188sm2028749wmd.39.2021.09.21.01.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 01:18:27 -0700 (PDT)
Date:   Tue, 21 Sep 2021 09:18:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default
 config logic
Message-ID: <YUmVUSYIQ+K4UWK/@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-4-willmcvicker@google.com>
 <e178ae7b-6956-94f5-535b-067e1915c5fb@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e178ae7b-6956-94f5-535b-067e1915c5fb@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 20/09/2021 21:03, Will McVicker wrote:
> > Switching the default config logic of PINCTRL_EXYNOS to use "default
> > y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
> > This gives vendors the flexibility to disable the config or modularize
> > it in the presence of a generic kernel.
> 
> Reasoning is incorrect. This is an essential driver which CANNOT be
> disabled for any kernel having ARCH_EXYNOS or ARCH_S5PV210. You are
> trying to prepare it for some out-of-tree code? Please, upstream your
> code instead.

No additional code is required to build a generic kernel.  The only
difference would be a vendor's defconfig/fragment.

The aim of this set is to provide more flexibility around how driver
symbols can be configured via Kconfig.  Currently if ARCH_EXYNOS
(which is required if we wish to provide SERIAL_SAMSUNG as an option)
is enabled it blindly enables lots of symbols without recourse.

> > Verified this change doesn't effect the .config.
> > 
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  arch/arm64/Kconfig.platforms    | 1 -
> >  drivers/pinctrl/samsung/Kconfig | 1 +
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 6a006490c9b9..a884e5da8b0f 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -93,7 +93,6 @@ config ARCH_EXYNOS
> >  	bool "ARMv8 based Samsung Exynos SoC family"
> >  	select HAVE_S3C_RTC if RTC_CLASS
> >  	select PINCTRL
> > -	select PINCTRL_EXYNOS
> >  	select PM_GENERIC_DOMAINS if PM
> >  	help
> >  	  This enables support for ARMv8 based Samsung Exynos SoC family.
> > diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
> > index dfd805e76862..483acb8ac1f6 100644
> > --- a/drivers/pinctrl/samsung/Kconfig
> > +++ b/drivers/pinctrl/samsung/Kconfig
> > @@ -12,6 +12,7 @@ config PINCTRL_EXYNOS
> >  	bool "Pinctrl common driver part for Samsung Exynos SoCs"
> >  	depends on OF_GPIO
> >  	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
> > +	default y if ARCH_EXYNOS
> 
> default ARCH_EXYNOS || ARCH_S5PV210
> ... and update all mach Kconfigs.
> 
> >  	select PINCTRL_SAMSUNG
> >  	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
> >  	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
