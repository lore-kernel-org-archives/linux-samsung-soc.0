Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990E2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 11:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239244AbiDXLPF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 07:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236650AbiDXLPE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 07:15:04 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0FFDE0B6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:12:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kq17so1342804ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/poCgpgeQHKZ0kafLJZ7iBP9Nl8gQzlXb2tE2PvG41A=;
        b=ohDHGzn+AQzNfa+Ufe3IbVJ+Hy0aS+wzo+K72EPX0hPMX0m9z5QMYeUSuOK0IIKhX7
         U3IJv07tWsVfRk40LZCU2qLoWMIHB/aFWcFauz5wJYLplsMBTWblKTc/oV97hDxPBeuE
         CySybWxNjbuZThXUlHsTo1iUIhRtudEt6PYHhKvgyaXe1SWOXOHFjNhEMr4GxCu6pory
         ex+1H8edUAjPi/GlipFEzUypJeJC3/KPYtQVrxhQFIlXg2EYplZUDOeXahEqZfVuDy5F
         ziMM3ijI1qMK66wVmYbphrNaEFkOKsjLC+XaI0bjNXHX7bSnQzqQ+uhVbj14cT4WStPn
         PflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/poCgpgeQHKZ0kafLJZ7iBP9Nl8gQzlXb2tE2PvG41A=;
        b=4cxBovb64IPJnV3cq2/ayhz9QbwQx0I1YTy8QXmDw66clwZixbQWJCrWW+ltPDV+u0
         badlHJgR7LbRLGge8qA0slOzIaSTqbt1IA0AwTaG2fdWKfBo5dCWzWWQdLqkPeWuHehg
         2PZBGIMjuQWaUVx7fIwqryAdYHTmE9Eq3P2H4cabxoh658YBKNNCVNtwBaCzjVGdy/3a
         tdC5DZdyL1Jv9nMgEF+/TdAa+A8wpGd55FnUomkVUbSBJcRBDTamHHVqbs7FCDWsMnb7
         xoeOnA1e3/CshsMjTUUTluFjIWoP9G0NGuamyT8IuD2mOymWxT0pKiJpjJ6UTDMn5s3E
         fo7Q==
X-Gm-Message-State: AOAM533oqN/mHjdkGIw2IOuOJWl1vjfb/MqoMuEAOF+PnmoBOlQNVBfw
        qSLur942N0HzfSQ++pBHgHu6GA==
X-Google-Smtp-Source: ABdhPJxE5+FK9rjnAAc7wNu/qc3cAWyO2XXDHed8BuvmWqdT4x6H/PlMmGAE3d+a4v3dMK7+Nco84A==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id hp3-20020a1709073e0300b006da8c5a6d4amr12132043ejc.585.1650798722793;
        Sun, 24 Apr 2022 04:12:02 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kb9-20020a1709070f8900b006e889aad94esm2525078ejc.128.2022.04.24.04.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 04:12:02 -0700 (PDT)
Message-ID: <70db8ad7-ba2e-ac08-492c-b2117c3235e5@linaro.org>
Date:   Sun, 24 Apr 2022 13:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] mtd: onenand: samsung: Add device tree support
Content-Language: en-US
To:     Jonathan Bakker <xc-racer2@live.ca>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
 <CY4PR04MB056716B2AE01D243F6AE3C13CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB056716B2AE01D243F6AE3C13CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2022 05:46, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch adds support for instantation using Device Tree.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> 
> ---
> Changes from previous patchset
> - Adjust to having a nand child node as per binding feedback
> ---
>  drivers/mtd/nand/onenand/onenand_samsung.c | 67 +++++++++++++++++++++-
>  1 file changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
> index 62014f8d27b6..0108c8c75d5b 100644
> --- a/drivers/mtd/nand/onenand/onenand_samsung.c
> +++ b/drivers/mtd/nand/onenand/onenand_samsung.c
> @@ -22,6 +22,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/of.h>
>  
>  #include "samsung.h"
>  
> @@ -832,8 +833,36 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
>  	this->write_bufferram = onenand_write_bufferram;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c_onenand_of_match[] = {
> +	{ .compatible = "samsung,s3c6400-onenand",
> +		.data = (void *)TYPE_S3C6400 },
> +	{ .compatible = "samsung,s3c6410-onenand",
> +		.data = (void *)TYPE_S3C6410 },
> +	{ .compatible = "samsung,s5pv210-onenand",
> +		.data = (void *)TYPE_S5PC110 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, onenand_s3c_dt_match);
> +#endif
> +
> +static enum soc_type s3c_onenand_get_device_id(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	if (IS_ENABLED(CONFIG_OF) && np) {
> +		const struct of_device_id *match;
> +
> +		match = of_match_node(s3c_onenand_of_match, np);
> +		return (enum soc_type)match->data;
> +	}

This can be simpler:

if (dev_of_node(&pdev->dev))
	return of_device_get_match_data(&pdev->dev);

This allows you to put the of_device_id table in usual place, so just
before the platform_driver structure.

> +
> +	return platform_get_device_id(pdev)->driver_data;
> +}
> +
>  static int s3c_onenand_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;

dev_of_node()


Best regards,
Krzysztof
