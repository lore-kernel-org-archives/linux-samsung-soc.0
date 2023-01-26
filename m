Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7F3C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 12:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbjAZMYY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 07:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjAZMYY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 07:24:24 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329444863B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 04:24:23 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id z5so1592947wrt.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pNGXCwTz1ENoQLou7f9bsrBU5EaiVdGvV9v2obRuBo=;
        b=XQqTEu19UhkD7aJwyXWepofFMTYNPVg5MUjoQokJAc8MOKKTiuCcp39R9LNPyoqYj1
         WVwVZNAZdxxSuiI/Ww/SML0loU3PMCNrsTAt1/A8HWQbhabfxjm7+XQVrxg/vsrz0emZ
         eN9S5+yCHXLWLrv1NPHwLNPqyKBslxQx4i/sMkS0fgNymEDE0z+7b6ROaQQ+iOhpLE8A
         gEfTmPlvoV7tR6RmurHTfQ+lPiURsaDE5cz03UsF7qTMl6vT7Epv9DaTtsOV/4hWq4cG
         bQhHRUo5cHLUtAqRd2E5pHE1nJw47vv5toB5jOT5J2fHIve82YptqGjqkgwv07LxVvSY
         /cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pNGXCwTz1ENoQLou7f9bsrBU5EaiVdGvV9v2obRuBo=;
        b=0C1KcG54DTUDL47zT7xDrjmr5DfKVRFjeqNP3OBwvZzk0mr/vpM72S6i0Me561enYi
         wxAmng5ZloU/ZiVE9WRvxV/Exf13WIdswAcBn851FulV7yDooxl+mu4scfpw78ZI2k5K
         3TDF0cWjr2LJhT043FLne3aDupAiwYT1AO2ViUgapTFFAoZJ9W57YQ/XaIcege5bJWGs
         +9wYp6EJXtLIa86aVIM5enlT/yvwKc6Q23T1TMnSqExKtDGgRTimXakGSm3kNEfeLZ0W
         LQEYRflLw6OkUxxXELr8UL79/KvhCsdz/rnGlKNW0QAbCdXAZ1KdIB7Zpwhl5Ro3D1rH
         czCw==
X-Gm-Message-State: AFqh2ko1m4XAi5+7ZtR13UNwQv4/oqAs1IP5PiUKW9H9Mw+bceyVwGUA
        lfTI2vAEqqo6S9n39mOLGgseIg==
X-Google-Smtp-Source: AMrXdXv1mD7Bd2DEJwqeRZUx/xVG3lQxh5SAaI5vzwvRWUvpWrdrSRZeYzUrSTRNk3c/aSYWOuwUDA==
X-Received: by 2002:a5d:4eca:0:b0:2be:47d7:b56a with SMTP id s10-20020a5d4eca000000b002be47d7b56amr23147789wrv.11.1674735861676;
        Thu, 26 Jan 2023 04:24:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l12-20020a05600002ac00b0029100e8dedasm1367125wry.28.2023.01.26.04.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:24:21 -0800 (PST)
Message-ID: <bfbff227-7a97-a45e-40b7-ed73085f9be3@linaro.org>
Date:   Thu, 26 Jan 2023 13:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/6] ARM: dts: exynos: add mmc aliases for Exynos4412
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230126103828.481441-1-henrik@grimler.se>
 <20230126103828.481441-4-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126103828.481441-4-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2023 11:38, Henrik Grimler wrote:
> So that mmcblk numbering is fixed for the eMMC and sdcard, no matter
> if a storage device is attached or not.  Also remove old, no longer
> used, mshc alias while we are at it.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index 7b4e2c442888..9625e9fe63b1 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -28,7 +28,10 @@ aliases {
>  		pinctrl3 = &pinctrl_3;
>  		fimc-lite0 = &fimc_lite_0;
>  		fimc-lite1 = &fimc_lite_1;
> -		mshc0 = &mshc_0;
> +		mmc0 = &mshc_0; /* eMMC */
> +		mmc1 = &sdhci_1;
> +		mmc2 = &sdhci_2; /* uSD */
> +		mmc3 = &sdhci_3;

This is definitely not correct. Several boards do not have mmc1 or mmc2
exposed at all.

Best regards,
Krzysztof

