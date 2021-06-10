Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A37C47094
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 06:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED98613D9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 06:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhFJGqh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Jun 2021 02:46:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39873 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhFJGqh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 02:46:37 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrEQi-0005Ip-P7
        for linux-samsung-soc@vger.kernel.org; Thu, 10 Jun 2021 06:44:40 +0000
Received: by mail-wr1-f72.google.com with SMTP id s8-20020adff8080000b0290114e1eeb8c6so402115wrp.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jun 2021 23:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZIH1YbpeqNHlMEBnKgKmQmbv724BvB7zNbPXQ0+g4iI=;
        b=qU9kOLqPk/cSYPzM8AzHh2F+n7hLK2vMizA8kT/IoqoKTgxtssLajJz5Kxe+DciS5B
         1Q1e7Dvicn8l8rr8uc/Dc8anlbcz4EZ8nlPBukFF9yb1UgKHMEC14RVwsz4lSKqx8pNt
         GgiPSQu2uWJsNZ+EhYRb+faMFiWYcQXg1/rhc0anQXUggRVG/cH+Akz5Rh4dbMRuXnZy
         a5+iuygxLPQB4EPI9CEDe0dchvPJ1OlBZHpiv04iS8eHmCLD1vGZZeX6uCulcYTGE1eE
         OTvTUYbnHlSXfIETDjBefu6LAZOOe/xwK9G8bSEUzuD3Y+FY8fyvDAr9asOh+peH6ZAY
         uJ3Q==
X-Gm-Message-State: AOAM531Tn+CeNBp9IMZyNXx1ADGroAdT+5/SK90d8JBd8zAbbjDtGpRN
        ITg2O1LIQQKtPoakYzftIIgINLJ7kIKpsl+vy97aVHFm30ixYg7ooqZutzMaBFN04GPMf40R+Qk
        w3fre/9Y+NrjgZA5UCP410DNmhBQ2xQ2Uhhzcz7EQpT/K/Wn5
X-Received: by 2002:a7b:c44f:: with SMTP id l15mr13534857wmi.151.1623307480514;
        Wed, 09 Jun 2021 23:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPyiGqI2GWbCsI6J6N5fwz5wdl2B6k+bXM/ln08oHjXkJRT4CwBQGCjoKdKK7cFdZIe6d06g==
X-Received: by 2002:a7b:c44f:: with SMTP id l15mr13534844wmi.151.1623307480347;
        Wed, 09 Jun 2021 23:44:40 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id i9sm2854026wrn.54.2021.06.09.23.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 23:44:39 -0700 (PDT)
Subject: Re: [PATCH 1/1] irqchip/exynos-combiner: remove unnecessary oom
 message
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210609140335.14425-1-thunder.leizhen@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <99380b46-d677-822a-fb46-7a1a59e559ad@canonical.com>
Date:   Thu, 10 Jun 2021 08:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609140335.14425-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2021 16:03, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/irqchip/exynos-combiner.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
> index 14106126cbf3262..552aa04ff063123 100644
> --- a/drivers/irqchip/exynos-combiner.c
> +++ b/drivers/irqchip/exynos-combiner.c
> @@ -177,10 +177,8 @@ static void __init combiner_init(void __iomem *combiner_base,
>  	nr_irq = max_nr * IRQ_IN_COMBINER;
>  
>  	combiner_data = kcalloc(max_nr, sizeof (*combiner_data), GFP_KERNEL);
> -	if (!combiner_data) {
> -		pr_warn("%s: could not allocate combiner data\n", __func__);
> +	if (!combiner_data)
>  		return;
> -	}
>  
>  	combiner_irq_domain = irq_domain_add_linear(np, nr_irq,
>  				&combiner_irq_domain_ops, combiner_data);
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
