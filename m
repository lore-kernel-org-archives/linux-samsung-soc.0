Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7F8CCA47E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbiF0JrB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 05:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233930AbiF0JrA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 05:47:00 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF4E63E5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:46:58 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id c13so12127320eds.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HHdosOs39o38BChR9emscNODdZBptdPe7N1Ku8GWR4k=;
        b=azcgu63Ik/VtroUohhLpZxUR9DERx1bU09MOj4tbkEu23vvYn7EBlJosUjm/E6cAUm
         mju28meLIHiGPyHms5sL05Oxbj239p1GXoC29oiOBietQAAXAeRdmswylVAjtp1VMHbx
         o/hsJ4+Z0RnW18+LcOpL+0u/N5v6h/+Xz8ko9ejwGiTl1OPSfmlnGRQcfsw/ds5vmqc8
         xIj5FCxSRN1h01OwnjonkuvlLROikDUMGetATplTArkGVadDkU1nAOr+Jji8EQIMKNl0
         sP7Fl8EueRMyZvIoynIHiIw6OIhHbi2pcnKFNtsCWfxlcgwiUK2dsuUxV/ZnE8t6Y6Pb
         /yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HHdosOs39o38BChR9emscNODdZBptdPe7N1Ku8GWR4k=;
        b=t8iVeehd7BT4Kf/jxcKIM/7VHAEwkp9ekwTGM1GnhOjRtComEOM1e8SqpcIVkdZyFF
         ALpmDVqnKSl2tPUgfVbm7yjQpgZnlsfxXrp6a58w7OZRv3Gb6gVYIUYu5jxMVwaBhKMt
         b6ayfWkuowtQIjinZL2J2+Pt8bT6s7brZZnOIGrVTkKjFetLnIjDmc0Svcaq99NGJiLK
         9Dr3+zBAPEbBe9Zw9dt7Sa7vCv9lHPyCSm+oCGF/uHTY/NuJQ841tvZDNQ5kDF7snrTm
         dCEOotvmd8xSKWWhTU6LAFJFVSNfc930BtekukWm1KFU4wLD+pdYM72E0IhlrORUjwK/
         NHcw==
X-Gm-Message-State: AJIora9TxtI1nmdzM550klPLiXMz/WweDbS7OuzlVNcq4JL0GIUc1Muo
        qK9sJKm8FMTuqB/G/ye1wJ459A==
X-Google-Smtp-Source: AGRyM1t6/gfotl2CU2szWClM+pyQl+8yGEzM6POYUCGhui7Z0nKt/DRapclROxQUx1vgj3P6b6/7Sw==
X-Received: by 2002:a50:ce4a:0:b0:435:c543:87e8 with SMTP id k10-20020a50ce4a000000b00435c54387e8mr15388117edj.295.1656323217429;
        Mon, 27 Jun 2022 02:46:57 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id dn7-20020a05640222e700b0042617ba6396sm7209623edb.32.2022.06.27.02.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:46:56 -0700 (PDT)
Message-ID: <f18a141b-b0bd-0efb-498a-1ab7745a3702@linaro.org>
Date:   Mon, 27 Jun 2022 11:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/5] spi: s3c64xx: add spi port configuration for Exynos
 Auto v9 SoC
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220627064707.138883-1-chanho61.park@samsung.com>
 <CGME20220627064931epcas2p19407c5c3da3319cfb55dcb2c6d517256@epcas2p1.samsung.com>
 <20220627064707.138883-6-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627064707.138883-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/06/2022 08:47, Chanho Park wrote:
> Add exynosautov9 spi port configuration. It supports up to 12 spis and
> has DIV_4 as the default internal clock divider. The spi also has
> an internal loopback mode to run a loopback test.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index dd5fc8570bce..67b1fecf6fc6 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1447,6 +1447,19 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
>  	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>  
> +static struct s3c64xx_spi_port_config exynosautov9_spi_port_config = {

This should be const.

Best regards,
Krzysztof
