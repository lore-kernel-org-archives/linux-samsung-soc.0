Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548F4C64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 11:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjBPLCn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbjBPLCm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 06:02:42 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F41EB5D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:02:41 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id dz21so2160433edb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea7TLkXH9nH4DA//1th+Z+4aboDPChuuD0jgIfj0RCw=;
        b=H1baVUnJRcg8cDc1YjHMX5yBmKVB2yuz7kOfaFXzi2M87JnaU3ZH7ZFmSYmqmioNiY
         L5NydmwgfDVfi1bon2+jot0meHsl3BYpV0o2/eQzfEdy63bOv+s7f/422AoDnb9kyF9Q
         GEMIr23IMOsksGGdtc9KoJqd/GvjHE8QZhQmWg8Txwh7mw/mSa2IGdir2zCRa5Yt69Nk
         Y05jarUZjiTC7KJNHqNBgyFRB+u4B5v9oPTPb+tYqojbfLU2fiJ09sgyhDe8CS/TMem8
         3Apo17N1y0wFe10mh038/JL0BG9nlzeD9e9OWHtVG+Q0INccnlCJgj83B6fsBqGjpvOd
         H3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea7TLkXH9nH4DA//1th+Z+4aboDPChuuD0jgIfj0RCw=;
        b=IBEPWhlmfknveXrSYk2jp5I0dJmlQ4kitJGYIZnbXKd5o5ISgmL3D0S9pO4brvyV8A
         8CHY4xnY/90FMrKrie+zYG7A0IXlE8D+ySYRDVroRY58mztswDEPgBUAME/RPxcmKy0d
         3mK2i7wQeT2cxHuwJlHHdkfSjW2IRvjU58PEqSbD7ZDI2PHwWEM7o8xQlF9zCwF9waPK
         ylD5IUKTLO4srUVpj+N30aCmIp7Q924tOpo2wmr8c5JczR/T3saWEqoxHatPmM6p8e+t
         CfSjO/r9Qlt0djDWX/PfyzHmAy2uKGYFzPz3BmnwiLgody9yAPkAuhwE/ybo/TDiCPqG
         AoZA==
X-Gm-Message-State: AO0yUKXfbkT2W6W6JgSv2r7Wy6ECjHx/3ttPI1Zinh9Ih21CqqfmajVW
        dmdGbFbhVjqZuz1/t1gCspd37w==
X-Google-Smtp-Source: AK7set+G0Y1PwG7+QRividE03emGpRaIuD1Nl9H0Z7JGdPW6YUb7ULVXwZn1OpLNIQkPqQB9Ggh7Pg==
X-Received: by 2002:aa7:d846:0:b0:4ab:4c2f:a449 with SMTP id f6-20020aa7d846000000b004ab4c2fa449mr5010022eds.20.1676545359538;
        Thu, 16 Feb 2023 03:02:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004acc1374849sm669369edi.82.2023.02.16.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:02:39 -0800 (PST)
Message-ID: <649a8d88-0504-5aa9-d167-d25d394f3f26@linaro.org>
Date:   Thu, 16 Feb 2023 12:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/16] PCI: samsung: Use clock bulk API to get clocks
Content-Language: en-US
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121420epcas5p3a4419059969adfb45b379f7e7741968c@epcas5p3.samsung.com>
 <20230214121333.1837-5-shradha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214121333.1837-5-shradha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/02/2023 13:13, Shradha Todi wrote:
> Adopt to clock bulk API to handle clocks.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/pci/controller/dwc/pci-samsung.c | 46 ++++++------------------
>  1 file changed, 11 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-samsung.c b/drivers/pci/controller/dwc/pci-samsung.c
> index cfe384aee754..6c07d3f151be 100644
> --- a/drivers/pci/controller/dwc/pci-samsung.c
> +++ b/drivers/pci/controller/dwc/pci-samsung.c
> @@ -54,8 +54,8 @@
>  struct exynos_pcie {
>  	struct dw_pcie			pci;
>  	void __iomem			*elbi_base;
> -	struct clk			*clk;
> -	struct clk			*bus_clk;
> +	struct clk_bulk_data		*clks;
> +	int				clk_cnt;
>  	struct phy			*phy;
>  	struct regulator_bulk_data	supplies[2];
>  };
> @@ -65,30 +65,18 @@ static int exynos_pcie_init_clk_resources(struct exynos_pcie *ep)
>  	struct device *dev = ep->pci.dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(ep->clk);
> -	if (ret) {
> -		dev_err(dev, "cannot enable pcie rc clock");
> +	ret = devm_clk_bulk_get_all(dev, &ep->clks);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
> -	ret = clk_prepare_enable(ep->bus_clk);
> -	if (ret) {
> -		dev_err(dev, "cannot enable pcie bus clock");
> -		goto err_bus_clk;
> -	}
> +	ep->clk_cnt = ret;

I think this misses check if you got two clocks.


Best regards,
Krzysztof

