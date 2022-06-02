Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE29EC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 09:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiFBJtO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 05:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiFBJtN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 05:49:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED05294213
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:49:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id f21so8862897ejh.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=H9LLxE4XhsYzR88vE87RJX2dSNBs98C3rMPr+0H4CIo=;
        b=ear1UnYVcnbIEAA387Qnx1UrEdzDsph0c7X/iVPbglrwc7DnqTf3Dwer9TLFDftQlV
         8X9AOO/YY8PNOv1ti7dCowFPXFaTLVT49BatCmU2tKvULStDVeTI2RZUt7veg6hY2QYC
         t15fUP2EXbDBUK8h+CBYxLm0l9NqYTFWsMHgoQSOsVsmK8SSxhtrdSj+rjDh+/Xeh9Wh
         NQWV7sA+ZUUbY/Tg1IoE8DwB+bWScktPfmWY6/NtRtXBH9YDWwx4N7U3JZKLAfvp53ju
         7s6UC1JBJ2IVdVULqhkNlzSPywvAXaXtYxnExVQK0Tw0KV3lMnVOsxaqAXkV561/Dzn5
         el9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H9LLxE4XhsYzR88vE87RJX2dSNBs98C3rMPr+0H4CIo=;
        b=jHdlkKTM8Pc5Rn6A3IlC2bL9u/Bs+MmGgDTUHKZoXmgEn1MYsMgbh5EQ61WyO+DSZ9
         06aUB7q4/WoGeRlyXhPFtDrnfQNyS2zNGE/PEAcMleo+81WRBI9/Fs3XIQtyQuDspQ7N
         H7kjLM+mZoHfJ3n4xKWtL99k3d5WgwTKOaSwcPaqhGfArgeRmBPXZ1rdZ3sePxgGLqPa
         laBTCQ+FoH6TYxGMRoyaj/xpNh1vs2GP4T52gBsXF8N3fTjlDE8s4wmMA/nmf9NsDIbV
         88H223LelB+W7DWq8sXEyfSAkie15gLy0xV+BNkNxczxb7GDaFpCK7/uzfeGjzhEKjFt
         5Kdw==
X-Gm-Message-State: AOAM532mZgvrJgz2KIe5LntP+3u/muBIseJXby5/HnINEGUUmKn0Ns24
        0FXqWupAQNyhRIdT67Z1gvZMbw==
X-Google-Smtp-Source: ABdhPJyh81mTo98JfCY7Xvx3UnXruKdEcE8zqUxZSdmYdp4arSnSPqxd7C8WP9jwtRRCH9maM/TfvQ==
X-Received: by 2002:a17:907:6e01:b0:704:8c0e:872f with SMTP id sd1-20020a1709076e0100b007048c0e872fmr3498976ejc.387.1654163350472;
        Thu, 02 Jun 2022 02:49:10 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402120a00b0042dd1d3d571sm2201866edw.26.2022.06.02.02.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:49:09 -0700 (PDT)
Message-ID: <42b8c793-caa7-e14d-0a6c-dec7aa914dff@linaro.org>
Date:   Thu, 2 Jun 2022 11:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/6] phy: samsung: ufs: support secondary ufs phy
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p19785735bcbf08ad274ff887797485b8c@epcas2p1.samsung.com>
 <20220602053250.62593-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602053250.62593-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 07:32, Chanho Park wrote:
> To support secondary ufs phy device, we need to get an offset for phy
> isolation from the syscon DT node. If the first index argument of the
> node is existing, we can read the offset value and set it as isol->offset.
> To allow this assignment, we need to change the field so the isol data
> needs to be allocated and copied from drvdata.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/phy/samsung/phy-samsung-ufs.c | 14 +++++++++++++-
>  drivers/phy/samsung/phy-samsung-ufs.h |  2 +-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> index b7ddb91a02be..7716b6dc955b 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -288,6 +288,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
>  	struct phy *gen_phy;
>  	struct phy_provider *phy_provider;
>  	const struct samsung_ufs_phy_drvdata *drvdata;
> +	u32 isol_offset;
>  	int err = 0;
>  
>  	match = of_match_node(samsung_ufs_phy_match, dev->of_node);
> @@ -324,11 +325,22 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> +	phy->isol = devm_kzalloc(dev, sizeof(struct pmu_isol), GFP_KERNEL);

1. Looks like devm_kmemdup
2. sizeof(*variable), not sizeof(struct)

3. and actually you can simplify all that by storing struct pmu_isol
directly in struct samsung_ufs_phy, not as pointer.

After all that storing drvdata in samsung_ufs_phy does not make any
sense - only one field is left still used (has_symbol_clk), so this
should be simplified here as well.

> +	if (!phy->isol) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
>  	drvdata = match->data;
>  	phy->dev = dev;
>  	phy->drvdata = drvdata;
>  	phy->cfg = drvdata->cfg;
> -	phy->isol = &drvdata->isol;
> +	memcpy(phy->isol, &drvdata->isol, sizeof(struct pmu_isol));
> +
> +	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
> +					&isol_offset))
> +		phy->isol->offset = isol_offset;
> +
>  	phy->lane_cnt = PHY_DEF_LANE_CNT;
>  
>  	phy_set_drvdata(gen_phy, phy);
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
> index 8c3696b3c5ec..d3e1c2016b27 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> @@ -122,7 +122,7 @@ struct samsung_ufs_phy {
>  	struct clk *rx1_symbol_clk;
>  	const struct samsung_ufs_phy_drvdata *drvdata;
>  	const struct samsung_ufs_phy_cfg **cfg;
> -	const struct pmu_isol *isol;
> +	struct pmu_isol *isol;
>  	u8 lane_cnt;
>  	int ufs_phy_state;
>  	enum phy_mode mode;


Best regards,
Krzysztof
