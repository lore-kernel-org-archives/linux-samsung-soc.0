Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E384C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC0C020756
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbhA0IS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:18:28 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:35008 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhA0IB6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:01:58 -0500
Received: by mail-wm1-f43.google.com with SMTP id e15so787994wme.0;
        Wed, 27 Jan 2021 00:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z8VZSnfNhwXYMMltbVWNvNFLnNxW2t9F86V+xNnmgho=;
        b=s3TQ8kqBJIOqJF7y9vpVmwBOAWMd7g6oWFaKCumPDUYbnQ68BgyhEDJFBT554AKG29
         6bHt4gnBS/rxtRuHdKhfe3lzwSjX1nuMgLzGjL6zPNFXMc6Ib2TFo+d1DO8r0u/Vyu6k
         BI5zNb/S31WhPvfOPIM+I0/lzpGj30Aicyws/Uj31inSRufg9/PWWD9XW/3EYiPRaW8z
         yBWKr/PxCiJG1KVmUStAFKWXOiMak9dp3PObEiXhD1DVE+6q8jU0Q+ljBirwXXe9TFDg
         0ZdLSF4vmVC1kM8gTAIXPKjpSc9QC75YSgaLhDN0VSZBOsknajZFZ5wjzV0NGO6p4dCy
         6OIg==
X-Gm-Message-State: AOAM531uR9C/58yVMbQ/nXKia8bkXTDm9en3M3C4CX+NzaDfAV6Yc9B6
        2mzk63p0ER4s5FTZ/8j0HfQ=
X-Google-Smtp-Source: ABdhPJw8LJ5oeyR0q2oejE48aOoyLcwgERObEgtRDOXSVtj/M/PZgZ/o0n3iTmDWBTDLq/tF4naH1Q==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr2925414wmi.173.1611734457117;
        Wed, 27 Jan 2021 00:00:57 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d2sm2036137wre.39.2021.01.27.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 00:00:56 -0800 (PST)
Date:   Wed, 27 Jan 2021 09:00:54 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for s3c64xx
Message-ID: <20210127080054.qyqjel7djozky5ni@kozik-lap>
References: <CGME20210127001644epcas2p13cbc984fecc3ac7700a422488b488135@epcas2p1.samsung.com>
 <20210127001631.91209-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127001631.91209-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 27, 2021 at 09:16:31AM +0900, Chanho Park wrote:
> This patch converts spin_[lock|unlock] functions of pin bank to
> raw_spinlock to support preempt-rt for pinctrl-s3c64xx. Below patch
> converted spinlock_t to raw_spinlock_t but it didn't convert the
> s3c64xx's spinlock.

Please, don't use "This patch":
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L89

The commit title should be changed - this is a fix now.

> 
> Fixes: 1f306ecbe0f6 ("pinctrl: samsung: use raw_spinlock for locking")
> 

No line break.

Best regards,
Krzysztof


> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> index b8166e3fe4ce..53e2a6412add 100644
> --- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> +++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> @@ -286,14 +286,14 @@ static void s3c64xx_irq_set_function(struct samsung_pinctrl_drv_data *d,
>  	shift = shift * bank_type->fld_width[PINCFG_TYPE_FUNC];
>  	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
>  
> -	spin_lock_irqsave(&bank->slock, flags);
> +	raw_spin_lock_irqsave(&bank->slock, flags);
>  
>  	val = readl(reg);
>  	val &= ~(mask << shift);
>  	val |= bank->eint_func << shift;
>  	writel(val, reg);
>  
> -	spin_unlock_irqrestore(&bank->slock, flags);
> +	raw_spin_unlock_irqrestore(&bank->slock, flags);
>  }
>  
>  /*
> -- 
> 2.30.0
> 
