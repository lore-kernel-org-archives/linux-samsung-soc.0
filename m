Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 11:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbiDXLKA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 07:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239245AbiDXLJ7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 07:09:59 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1AD13CFE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:06:57 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id be20so7016928edb.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BQJA6nUIX5U8cWUg1zwc+QJKGausv/CFbILnPF0Ez2M=;
        b=TiCFeXCR158jGe6MgSNvATJdfqEPW4ddk3h387Z22CrWXLZTZMawq+LxF3P1K1ldzU
         FGqnsxoO/YsH3LHfMOovysGhCjJeV8L8yH/a0BJFFkHgbGqJuPwW4mg6nvkDPoqU1poO
         u1JBQjwUTuNk18BM3qCnUAFZr2zi9Grv3cjopkwd2j4Yojdkmbq+UsmoOZ6B+vastz+P
         XMrKwMPEA7YJiIrufMAauMs1TngHtNDAyPwe3ElxmUyH88A6lI5k0WbCX09m54jr1jJy
         sHixjchVXt2RvgZOHDcL0eCQsHmD+/K38l6EfHDub4NqTX7a2+xz6xYAeSNhefZNIIty
         E27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BQJA6nUIX5U8cWUg1zwc+QJKGausv/CFbILnPF0Ez2M=;
        b=MDZko3SOh8qL96AEE3eRbLQidBJPX3grnFtVWHJLyEPyL9E9VNprBk9Mh+Ov7Pyf/v
         BFkBKBGVlD+6xXLXgzKE4rmmCbTgayAHXD/OYax63lUuIiYuZcVdD4peszLIcOCug2fO
         o/+Whys7QGxjuX88ekBsgwnRAWNFgSv/uo35uRLV0dxFOAq2BrU+AVcy7Mm6YOVPbktP
         ocLR/DCBkP/unQFePCkBdsAbyFzKnNgb03UL3aOLmmVq9gM9oP0l/f2mpV6ZxTeRH3w3
         4IsywQBT6U2v1h5SPSUa4f1S6rvluFxXiNii8Lwz0h+bowWSeacch3FF3GDNHp+B5Tbn
         v9+Q==
X-Gm-Message-State: AOAM530Tt+EYU10rrkbhXEE80OHxfqZqakI7upM4oRhG3UJDIw6piGqw
        zQSDfss6UPRoLA/Xxbk2A2HBhw==
X-Google-Smtp-Source: ABdhPJx2FujwjBjsDsEU5lcXcSAtwi6HcCA5hKnVSEAerKFX/UGVfUzJowK5cbQEk40H6/uJKn4qiw==
X-Received: by 2002:a50:d707:0:b0:425:e37d:4ef3 with SMTP id t7-20020a50d707000000b00425e37d4ef3mr1346882edi.167.1650798416453;
        Sun, 24 Apr 2022 04:06:56 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z61-20020a509e43000000b00425e4d583e4sm63517ede.87.2022.04.24.04.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 04:06:56 -0700 (PDT)
Message-ID: <32507f1d-b650-e2c9-2f04-1ac63c6774ec@linaro.org>
Date:   Sun, 24 Apr 2022 13:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] mtd: onenand: samsung: Make sure that bus clock is
 enabled
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
 <CY4PR04MB056777077970A6935BC6349BCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB056777077970A6935BC6349BCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2022 05:46, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch adds basic handling of controller bus clock to make sure that
> in device probe it is enabled and device can operate correctly. The
> clock is optional and driver behavior is identical as before this patch
> if not provided.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/mtd/nand/onenand/onenand_samsung.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
> index a3ef4add865a..62014f8d27b6 100644
> --- a/drivers/mtd/nand/onenand/onenand_samsung.c
> +++ b/drivers/mtd/nand/onenand/onenand_samsung.c
> @@ -11,6 +11,7 @@
>   *	S5PC110: use DMA
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/sched.h>
> @@ -122,6 +123,7 @@ enum soc_type {
>  struct s3c_onenand {
>  	struct mtd_info	*mtd;
>  	struct platform_device	*pdev;
> +	struct clk	*clk_bus;
>  	enum soc_type	type;
>  	void __iomem	*ctrl_base;
>  	void __iomem	*chip_base;
> @@ -914,6 +916,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	onenand->clk_bus = devm_clk_get(&pdev->dev, "bus");

If it is optional, use optional clk API.

> +	if (!IS_ERR(onenand->clk_bus))
> +		clk_prepare_enable(onenand->clk_bus);
> +
>  	err = onenand_scan(mtd, 1);
>  	if (err)
>  		return err;

Error paths not updated.

Also what about other clocks?

I propose you should take over the authorship of the patch because it
will be more changes.

> @@ -945,6 +951,8 @@ static int s3c_onenand_remove(struct platform_device *pdev)
>  	struct mtd_info *mtd = platform_get_drvdata(pdev);
>  
>  	onenand_release(mtd);
> +	if (!IS_ERR(onenand->clk_bus))
> +		clk_disable_unprepare(onenand->clk_bus);
>  
>  	return 0;
>  }


Best regards,
Krzysztof
