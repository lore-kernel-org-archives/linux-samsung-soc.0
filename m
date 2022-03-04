Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E21C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 07:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238715AbiCDHMP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 02:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbiCDHK0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 02:10:26 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70B21965DF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Mar 2022 23:08:01 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2CB623F613
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646377680;
        bh=N/1/s+Ed03pMGV4VO6sMw3Ii5bh7oLhfTOUQvpVABiY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=opvlomMk7f7GQi9XeWxL3xOd46NV7CEIAZF2KctzJMtQZRwF4kECYnANx+BCoXG+r
         CuRDWp1bsVMcld7IA3tlT9dsSKM5rAeAV6aspqdcqjSy1blA198lzpDPnXSOXfh4nn
         mudtrHItRzIDTY/mjA1C23f+eGn+FeKiLkg3ixoN323U3ya+HjLDhcXsEa5y1WdBRB
         UMcg6vYWxFBYbt56QY6QU33Z/mpK/t6+5mvER4Wo21n63nf6l8oPgafAJ3iFEv8wrw
         DI/FraIQ3dTihqOIjYeWNzNJc3y55ZETrc8+z6+1K3KkSH6T/uG//nroHSTCjlQdin
         ie36fjS+O/okQ==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4120274edt.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2022 23:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N/1/s+Ed03pMGV4VO6sMw3Ii5bh7oLhfTOUQvpVABiY=;
        b=NEm1Phaw5yivb2VbCrfLkfJABytga+p7N/VkopWAPIgIyaQAKlI/1/y34iltyAAyTB
         LlMY6vXcRjlCWKUztCufmZhFmS8AI2KFs41okH8KYl+TnEYygvEHSbLU5L5jnz+KS7n3
         8SLO790j3z3N+rIpWmA/8kYEceP64JneZwpLwQeajbVYyoUtZ5J3ZK+PS5x26N6ejGUH
         i1srWKf5ic3c7/gECGzdrXpGlgirv4RDyfTkg61bpjJhTmySopufdOHoHgpqmiQX/8yD
         jnRUHaxK2ijxtTv/qxT5DH9QrJBUltr2Zt/uQ6HclF3XQ1tm/+2vuOipPrRTg+fBQ/OL
         oQDw==
X-Gm-Message-State: AOAM5317YAtgREIelWtiafAfy/A07CuB0qp4ecXichWUQQ5KoHQPQ+/p
        1GWZ+qHcq1qR79TJy3fDlAk936V6htckf2CRYRAF87wWc0EDYcSQcGzyUbMg35IcDIQxSWKVKQn
        8KfwYq12YAE/whora8R8su7qSQBPLJejj00Dcdw3NmrUP9IDm
X-Received: by 2002:a17:906:e08c:b0:6bb:6f89:7d59 with SMTP id gh12-20020a170906e08c00b006bb6f897d59mr29274088ejb.85.1646377679794;
        Thu, 03 Mar 2022 23:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyy8e4pIZMZnPd5rczSQZGV6twzM+/yp98TImvs5xVvRwjTi5ipd7MooK4COLXs3PKn+olIPg==
X-Received: by 2002:a17:906:e08c:b0:6bb:6f89:7d59 with SMTP id gh12-20020a170906e08c00b006bb6f897d59mr29274073ejb.85.1646377679604;
        Thu, 03 Mar 2022 23:07:59 -0800 (PST)
Received: from [192.168.0.138] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id kq26-20020a170906abda00b006da87077172sm1469596ejb.29.2022.03.03.23.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 23:07:58 -0800 (PST)
Message-ID: <887c5cf8-8dda-3311-0aa7-27fbceb6a6f9@canonical.com>
Date:   Fri, 4 Mar 2022 08:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk/samsung: Use of_device_get_match_data()
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     alim.akhtar@samsung.com, chi.minghao@zte.com.cn,
        cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com,
        s.nawrocki@samsung.com, sboyd@kernel.org, tomasz.figa@gmail.com,
        zealci@zte.com.cn
References: <77a147f9-794c-83ca-070b-fb17d665ed8f@canonical.com>
 <20220304011155.2061393-1-chi.minghao@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304011155.2061393-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/03/2022 02:11, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index e6d6cbf8c4e6..feed1a347c09 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -81,19 +81,13 @@ MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>  static int exynos_clkout_match_parent_dev(struct device *dev, u32 *mux_mask)
>  {
>  	const struct exynos_clkout_variant *variant;
> -	const struct of_device_id *match;
>  
>  	if (!dev->parent) {
>  		dev_err(dev, "not instantiated from MFD\n");
>  		return -EINVAL;
>  	}
>  
> -	match = of_match_device(exynos_clkout_ids, dev->parent);
> -	if (!match) {
> -		dev_err(dev, "cannot match parent device\n");
> -		return -EINVAL;
> -	}
> -	variant = match->data;
> +	variant = of_device_get_match_data(dev->parent);
>  

What about possible NULL pointer exception? Device is being instantiated
by MFD, so the match here could be false if MFD driver is updated but
this one here not. With your change returned NULL will be dereferenced
line below.

>  	*mux_mask = variant->mux_mask;
>  


Best regards,
Krzysztof
