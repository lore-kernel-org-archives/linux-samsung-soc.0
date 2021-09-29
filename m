Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF7FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3ECB6140F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245091AbhI2OCe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:02:34 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57284
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244902AbhI2OCe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 10:02:34 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B02E402D9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924052;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=XBqUfQNOkq3WF6MM+DkreoMmObA2ZAfxxt2Q5j78sc0b/bSrtRreGWzzl/QdNv2X5
         OA2AECTCUu9wJOJ/qHNK/D9ZMqU9tQYCab6Ob2Zb7jxxajO9UWzSbHNpYGLi99IQ8d
         e/0qwEfO6fPFHsY2QmVCcLEBN7ZwubR2CMe3H/3+InhFHSLVLOuIE9b6cOrlZ9dOzC
         TwphTszyTMC62kfOKjsrBLyXS8UMXdfrP7MF17lRsY3P5RTpcA7hgH1xvSkWa4Xroj
         0hNnS+t+/zGGH4M1grpjfV+s17noVmh3gqrYAvA1Ph2xkTCos99pCL/SiSygdCLVP0
         AArbxt9X/KQ4Q==
Received: by mail-lf1-f72.google.com with SMTP id h27-20020a0565123c9b00b003fca9e11144so2436571lfv.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 07:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        b=A87V+Qgm7jWdvVV5DGeutUaiNOZALZa9Iu53TNqypXNIwrFtk6Ak3qAipYuvZdjLaE
         w4OOqfs2+3GUU6qQRl9FK0osRAjbGnpl8U4OUY+f5kceT7lfUod30lBgFkdNLg5cjPf6
         2LuL5amYQfRSHD27h3al2SE0HW8OR2vevs82Gakz0+ItmzAAc6Nyh99DUdnpUAyFLgIf
         8QRCcnRb/ZmUXB7vX1hRu7AJD6Nx73pxT+/uPAlD7iWhGpmk7EnCNE+a9tm9miE9C2Z5
         LedkBdH6kBexT7YNQGj4OsR743r6WnlpZpnElWxSy9AhFU1fZV/F7nYkmc+NXcSMhHZd
         6fgA==
X-Gm-Message-State: AOAM533wXqyHMl9wTuXuydIM5r4FzDYfoSrZhx3dHRoez8eKSfvULOen
        k36ELZXBb/ngas1/4L/M/qD1TSQe/TnyOUJ/Sp7nCmOK/6k27kb8YM0DaDi0yfFHwPJTueDQeii
        1kmemGhTC/evhS53umHcJfZlR0RvJu7vVuN4DGkT0b9XDQ5Gj
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115759lfu.398.1632924051600;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcRnIuhOY7CK9oDbVjvF9edjRx8oUhEpxRb6E1YojrS2Sfi3b7BVTyNWXrzfXxMSAityt0PQ==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115725lfu.398.1632924051401;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id 8sm763ljr.10.2021.09.29.07.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select
 EXYNOS_CHIPID
To:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-2-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3274ed53-6058-323f-be3b-a90de479183c@canonical.com>
Date:   Wed, 29 Sep 2021 16:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index b0ce18d4cc98..90c5cf4856e1 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -92,7 +92,6 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> -	select EXYNOS_CHIPID
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
>  	select HAVE_S3C_RTC if RTC_CLASS
> 

This actually should be part of my series converting ChipID driver to a
module:
https://lore.kernel.org/linux-samsung-soc/4aee1b0d-91a1-75ac-d2b7-6dab3d7a301f@kernel.org/T/#t

Applied it, thanks.

Best regards,
Krzysztof
