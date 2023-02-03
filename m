Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD15C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 09:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjBCJOb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 04:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjBCJOb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 04:14:31 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4C08E48F
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 01:14:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r27so214935wrr.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Feb 2023 01:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zELjtTV++XT/mjyQzI4eKCIMRauhqYz1Nswt+m/xsqA=;
        b=mmPR3kx7UEfHJC//Zhap+s1dXSy6OV3TOeDHh94XUTQQmu4a6MifB/hHb3+B8e+w4+
         FSQ+OaXhK35emD0S85DCCQNyOnCLXlh/SA2IfHg6e3i3Gm8gdWaf1URBGcNqcEpe1j0u
         RDNJ9N7srAEF3HAS7Q1E24mFyiuvLNQz2rZo98Z0nYFOwo4WZWCRbjM/T2Rwj7xPv8GP
         7DMWL0hDOTs4pP9wYyvAlZ+r67eCt6+gluq+FHQ10g93KsCnJq5nKKBnie7uLrd9EWl4
         LgkqktVSRK1hL/HmanJa0vVcUtiKy7rVFEaPbY+KhD9WOEOBJ749Q94G2Ln/ErGF0NKW
         CcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zELjtTV++XT/mjyQzI4eKCIMRauhqYz1Nswt+m/xsqA=;
        b=v0XBCPJ0N1H22E4COU10I4LyKe5cgX0VZfZVeIwfPfczwxxHQWiSnPg/KXEA5hfxFN
         Ytd4xCFQfgqrZQX8uEUly84LlWGY01UJ2betNsqjRXJ5Kdg+jNv2VdLE6L73Pe3Gff3P
         sOpgkAehz5P5Ytkx3O+Bx/1Qn/Om8wcWmTp3AxhscBSM+mDhwZqB6GxZa/BxM05A/vV5
         AZ0ZqmZyct1DRbYOBCXDU2JTEgsBiGV2t2zShxQNfSDohcGwHZ6oJw0ALesrVmVJDSvF
         TYbCH3ue35V1UpB7Mvt57QlBxJIKTn/T4Wa20IwbrTzerSnxkjsFSonpdXa4XiFnHN9E
         /6JQ==
X-Gm-Message-State: AO0yUKVSJapyCMgkr86aqOAYMzMOTeHQnHvoUKwT1qmAiPF66l/MEOq7
        lvCqmd3eT1+MzYrwZmeDmOW5SQ==
X-Google-Smtp-Source: AK7set87oB2xxUxR9AcQ7XrTUysuuK4UHjaKNMwCvPHLV1g1gyq7Z417h5UXoUYnn80RIACYH+l6Iw==
X-Received: by 2002:adf:fc88:0:b0:2bf:d940:29b6 with SMTP id g8-20020adffc88000000b002bfd94029b6mr8415191wrr.54.1675415668346;
        Fri, 03 Feb 2023 01:14:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d8-20020adfe2c8000000b002bfe08c566fsm1510325wrj.106.2023.02.03.01.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:14:27 -0800 (PST)
Message-ID: <03eeacfb-22ff-8224-30d7-6c187b179fd7@linaro.org>
Date:   Fri, 3 Feb 2023 10:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/6] clk: samsung: Extract parent clock enabling to common
 function
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
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
 <20230203060924.8257-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203060924.8257-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/02/2023 07:09, Sam Protsenko wrote:
> Extract parent clock enabling from exynos_arm64_register_cmu() to
> dedicated function. No functional change.
> 
> No functional change.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos-arm64.c | 53 +++++++++++++++++---------
>  1 file changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> index b921b9a1134a..361663223a24 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -56,6 +56,41 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
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
> + * Return: 0 on success or negative error code on failure.
> + */
> +static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> +		struct device_node *np, const struct samsung_cmu_info *cmu)

Align the arguments.

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
> +	if (IS_ERR(parent_clk)) {
> +		pr_err("%s: could not find bus clock %s; err = %ld\n",
> +		       __func__, cmu->clk_name, PTR_ERR(parent_clk));
> +		return PTR_ERR(parent_clk);
> +	}
> +
> +	clk_prepare_enable(parent_clk);
> +	return 0;

You do not check the return value in exynos_arm64_register_cmu() below,
so either make it a void or add the check.


Best regards,
Krzysztof

