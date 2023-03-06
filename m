Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22B5C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 14:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjCFOtq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjCFOtn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 09:49:43 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DD7DBC4
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 06:49:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bi9so13106125lfb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 06:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVEoV2e9JxxVuffMnk5zPqnGKqMmb25URoKT4WzdzCk=;
        b=t3nKrmB7kfRSIyogQhjT8gbOKjIRVypqh8f6N3CY8OQiFqD3faHm6Q+6stUpmriHOA
         eRSeJBBFp0bkChLeXtzWVmChSioU/XIZ8Rv33W5cvj+wzVdQoVOsiII14lOTiA+QXHxI
         5IRErTdGCHoiDo0NYasW8SfcSaPNekqfi7ppzyH1Ykm1sjWCPgW+XIh+Hr6lW+4xaVtO
         25kI1yu5YHENgCMNQaKoWQlfgDM1TnO/kX020SHrtzguwvr02rWaeNbKo+QotBWKAp2p
         4tPVN1e9kiCtBwV5dJvge7jY06OSRbTghKUYXaFbUp2lsJoRvqg7RgHd9uGpvTxn5dFC
         y/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVEoV2e9JxxVuffMnk5zPqnGKqMmb25URoKT4WzdzCk=;
        b=UKgHU4w043ojfb+1lW4onF+3qJbt0jrYG6VCG0yYAyNSxfN0+OkGBN4Ij1wA06SnWm
         GINZPPQKKlz6Hb+mdbsgqXNkCgpgDvH5y0gLpHpZIhso9zE6REl7qTlzyhS3FXc+RzPi
         TMV4kCXJD5nZW+1+mmHewvx19/HEEZtcfLucuP/evdNbqRsFGqtX69otcOvtLZP1a9ub
         K2FxCn4yF5pxM3qkaLp/QtXjMjQP/aSHnz1OPTSjKIwbwQ+2qsvNNhw5RmDuy/KhYix8
         VHSilsxr0PwJEo2mLzndu0QcvKmSs2U/tkCqoR580mNOvo3CY8tWr8wFw2MxfB419Q9Q
         gnOQ==
X-Gm-Message-State: AO0yUKVAc7RmouIKEVZw2Zf9U3SwG7orO63Qg+ETbx/dOZ67kIUphVE1
        xgA+I++5T8LPI0gOCyvXxD6zv5HC7JmhYfF9pk4=
X-Google-Smtp-Source: AK7set+4UvM4WeEld9d1MulJogMXnAMeCG6KRrVaYnMJvULGkXtdKx6KbJfIVfvtsaFwQiGlh6VYcQ==
X-Received: by 2002:a17:907:701:b0:8f3:f976:ac13 with SMTP id xb1-20020a170907070100b008f3f976ac13mr14099986ejb.10.1678113307986;
        Mon, 06 Mar 2023 06:35:07 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id uk19-20020a170907ca1300b008cecb8f374asm4634653ejc.0.2023.03.06.06.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:35:07 -0800 (PST)
Message-ID: <7cbc24bf-6920-c75f-effc-fd9d827ca324@linaro.org>
Date:   Mon, 6 Mar 2023 15:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/6] clk: samsung: Extract parent clock enabling to
 common function
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
 <20230223041938.22732-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223041938.22732-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/02/2023 05:19, Sam Protsenko wrote:
> Extract parent clock enabling from exynos_arm64_register_cmu() to
> dedicated function.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Rebased on top of latest soc/for-next tree
>   - Added Marek's Acked-by tag
> 
> Changes in v2:
>   - Rebased on top of latest soc/for-next tree
>   - Improved English in kernel doc comment
>   - Added clk_prepare_enable() return value check
>   - Added exynos_arm64_enable_bus_clk() check in
>     exynos_arm64_register_cmu()
>   - Changed the commit message to reflect code changes
> 
>  drivers/clk/samsung/clk-exynos-arm64.c | 51 ++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> index b921b9a1134a..2aa3f0a5644e 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -56,6 +56,37 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
>  	iounmap(reg_base);
>  }
>  
> +/**
> + * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
> + *
> + * @dev:	Device object; may be NULL if this function is not being
> + *		called from platform driver probe function
> + * @np:		CMU device tree node
> + * @cmu:	CMU data
> + *
> + * Keep CMU parent clock running (needed for CMU registers access).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> +		struct device_node *np, const struct samsung_cmu_info *cmu)
> +{
> +	struct clk *parent_clk;
> +
> +	if (!cmu->clk_name)
> +		return 0;
> +
> +	if (dev)
> +		parent_clk = clk_get(dev, cmu->clk_name);
> +	else
> +		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> +
> +	if (IS_ERR(parent_clk))
> +		return PTR_ERR(parent_clk);
> +
> +	return clk_prepare_enable(parent_clk);
> +}
> +
>  /**
>   * exynos_arm64_register_cmu - Register specified Exynos CMU domain
>   * @dev:	Device object; may be NULL if this function is not being
> @@ -72,23 +103,11 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
>  void __init exynos_arm64_register_cmu(struct device *dev,
>  		struct device_node *np, const struct samsung_cmu_info *cmu)
>  {
> -	/* Keep CMU parent clock running (needed for CMU registers access) */
> -	if (cmu->clk_name) {
> -		struct clk *parent_clk;
> -
> -		if (dev)
> -			parent_clk = clk_get(dev, cmu->clk_name);
> -		else
> -			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> -
> -		if (IS_ERR(parent_clk)) {
> -			pr_err("%s: could not find bus clock %s; err = %ld\n",
> -			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
> -		} else {
> -			clk_prepare_enable(parent_clk);
> -		}
> -	}
> +	int err;
>  
> +	err = exynos_arm64_enable_bus_clk(dev, np, cmu);
> +	if (err)
> +		panic("%s: could not enable bus clock\n", __func__);

The error handling is changed and not equivalent. I would say that we
could still try to boot even if this failed, so kernel should not panic.
Maybe the parent clock is enabled by bootloader.

Best regards,
Krzysztof

