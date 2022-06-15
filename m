Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C27C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Jun 2022 13:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbiFONpH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Jun 2022 09:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244665AbiFONpG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 09:45:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA4A2F031
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 06:45:05 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id o6so10468368plg.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TU7ppchr+vK4iQFEEkHyhNO3qYqSud0f/b8Qfi4fncE=;
        b=P4lnu4PmKUs1hCeHvGYVFBJYqh0FxWE38HhkOsolR7DTsCZOW+2TyjdP+mV+jMtb9T
         FQ/p8lpV2rBPj95AOnT8PFfTbyfL6o6RyTA1MztbW+BhEAdOx55slpKuJ94f+cV6iT8q
         hFzf9dgkBd+ZZoOG1Cvs9MDvKwHQTmofmR3v+cL/L5+J0hmGGHfve5WDEDY8zYSvTVA0
         o1hyzHcr5FaE9NGt3ot1Zemqv5eTeIv2uQXszG07S+1rw8OL1qUQR37lDbscCAZgcIf3
         7LB4MO7Uj82e983wOHqE+d/9jvmqvd+XYCbtDfQsAebY9IoQIdDvuM0KWMado7LgUsRy
         luAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TU7ppchr+vK4iQFEEkHyhNO3qYqSud0f/b8Qfi4fncE=;
        b=U+WkWPIGE3LfQv9fhtE8iEKTsVATe066xKvfggpJ7Yu226/5gEz81f2yJsHf3TEsSw
         V4I38PP9MhgCH80aApqluvfCSubOsdmUnY+IpByI7SDP34Ns1d0lpSgeSDuYItRiWy5q
         5aiiI+o4cy0kZnUp9DuPDpNXy2tVfZoHwi67gyKvSUn1Mlln1QPVzGaHWhm1+kpYxig9
         Qvc58AZnkau8CiVKu+Y7N5PpJg89A5UlkE/OIujPsIX92S16htvk9FAYawoHek5ucbIN
         nosOVhlIPm0gE3bcTzHnGoYsC1k1tf89PyBLctDyX8AkDXlPmkhZ+/aNdkvjfE9Ctuww
         iC3g==
X-Gm-Message-State: AJIora+9Y2IJdCnsfZ4gfgQ/uYscYRCFZyAixR10jBpaw8fOi3IAMDMW
        eO2XKq7v5yvYkvOftoTGFGpLmw==
X-Google-Smtp-Source: ABdhPJx0T+YdeF+d3X92Xyp5Jiohtxc6kV2ZfTAC3PYSZ9oPTWeOvMnxmENVDIdLhvWiI9IlcP/kjQ==
X-Received: by 2002:a17:902:7483:b0:167:cfa7:ff3d with SMTP id h3-20020a170902748300b00167cfa7ff3dmr9540876pll.61.1655300703882;
        Wed, 15 Jun 2022 06:45:03 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id l13-20020a62be0d000000b0051ba90d55acsm9843057pff.207.2022.06.15.06.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 06:45:03 -0700 (PDT)
Message-ID: <ae8812a8-5f31-1516-74c4-cb427740fea2@linaro.org>
Date:   Wed, 15 Jun 2022 06:45:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] soc: samsung: Add missing of_node_put in exynos-pmu.c
Content-Language: en-US
To:     heliang <windhl@126.com>, alim.akhtar@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220615085525.3961330-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615085525.3961330-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/06/2022 01:55, heliang wrote:
> In exynos_get_pmu_regmap(), of_find_matching_node() will return a
> node pointer with refcount incremented. We should use of_node_put()
> for that node pointer. We need a similar code logic in the function
> syscon_regmap_lookup_by_compatible().
> 
> Signed-off-by: heliang <windhl@126.com>

Please use full first and last name. It might be that transcription of
your name to Latin alphabet looks a bit different.

> ---
>  drivers/soc/samsung/exynos-pmu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 732c86ce2be8..a44862c405a4 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -108,9 +108,13 @@ struct regmap *exynos_get_pmu_regmap(void)
>  {
>  	struct device_node *np = of_find_matching_node(NULL,
>  						      exynos_pmu_of_device_ids);
> -	if (np)
> -		return syscon_node_to_regmap(np);
> -	return ERR_PTR(-ENODEV);
> +	struct regmap *regmap;

Blank line here.

> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +	
> +	regmap = syscon_node_to_regmap(np);
> +	of_node_put(np);
> +	return regmap;
>  }
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
>  


Best regards,
Krzysztof
