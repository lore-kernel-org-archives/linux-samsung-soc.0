Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF972C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 12:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391639AbiEFMKI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 08:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346885AbiEFMKG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 08:10:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C032D64BEA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 05:06:21 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t5so8441030edw.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xFmHe5bkQAJ5aCJTsLWLd98BK2vXyR0AnmNa1zUXsdw=;
        b=gq7RAY9Wzf/338Lts4ds4xDAELCJptxV8Yk3X3fNOhrOHPa3qKF8LtdJ10PD0dhPjJ
         NJ9yrVqjapiTCTD5kjOXwrCn0MS8LNTy4s/CLZKCYq30426fAHVVVl2HzvlL05+ZpXm7
         zMHgITwWstk63cxeYCanKM3oZiwfMhpwP0OaDnozVgIrjOAJ/SMc7a6tl93/8r9BCRDI
         Y4BFqRc40fmatvjYCVkVvR3y7Zf602m8XKTNdpi/xpvtVXjRjZ4ZqH6x/pJl7SaQOakG
         BVk/6QfDzvn0HzR41ot1srtwzQwolRSFPZQkwElcgspNZbSnvn2fGzS1YoOGBw1rYmBZ
         4DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xFmHe5bkQAJ5aCJTsLWLd98BK2vXyR0AnmNa1zUXsdw=;
        b=DUzkjNyKPna17Pihf2+CxClZ9gTK4mxVlW/5c+YNZNFNoUUvt42Fd0JD6tqqd1SJMk
         Q5HEsHyW8NFWP2FXDfqPjBjJF6ksWN6C/mj4PoVQ7FYpyf+JPEwKzqEjtHoBHSM0X7Gd
         c9EeQ+LxTnOP7jX5UzRWKwW3D9c1vuHiMEH4d+0wFaJSePV6uYRsgR8cWFhHc0pWlXFZ
         +ncLA8IH/YiazsLnifz0j2dHn3tDAgaAiYGIrgUQ2TszFh+BVRLqv/Khs7NzHR3AwPZM
         rTiUauo9opsgTRFybG9VwGEdv3FRfeXn7EZfqXwiN9qCzal832/QMETOVcHkxT+vNZmi
         012Q==
X-Gm-Message-State: AOAM5337m3VEkaKaDYH+62XQ6ivD1v4h/HBqo1IjJ5CEGptgdforiXH6
        g9SyTR79j9UKVXq21IjG0kC/EA==
X-Google-Smtp-Source: ABdhPJx7ciama2+XwGOT9X7qW1ScXEtcrEsU/0JJXqlPqFpvUwHFs4XzAO2ER/pXKoHhGXX+ZU7i9A==
X-Received: by 2002:aa7:ce87:0:b0:425:d88c:bc92 with SMTP id y7-20020aa7ce87000000b00425d88cbc92mr3167564edv.147.1651838780324;
        Fri, 06 May 2022 05:06:20 -0700 (PDT)
Received: from [192.168.0.227] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 9-20020a508749000000b00426488dce1dsm2173209edv.25.2022.05.06.05.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 05:06:19 -0700 (PDT)
Message-ID: <5f862222-b3ea-ac7d-2c82-92aaad56ad3e@linaro.org>
Date:   Fri, 6 May 2022 14:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] i2c: s3c2410: change return type of
 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
References: <20220506113415.10462-1-hanyihao@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506113415.10462-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/05/2022 13:34, Yihao Han wrote:
> Since ret is a redundant variable, and none of the callers check
> for return, so remove ret variable and change return type of 
> 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index b49a1b170bb2..75ddf7ffb028 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -381,17 +381,15 @@ static inline int is_msgend(struct s3c24xx_i2c *i2c)
>  /*
>   * process an interrupt and work out what to do
>   */
> -static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
> +static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  {
>  	unsigned long tmp;
>  	unsigned char byte;
> -	int ret = 0;
>  
>  	switch (i2c->state) {
>  
>  	case STATE_IDLE:
>  		dev_err(i2c->dev, "%s: called in STATE_IDLE\n", __func__);
> -		goto out;

This does not look equivalent. Should be a return here.


Best regards,
Krzysztof
