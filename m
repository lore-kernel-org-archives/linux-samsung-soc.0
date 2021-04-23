Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F17C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Apr 2021 08:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BA83611C1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Apr 2021 08:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241397AbhDWIFP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Apr 2021 04:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241358AbhDWIFO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 04:05:14 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5871EC061574
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Apr 2021 01:04:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n4-20020a05600c4f84b029013151278decso707279wmq.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Apr 2021 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BbAlfrwo2WRXERUJtU5zYuJ3Z63HTo/B8XlPZIzMJFc=;
        b=na1Jxk6XNOFLChzn9la6USRZvv3sr8FCcw5vCRdYVPYBcVAd7F4pdUMPDz5CE659Sm
         3AOE4eehE295iYSdW3ERnPASjw9jPJL7Zn4YN1APnXLMjuwmsBBcYezrIQzaE6larHaj
         n2UweGZY7IMVrXGCgXQSyYDOCLr0X2LC/RoU934VnmkV4COREVnRjJfFsbCNDACB4UJm
         +4fdYNfi76MM7akXx/uusqiCpV+l9qNztoHxarBW49winzZk9VlAzTj/EYDZ7NyiqOrZ
         f8NxzHxExwo7RZwYA8g06llCivvrzWb2p7lSZcWyfI27dpN/hcpZNhZ45L3Ut/XTqzpv
         8SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BbAlfrwo2WRXERUJtU5zYuJ3Z63HTo/B8XlPZIzMJFc=;
        b=Y632U2mB5o7r0ZzGq1uJ9X9x0JJXW6BiJIQxF6xIQoa/+PK/xHtGZaL5b3JMyc3NfT
         8kpep5Qcnor5fQi47fR+lJM9hPgZ/uGTqQIrOUH4lYIijNRjh8K2ChmEuletVqa63WLl
         Pc/j95AKZIq4GFWgSxFUMDGI/nN7g/V2MAeCQgneuDAPGB0NHL4q+qCDlK3YMFWbAe+Z
         anUNtyyweT++EJBuwb6AT96lYQ4+pd0gXg/2AgWvDdNBNHFGGKSunXUa6zdZVAVG9fQz
         ZdIIHJvVlHOP9tmoBXGHdf5zeHUAAxhmLBkxuXhdUf5r2/6ycvDJGxeqp0PrDYWdN4ZO
         C0oQ==
X-Gm-Message-State: AOAM532e8KteovdJLRJYVHjQuZdr03nWrZfYx6lND14VHybctqKy4/mQ
        8ns470Ot7Wa0bfxhEt9W2Bq3sg==
X-Google-Smtp-Source: ABdhPJxOlhfTTDO2kZbt4t7jcd53CauCFDvLwi+o18lwhWG31178YTGd3jxTUmB1SaLsSOh0gmSRMQ==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr4168778wmh.69.1619165077043;
        Fri, 23 Apr 2021 01:04:37 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id c16sm7801320wrm.93.2021.04.23.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 01:04:36 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:04:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v2 7/7] mfd: twl: Correct kerneldoc
Message-ID: <20210423080434.GA6446@dell>
References: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
 <20210420113929.278082-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210420113929.278082-7-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 20 Apr 2021, Krzysztof Kozlowski wrote:

> Correct kerneldoc function name to fix W=1 warning:
> 
>   drivers/mfd/twl-core.c:496: warning:
>     expecting prototype for twl_regcache_bypass(). Prototype was for twl_set_regcache_bypass() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/mfd/twl-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

FYI, a patch already exists for fixing this.

> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index 20cf8cfe4f3b..24b77b18b725 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -485,8 +485,8 @@ int twl_i2c_read(u8 mod_no, u8 *value, u8 reg, unsigned num_bytes)
>  EXPORT_SYMBOL(twl_i2c_read);
>  
>  /**
> - * twl_regcache_bypass - Configure the regcache bypass for the regmap associated
> - *			 with the module
> + * twl_set_regcache_bypass - Configure the regcache bypass for the regmap
> + *			     associated with the module
>   * @mod_no: module number
>   * @enable: Regcache bypass state
>   *

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
