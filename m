Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E91C5519F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 14:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F3CC22248
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 14:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJ4NoqmG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgKLOgm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 09:36:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:47020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbgKLOgm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 09:36:42 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EF4522240;
        Thu, 12 Nov 2020 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605191801;
        bh=WHYTXcTXUtjwRwboz5miIMrghny91EHYylVn7bYti+w=;
        h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
        b=fJ4NoqmGeOyWwjXD8b7Lr2tKTT5JzA2E3dc17XlVg05vrINgndZkhjxWMXgtQF0lD
         ik8cle9Bp9mGXti61F6eERV1dCXp9177dTgYJaQomwNqqXm9JQdA/jM+QExPtac6WS
         q0+9DMpro+m9Hoikr5M5mVVgDselvUNDKzWDboOw=
Subject: Re: [PATCH] clk: samsung: allow building the clkout driver as module
To:     Krzysztof Kozlowski <krzk@kernel.org>
References: <20201110193749.261367-1-krzk@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <92ccc476-6afd-4be9-7c72-40c9a9218b03@kernel.org>
Date:   Thu, 12 Nov 2020 15:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110193749.261367-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/20 20:37, Krzysztof Kozlowski wrote:
> The Exynos clock output driver can be built as module (it does not have
> to be part of core init process) for better customization.  Adding a
> KConfig entry allows also compile testing for build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This needs to go through your tree due to dependencies on your previous
patches, so

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>   drivers/clk/samsung/Kconfig             | 10 ++++++++++
>   drivers/clk/samsung/Makefile            |  2 +-
>   drivers/clk/samsung/clk-exynos-clkout.c |  1 +
>   3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 57d4b3f20417..b6b2cb209543 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -19,6 +19,16 @@ config EXYNOS_AUDSS_CLK_CON
>   	  on some Exynos SoC variants. Choose M or Y here if you want to
>   	  use audio devices such as I2S, PCM, etc.
>   
> +config EXYNOS_CLK_OUT

Perhaps change it EXYNOS_CLKOUT for a better match with the SoC documentation? 

> +	tristate "Samsung Exynos clock output driver"
> +	depends on COMMON_CLK_SAMSUNG
> +	default y if ARCH_EXYNOS
> +	help
> +	  Support for the clock output (XCLKOUT) driver present on some of
> +	  Exynos SoC variants. Usually the XCLKOUT is used to monitor the
> +	  status of the certains clocks from SoC, but it could also be tied to
> +	  other devices as an input clock.

> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 1a4e6b787978..4adbf972e9f6 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
>   obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
>   obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>   obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> -obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
> +obj-$(CONFIG_EXYNOS_CLK_OUT)	+= clk-exynos-clkout.o

--
Regards,
Sylwester
