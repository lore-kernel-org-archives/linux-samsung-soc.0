Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CBCECE58A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:16:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 091392190F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569935808;
	bh=z+eyey56KSLZeXplpzQcoLYndVQmTfc7B1a82fMdTvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wizxi5PRuofRdA8u54JH7iDhrJCXtpQ7qxHS61Kb0GFltOjxKqpGasTG+qz/+lpqT
	 5Tg1bLXQ7VQXqsCYz3dAu5ria4YFuGQ3ebv+PmaBBswAqOqfAhyCWDlLaRLC5v67tM
	 DTrqUPzHe5Z0wzkWWYUt+Omr6jYRFlt9OVgIlQuQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfJANQr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 09:16:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36095 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387798AbfJANQr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:16:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so3221765wmc.1;
        Tue, 01 Oct 2019 06:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nE5vvE/4hrLzMVRha4pDXEEtrjSh639w28W7bdxxyf4=;
        b=ZFIfvfAFQX8VdPFhhtSgtdl4UAtcfDM0iCpVFyw6PNLGca2kMMWxTuWigE5uJ6C6p4
         bDtpsDlNZRrmN/grP9rWpgWOjnC1Su2hOTH6rWq+o6fQVzHQE+X0reJ7sPlJ608qYLe7
         s7I8lcJb5+Q8V1lA6472caRG9gWD0yAwn9Vtj90PcbT3R/ulXLx4Iu/axKS1IeIOa2i7
         xIZJ+wTQ/AfAi9ZuKgLd62z5xg2CC8kIud56kDMHr+c8X8rYw1QClC3Abw6k2xAVXGfY
         wmlCRFLbDNkTjEDia0ESqJMSdguRR4F4qJINiuR4ICRmbcNoVHa2yDJiLJdhLhGiqmxZ
         Lfog==
X-Gm-Message-State: APjAAAWiqX/5c2V8mRa1OW7BliLEVKbLR9sNfPdsgdUr0YxRFWi1B07P
        sWRZ+Me9OjwrFT8ugiK+iNtjARBF
X-Google-Smtp-Source: APXvYqxuS96rqeAQvs2PdjsuLrQgfZJsdlA7bjOoFyG5WVsDOOMBlREaTEjmGYAGZqEjcHB/p2lwVQ==
X-Received: by 2002:a05:600c:2193:: with SMTP id e19mr3596765wme.2.1569935804473;
        Tue, 01 Oct 2019 06:16:44 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id w18sm3562313wmc.9.2019.10.01.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:16:43 -0700 (PDT)
Date:   Tue, 1 Oct 2019 15:16:41 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix potential NULL pointer
 dereference
Message-ID: <20191001131641.GA30129@pi3>
References: <CGME20191001130929eucas1p114d229f779680122c629396a4fc040c0@eucas1p1.samsung.com>
 <20191001130921.24571-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191001130921.24571-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 01, 2019 at 03:09:21PM +0200, Marek Szyprowski wrote:
> devm_kcalloc might fail, so avoid accessing the allocated object in such
> case.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 7824c2ba3d8e..6afbcd0ae96f 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5592,7 +5592,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	if (data->nr_pclks > 0) {
>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>  					   data->nr_pclks, GFP_KERNEL);
> -
> +		if (!data->pclks)
> +			return -ENOMEM;

You leak the memory from the samsung_clk_alloc_reg_dump() call.

The error path few lines later (from of_clk_get()) leaks it as well.

Best regards,
Krzysztof

>  		for (i = 0; i < data->nr_pclks; i++) {
>  			struct clk *clk = of_clk_get(dev->of_node, i);
>  
> -- 
> 2.17.1
> 
