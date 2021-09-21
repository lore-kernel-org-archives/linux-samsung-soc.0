Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A46C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:27:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADDF2611C5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhIUH3N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:29:13 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37038
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230105AbhIUH3N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:29:13 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5D9B3F322
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632209264;
        bh=i7xVOY9cswgNsb9rWd2OfLK5tguMPWFz/JQqL1RwXvg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=fpu66Nr+o/an5gLpapYzzKhFkdKcn5CLfLJOLjXhFkXC98La+veFRIJuYpMkyUeOk
         Li5ztGQLrIejytIQxIgmqCcrmSqFAxIqqZDSriCTzZdPs4ls4stFnEQZsaqtbX7DmG
         b3GtpkQOZnsnJ3OuVDb/sb0Zl/Qp/z8KahR4Qog3Kh26+KTditKEjblPb/6KWum4Ug
         JPmYEHfG/PsPP6dt8CzL6ZaE4OtOpfPkTRkqHCAe5lQCbiRe1V7XZ7sCjq6+zE/wTt
         ezj/ZUcNGhMJixCw6ZS5AihY6HH7dZ/vCNRTCS+h0nrlyHuF6BRIsm0LTiqMzdwBNO
         ORxy+jwzpMxXA==
Received: by mail-wr1-f69.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso8070448wrn.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 00:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i7xVOY9cswgNsb9rWd2OfLK5tguMPWFz/JQqL1RwXvg=;
        b=rpj+K0/a9QKj5pZ5hMDuBT8tJzBfFOaLbGU9fIErI7gutLmd4eb5sJxsTBqMx1hpeR
         5LdZ4oTHx/8zPkE6RFkxV+LWT9PTANVESaMeLkuYDjLeNUE8ZQAmlSztA3sYde5AonhX
         pseKWjnkCx9MpFZcBd7oWPiZLAOr7aa+aRyx5Xb3rbnL9pSgNbFff7PJGNmOD2uALPgA
         r/O/sFp3dPXnwsrJdn+V1+sZ4ibb5OCb8afGVqHtf9PJiUItaTWs18/JCLF2PZ6BDBd0
         jfJGS9yj5/gICzPxgSgAmsrzlPVYrwD1V+G2rpRjP7xQG8a57+Pktpz1EqqcgiUoz9Wv
         YTrw==
X-Gm-Message-State: AOAM532LE3wPe/jCPYPDD/ysIVo+zCKpQSvreMyJ1xg7zLXpWzAYj11Y
        9qSI99sdXQsH/zMgywNsJEDethhnGrRseow65NTKRt7tHwrVb8paylG8xuAPyeHFFfJhhz4JmDR
        eaEpGvQfTWq452L9LQI/glkPjvmm09fHEUZs3+LMm/rkM+hF7
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr33312229wrr.371.1632209264349;
        Tue, 21 Sep 2021 00:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzil+vY8RVd7ISnKg7wzJr13+3UggzlkbmenwjowhYp7j04/Gvh/nntwfWnHjrLAQD5yVbfiQ==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr33312212wrr.371.1632209264162;
        Tue, 21 Sep 2021 00:27:44 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c14sm12634040wrd.50.2021.09.21.00.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:27:43 -0700 (PDT)
Subject: Re: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default
 config logic
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-4-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e178ae7b-6956-94f5-535b-067e1915c5fb@canonical.com>
Date:   Tue, 21 Sep 2021 09:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-4-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> Switching the default config logic of PINCTRL_EXYNOS to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
> This gives vendors the flexibility to disable the config or modularize
> it in the presence of a generic kernel.

Reasoning is incorrect. This is an essential driver which CANNOT be
disabled for any kernel having ARCH_EXYNOS or ARCH_S5PV210. You are
trying to prepare it for some out-of-tree code? Please, upstream your
code instead.

> 
> Verified this change doesn't effect the .config.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms    | 1 -
>  drivers/pinctrl/samsung/Kconfig | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6a006490c9b9..a884e5da8b0f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -93,7 +93,6 @@ config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
> -	select PINCTRL_EXYNOS
>  	select PM_GENERIC_DOMAINS if PM
>  	help
>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
> diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
> index dfd805e76862..483acb8ac1f6 100644
> --- a/drivers/pinctrl/samsung/Kconfig
> +++ b/drivers/pinctrl/samsung/Kconfig
> @@ -12,6 +12,7 @@ config PINCTRL_EXYNOS
>  	bool "Pinctrl common driver part for Samsung Exynos SoCs"
>  	depends on OF_GPIO
>  	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
> +	default y if ARCH_EXYNOS

default ARCH_EXYNOS || ARCH_S5PV210
... and update all mach Kconfigs.

>  	select PINCTRL_SAMSUNG
>  	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
>  	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
> 


Best regards,
Krzysztof
