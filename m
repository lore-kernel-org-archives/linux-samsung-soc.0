Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B22C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB801611C2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbhJOX2N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 19:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhJOX2M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 19:28:12 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2F0C061570;
        Fri, 15 Oct 2021 16:26:05 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q5so9897047pgr.7;
        Fri, 15 Oct 2021 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LhiUyxq7A+H9kVxdYV5M+qIQok3lfGaHZbNaXD+PJkg=;
        b=lSzU3zOUOuXMuAbaxU34Y27sQSnuIZ0/GwLcDhNpcvjsQ1aPbvG89C1lRpFQadwibH
         SCBDQ5efi1TxqUm5Qk4yzaAPle6jLspS8t9qXrA0UjDGeG3MK1Lvj6/HS42nfSYM2k0m
         zYlgz6GYcEq+BuRnpCae93DoCpGFzxN6xOJ60KVENQzlEYe4QCoElMiXnIHskG5lAuS5
         Q1HAQ3uJrrajrvmAU6l6Tb53EghU9FIB0A4owEQQpxXvM8nexNO4C6PNTA0TFyzT+Eqx
         frj7GzSPXx5bf/ZvPBRIGa9MNSpTa9uCHNLl34qIHQSrHZ1XOPTD2usCpSGE6wkRRFsO
         oJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LhiUyxq7A+H9kVxdYV5M+qIQok3lfGaHZbNaXD+PJkg=;
        b=zkLHyG5sDsagnyNgskSVWxB7Bv8JA+r71yhk1xXvr12y+Dx/srqKFd3vZ1avv0MGPZ
         di91LxN1XeHmmUF4zD1n3nzJrOMIuGNuSK+1Xtlf3UExO9MW1kMUjEz10AB+wzuV3ELi
         iNsTLQ47faxLwR3e1OiDQlkyEbovOXQA1Tpv+nFnMAFyuRAPO4npVE7R4WkCCh69QGnf
         bDSZ2VS+gt7/KLXpVjz7JZwQ6DnQqvOzXI0HWh1oIN3f1RFmuOolvUnTMtVjZ6c6TSyQ
         VXKLI1XjKdeNfog5L9gfrRslR9EBId5kZl++Mka98ineHSI8vv20hDNluFKe282/gcxR
         o8UQ==
X-Gm-Message-State: AOAM5306JxRSgqyNej3rHy9EWjW7nFitFgg+IiRYMI8PocRQ2UtwULVZ
        Fl2WnLc5pXbfTnkPxkolHPqm2fsI6Jw=
X-Google-Smtp-Source: ABdhPJxT9mLb53v7VQivWg83VXDOMUfcFkYhbL4ij/F0LK0j34YerMpZ3wdVkvqmPj+oj0j1MwmFQQ==
X-Received: by 2002:a05:6a00:2294:b0:44d:92e:1d4d with SMTP id f20-20020a056a00229400b0044d092e1d4dmr14347403pfe.26.1634340364782;
        Fri, 15 Oct 2021 16:26:04 -0700 (PDT)
Received: from [172.30.1.32] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id g14sm5417765pgo.88.2021.10.15.16.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 16:26:04 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: describe drivers in KConfig
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20210924133624.112593-1-krzysztof.kozlowski@canonical.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <2b7d43f0-02b9-1ed4-fea1-f2c360dedc45@gmail.com>
Date:   Sat, 16 Oct 2021 08:26:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924133624.112593-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 9. 24. 오후 10:36, Krzysztof Kozlowski wrote:
> Describe better which driver applies to which SoC, to make configuring
> kernel for Samsung SoC easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/samsung/Kconfig | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 0441c4f73ac9..0e18d6ff2916 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -67,7 +67,8 @@ config EXYNOS_5420_COMMON_CLK
>   	depends on COMMON_CLK_SAMSUNG
>   	help
>   	  Support for the clock controller present on the Samsung
> -	  Exynos5420 SoCs. Choose Y here only if you build for this SoC.
> +	  Exynos5420/Exynos5422/Exynos5800 SoCs. Choose Y here only if you
> +	  build for this SoC.
>   
>   config EXYNOS_ARM64_COMMON_CLK
>   	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
> @@ -79,38 +80,47 @@ config EXYNOS_AUDSS_CLK_CON
>   	default y if ARCH_EXYNOS
>   	help
>   	  Support for the Audio Subsystem CLKCON clock controller present
> -	  on some Exynos SoC variants. Choose M or Y here if you want to
> -	  use audio devices such as I2S, PCM, etc.
> +	  on some Samsung Exynos SoC variants. Choose M or Y here if you want
> +	  to use audio devices such as I2S, PCM, etc.
>   
>   config EXYNOS_CLKOUT
>   	tristate "Samsung Exynos clock output driver"
>   	depends on COMMON_CLK_SAMSUNG
>   	default y if ARCH_EXYNOS
>   	help
> -	  Support for the clock output (XCLKOUT) present on some of Exynos SoC
> -	  variants. Usually the XCLKOUT is used to monitor the status of the
> -	  certains clocks from SoC, but it could also be tied to other devices
> -	  as an input clock.
> +	  Support for the clock output (XCLKOUT) present on some of Samsung
> +	  Exynos SoC variants. Usually the XCLKOUT is used to monitor the
> +	  status of the certains clocks from SoC, but it could also be tied to
> +	  other devices as an input clock.
>   
>   # For S3C24XX platforms, select following symbols:
>   config S3C2410_COMMON_CLK
>   	bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
>   	select COMMON_CLK_SAMSUNG
>   	help
> -	  Build the s3c2410 clock driver based on the common clock framework.
> +	  Support for the clock controller present on the Samsung
> +	  S3C2410/S3C2440/S3C2442 SoCs. Choose Y here only if you build for
> +	  this SoC.
>   
>   config S3C2410_COMMON_DCLK
>   	bool
>   	select COMMON_CLK_SAMSUNG
>   	select REGMAP_MMIO
>   	help
> -	  Temporary symbol to build the dclk driver based on the common clock
> -	  framework.
> +	  Support for the dclk clock controller present on the Samsung
> +	  S3C2410/S3C2412/S3C2440/S3C2443 SoCs. Choose Y here only if you build
> +	  for this SoC.
>   
>   config S3C2412_COMMON_CLK
>   	bool "Samsung S3C2412 clock controller support" if COMPILE_TEST
>   	select COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung S3C2412 SoCs.
> +	  Choose Y here only if you build for this SoC.
>   
>   config S3C2443_COMMON_CLK
>   	bool "Samsung S3C2443 clock controller support" if COMPILE_TEST
>   	select COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  S3C2416/S3C2443 SoCs. Choose Y here only if you build for this SoC.
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
