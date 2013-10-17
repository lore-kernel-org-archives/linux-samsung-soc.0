From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for
 Exynos4 only
Date: Thu, 17 Oct 2013 18:24:45 +0530
Message-ID: <CAKew6eUFfgU+3_ezaBkdis8N_s1t+AE4Y=_z11yJLJbDPi-Caw@mail.gmail.com>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:56549 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755204Ab3JQMyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 08:54:46 -0400
Received: by mail-ie0-f177.google.com with SMTP id e14so3783239iej.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2013 05:54:45 -0700 (PDT)
In-Reply-To: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>

Hi Sachin,


> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -49,11 +49,18 @@ static void __init exynos4_reserve(void)
>                                 mfc_mem.lsize);
>  #endif
>  }
> +
> +static void __init exynos4_early_init(void)
> +{
> +       exynos4_l2x0_cache_init();
> +       exynos_firmware_init();

I think, exynos4_l2xO_cache_init() should be called after
exynos_firmware_init(),
though support for l2x0_cache_init through firmware is not their yet
but firmware_init should be done earlier that that.

Regards,
Yadwinder
