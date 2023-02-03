Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA46AC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 02:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjBCCwh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Feb 2023 21:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjBCCwf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 21:52:35 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299BA234C9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 18:52:34 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m2so11695427ejb.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luv07tBojTy7MY/o/x6jvDqHfjxZ27LUynL/zLyVKVU=;
        b=qRqNR8+nyEtLHlZsejQjsKv1LXzYBM9Rw+XvcEOL2I9GdUGMFq474nl8SljoN3hJD0
         4PagynT8yAuquNNgWmlcGwxzp8XPIZ4smQqcy9NueLPNKkCY4xAZP8tClgdbmh4KwFRB
         x2nscpp2uaBVoOT8z17atSE3o2M+TkTzYS2y+LIth93HBoxfq0hn5sW4pCz24ymSgzif
         IxU12SzVyauGvn2FU8Hv3Du6+qJLnRPMEdNh6UwbMYNpYjxiPjhFGeQb2pEu6e6v2uEb
         wyYJP8Kori99MNH+4DigXEknMfzoMObOUzT/NS/5IQ0QDmvDDML+DaQPpYSo/H7em8+z
         1V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luv07tBojTy7MY/o/x6jvDqHfjxZ27LUynL/zLyVKVU=;
        b=2hCeic+SsoWIoBBOkLgbIX5PBqJKioRxw/MOZqPOEcyrruMI4jeEOrbbmpVD+JJGtK
         Ct9S6iJ2F3UsIwu5xfEG5dGrSTW5DSw6sEzVQJG0usqdP9DYyU26oIczB0zxpJhdy5Yb
         IMaomqnpkupvy6CDFOZ4uLIYuSOLq22R7tpw3G3ng+9a9z3X9yZUo82QMrVJ62ZyYlas
         MWl3taURupx1oBvyCwc5CuXKf4S+s6P5kX6su3kiijC9IMedFH/WMAWAN/VQJKiLzp3f
         bymUsRYF5adylEhca1GbfG0P/618VbdRsUGISGG/KboJb7KaGpEKU7qvKZmYMmmYmFPr
         yDqA==
X-Gm-Message-State: AO0yUKUTXmlVbuj49mJQGoo/WQd5QGfjUa3KuCZMsn6V3ONxQYu4ZdJt
        5aMxrPWKN+XedSCdrBXGAglx6w==
X-Google-Smtp-Source: AK7set+2Q+lIS7/A1H+HmFJ2+W4s8LEh9MtAQWMxacurGlMZL52NZgqFm+ulHrvoRV0ikL9R7NN3aQ==
X-Received: by 2002:a17:906:261b:b0:887:d8b0:27c5 with SMTP id h27-20020a170906261b00b00887d8b027c5mr9757802ejc.52.1675392752756;
        Thu, 02 Feb 2023 18:52:32 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id rn26-20020a170906d93a00b008845c668408sm655770ejb.169.2023.02.02.18.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:52:32 -0800 (PST)
Message-ID: <3e46ab75-9b46-415e-0585-29523c5277b1@linaro.org>
Date:   Fri, 3 Feb 2023 03:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 06/23] interconnect: qcom: rpm: fix probe child-node error
 handling
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-7-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> Make sure to clean up and release resources properly also in case probe
> fails when populating child devices.
> 
> Fixes: e39bf2972c6e ("interconnect: icc-rpm: Support child NoC device probe")
> Cc: stable@vger.kernel.org      # 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/qcom/icc-rpm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index df3196f72536..91778cfcbc65 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -541,8 +541,11 @@ int qnoc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qp);
>  
>  	/* Populate child NoC devices if any */
> -	if (of_get_child_count(dev->of_node) > 0)
> -		return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (of_get_child_count(dev->of_node) > 0) {
> +		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +		if (ret)
> +			goto err;
> +	}
>  
>  	return 0;
>  err:
