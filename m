Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461F0C4361B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 08:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF38C22516
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 08:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgLDIhi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 03:37:38 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38274 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLDIhh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 03:37:37 -0500
Received: by mail-ed1-f66.google.com with SMTP id cw27so4977719edb.5;
        Fri, 04 Dec 2020 00:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJCXVeKT0YInV5KmVtKjZ9w5dyQPtfdB5b3zCaK/BpQ=;
        b=e8B6u/bawJtuZTWCIb7zZPeQR0nt2/1yBIrAfToZu1EPk87cprl08efkI+YFRjeca5
         fvlBXst5SJ1+Du/rSEbgbwKqj/73324/Ox/7mRcMjHLem8VU7wVvIjt6uzwBK72BKSh+
         nfFvv06iMzkPWR9vIQvPKv0glOYyC7/SkAmI2wnUS3idv5VReI86pbxT8DYMxStwTQpC
         Sz77gGeEqnitso65N5W6XCaQuNdXliAsUlpEEQfzoGDqMa0QfOVJOVxzieN+H6RmDETO
         UfhBluHaofZMOfPUSYFmGPhEb6Cz6AXoIdUL9AzYHN640ywwFa/LJ4/taTBqAXZ623CN
         qXMg==
X-Gm-Message-State: AOAM530RCHNzEbx/g/ypUpLbVlihYFAXFAuLCRq0OA+/SpskxLcD5vwV
        WML61yK+BraDbO/krYF6VhQ=
X-Google-Smtp-Source: ABdhPJxni+kovGD8RYWJWq7ZCGULqlHSM/J7qgILMqwplkVKElt6QKJeVFJFTMcLqQzz2gu3H/er8A==
X-Received: by 2002:a50:9d04:: with SMTP id v4mr6483919ede.363.1607071015664;
        Fri, 04 Dec 2020 00:36:55 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id r9sm2522408ejd.38.2020.12.04.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:36:54 -0800 (PST)
Date:   Fri, 4 Dec 2020 10:36:53 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: mark PM functions as __maybe_unused
Message-ID: <20201204083653.GA5418@kozik-lap>
References: <20201203225315.1477137-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203225315.1477137-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Dec 03, 2020 at 11:53:11PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 

I understand this happens with !PM builds. It would be good to mention
this in commit msg. With commit msg improved:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


> drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
>   219 | static int exynos_clkout_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
>   210 | static int exynos_clkout_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 9ec2f40cc400..e6d6cbf8c4e6 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -207,7 +207,7 @@ static int exynos_clkout_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int exynos_clkout_suspend(struct device *dev)
> +static int __maybe_unused exynos_clkout_suspend(struct device *dev)
>  {
>  	struct exynos_clkout *clkout = dev_get_drvdata(dev);
>  
> @@ -216,7 +216,7 @@ static int exynos_clkout_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int exynos_clkout_resume(struct device *dev)
> +static int __maybe_unused exynos_clkout_resume(struct device *dev)
>  {
>  	struct exynos_clkout *clkout = dev_get_drvdata(dev);
>  
> -- 
> 2.27.0
> 
