Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895AEC77B73
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Apr 2023 08:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjDSID2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Apr 2023 04:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbjDSIDY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 04:03:24 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04967468C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Apr 2023 01:03:23 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94a342f15e4so602885266b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Apr 2023 01:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681891401; x=1684483401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EI1YComog4rA7OF+HOwhO9/TQv8utz9ZLP9QGa/GLwE=;
        b=r/ucemiZJuDiA5vpi5XomiHMtv/lGO0GnkLNm4C53kw4jG6ytb+TGNdHO9XTDoGOUs
         VvYJ1X1JtgzaYGi9XgFWXkQ3A+ApT7soIbcGRKyYgdohgGSHg+FXQBGVi2lYvtHABEpB
         clVNwJi+jbDlFxKf3VLEKLlopi/ANA0Fmv3NF92L4LYORYz9mZzAnTOX8y3TzutoC5sj
         Fn8rziK56HOhgMn2XwKJHaiF212rbqN0QSH90ElfqeUrQE3rHGbkZkj3it0VXmJLrWWu
         PX1nELYa8XnMgJIhn+12WFmJ6KBycvtQdJhhwnNq+jL2ndof1UUT6jt92itNAsVCJQmy
         bJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681891401; x=1684483401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EI1YComog4rA7OF+HOwhO9/TQv8utz9ZLP9QGa/GLwE=;
        b=gGWVP6dkblGnQCpQzJxlKx7jLv1o+bXbXoKZjQ1PyNWcNYkuvKglbIEkf2iodI2ZfB
         AI8z7ZbzEyPASWrphWo9h2Am4MeZoQfSpS6dMY+p7MZY+cBnQE2sqTF4D1IZyUvARTvB
         wGGyP4Y4Go4BmEV6WT/ngYw200OiwsDqsCt139MCEK1zmetUqnO95E68hT0e4dz9yYr0
         RtYOTVu5HMXEDqpDnIx+kYzvpUPQ9m4dZ2QSN6juZ8fxCkFPvKVazAtwszMIPmNWSspJ
         gdL2hjLod2tBb0CXnn08O+S7AFmBp6V8DUVQakxGtZsvwO9yC2eDnPNRC3mxcxLa+zGE
         EbNQ==
X-Gm-Message-State: AAQBX9ey3t3P3yl8NGAF67AXdoG36yXbnLw0lP6eUZKz7FXVdF2yCiMN
        ml20rhH8j2ANImFPSCTtWCMAuw==
X-Google-Smtp-Source: AKy350Z89TV9b5CQ5dMks6JPzzIhSrjODtafrwNBlmUmpvdcv/16ARInRyjVls8RymMBKO3tlwL4KQ==
X-Received: by 2002:aa7:c3c8:0:b0:506:85b4:b14b with SMTP id l8-20020aa7c3c8000000b0050685b4b14bmr4800801edr.29.1681891401444;
        Wed, 19 Apr 2023 01:03:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:62f5:eb43:f726:5fee? ([2a02:810d:15c0:828:62f5:eb43:f726:5fee])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402344c00b00504803f4071sm7861606edc.44.2023.04.19.01.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 01:03:21 -0700 (PDT)
Message-ID: <41ebe41f-d773-7cc3-dcad-8574c858645e@linaro.org>
Date:   Wed, 19 Apr 2023 10:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] spi: s3c64xx: changed to PIO mode if there is no
 DMA
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Mark Brown <broonie@kernel.org>, Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
References: <20230419060639.38853-1-jaewon02.kim@samsung.com>
 <CGME20230419062755epcas2p1370c1ca60d88d6b114a7c7c1de3f15c0@epcas2p1.samsung.com>
 <20230419060639.38853-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419060639.38853-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/04/2023 08:06, Jaewon Kim wrote:
> Polling mode supported with qurik if there was no DMA in the SOC.

typo: quirk
You missed verb in your first part of sentence. I don't understand it.

> However, there are cased where we cannot or do not want to use DMA.
> To support this case, if DMA is not set, it is switched to polling mode.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c                 | 8 ++++++--
>  include/linux/platform_data/spi-s3c64xx.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 71d324ec9a70..273aa02322d9 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -19,7 +19,6 @@
>  #include <linux/platform_data/spi-s3c64xx.h>
>  
>  #define MAX_SPI_PORTS		12
> -#define S3C64XX_SPI_QUIRK_POLL		(1 << 0)
>  #define S3C64XX_SPI_QUIRK_CS_AUTO	(1 << 1)
>  #define AUTOSUSPEND_TIMEOUT	2000
>  
> @@ -116,7 +115,7 @@
>  #define S3C64XX_SPI_TRAILCNT		S3C64XX_SPI_MAX_TRAILCNT
>  
>  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
> -#define is_polling(x)	(x->port_conf->quirks & S3C64XX_SPI_QUIRK_POLL)
> +#define is_polling(x)	(x->cntrlr_info->polling)
>  
>  #define RXBUSY    (1<<2)
>  #define TXBUSY    (1<<3)
> @@ -1067,6 +1066,11 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
>  		sci->num_cs = temp;
>  	}
>  
> +	if (!of_find_property(dev->of_node, "dmas", NULL)) {
> +		dev_warn(dev, "cannot find DMA, changed to PIO mode\n");

You said it is desired option, so should not be a warning. I would make
it debug at most.

> +		sci->polling = 1;



Best regards,
Krzysztof

