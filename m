Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0374C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB0086115B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhJ2IUk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 04:20:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53396
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232373AbhJ2IUk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 04:20:40 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 649B93F1AA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635495491;
        bh=zyRvUcKW3mXZmS7QM4f7on74S8k/05bCH8SfKBR7/BI=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=dBnyatu+y0tUrG8W7oroKSrcc+vlVCTl02ZJBlalqsMKz5Y2Xp5QJB5+kg2HHzxSA
         sSHJTBAQtn+8b+bbeaBiE53MvK9Gifb8AGkfwi/lm6ucMXBdNyc9wPhabUmJRQ1nJH
         h+X+hBKRo67zhKk/AaVUeQmm9+8ltdlSpCv6eJ+DAbiKusAKJ/vqEeI7Lcld2GqDLW
         v3VFjfo+VZwumMA3mAw1hxzEnBolGSU7o0fxpi+oSv8pMWApl35oG1XBRGroxrr6j3
         uN1WaMpmMUbjbinbVT41Yf7zGxsDwhN1w74+jpX/50UTpzq/p+I0eTPxtFLFZKqLLA
         rQ4eTlResAsFw==
Received: by mail-lf1-f72.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so3221472lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyRvUcKW3mXZmS7QM4f7on74S8k/05bCH8SfKBR7/BI=;
        b=5mZIg61pQopC92ar5Atl9sPR4nzvNNSeUo4pdSkvenQlyNm7WHqYZnK66RvyLaXpYf
         ocrB4tYwo40wYYKXMpT+PLq8RlSFhygatRYi095wMn5MQ1g+U7JjQQP9fxWYicnbcXFP
         ShAM8MBE2uNhF7HLeymOQPV7WcTlp2c8iOmh7QPTqSWiPRY7zQVYvv5gSRVsa+hdO0O5
         OhL7jm8Nt9tAVytwzPApaVy6/AEtXgNGsx4s45ZaTueD4d5cG/+7Kelz0tI2JgBEShow
         UTVS96okaPMcVwd3qa7w3NXc830yfFefycjxmQkWWnlrFjL2Byw48kZdRWJjSMV+4IsD
         zKGg==
X-Gm-Message-State: AOAM530YycgoL9CwjWnYBU94sgkx58kpKGbdEeAl1ZLm0suiFXe6NOyd
        OyXc0T5zsAnyR2EUDKjojo1IP+m+yV3tCJ5IEQuAGXwq3w2Z2ubTs9bCONmh/Z2vvEkynurhH0h
        uMt7FW0z6vNOB2FKYTyivczAjN9GVSivEa4z519w4p4xMuc78
X-Received: by 2002:ac2:5c5e:: with SMTP id s30mr9014283lfp.445.1635495490228;
        Fri, 29 Oct 2021 01:18:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6YJOSgvrhcAkF9ySor+WPU5G2sf0l/f3dcJJttX6j56ToSz4XIxICo5Px5kxJ4LCDtj4aFg==
X-Received: by 2002:ac2:5c5e:: with SMTP id s30mr9014267lfp.445.1635495490026;
        Fri, 29 Oct 2021 01:18:10 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b21sm539025lfv.212.2021.10.29.01.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:18:09 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 5/7] watchdog: s3c2410: Introduce separate source clock
Message-ID: <76ca9492-3829-6d3b-580c-983bc8409b1f@canonical.com>
Date:   Fri, 29 Oct 2021 10:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/10/2021 20:35, Sam Protsenko wrote:
> Some Exynos chips (like Exynos850) have dedicated source clock. That
> clock is provided from device tree as "watchdog_src" clock. In such
> case, "watchdog" clock is just a peripheral clock used for register
> interface. If "watchdog_src" is present, use its rate instead of
> "watchdog" for all timer related calculations.

Please explain what is this source clock and remove the reference to
devicetree. Instead describe rather real HW. It's confusing now to have
one clock called watchdog and one watchdog source.

The source clock is the actual clock driving watchdog and it's counter,
right? Then let's document it and rename the variables to match reality
- one is pclk (or apb?) and second is counter or source?

> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index a5ef7171a90e..bfc5872ca497 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -126,6 +126,8 @@ struct s3c2410_wdt_variant {
>  struct s3c2410_wdt {
>  	struct device		*dev;
>  	struct clk		*clock;
> +	struct clk		*clock_src;
> +	unsigned long		freq_src;
>  	void __iomem		*reg_base;
>  	unsigned int		count;
>  	spinlock_t		lock;
> @@ -213,10 +215,8 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
>  
>  /* functions */
>  
> -static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
> +static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
>  {
> -	unsigned long freq = clk_get_rate(clock);
> -
>  	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
>  				       / S3C2410_WTCON_MAXDIV);
>  }
> @@ -364,7 +364,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  				    unsigned int timeout)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> -	unsigned long freq = clk_get_rate(wdt->clock);
> +	unsigned long freq = wdt->freq_src;

This does not look good. You are using fixed frequency (from probe).

>  	unsigned int count;
>  	unsigned int divisor = 1;
>  	unsigned long wtcon;
> @@ -627,13 +627,27 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	/* "watchdog_src" clock is optional; if it's not present -- just skip */
> +	wdt->clock_src = devm_clk_get(dev, "watchdog_src");
> +	if (!IS_ERR(wdt->clock_src)) {
> +		ret = clk_prepare_enable(wdt->clock_src);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable source clock\n");
> +			ret = PTR_ERR(wdt->clock_src);
> +			goto err_clk;
> +		}
> +		wdt->freq_src = clk_get_rate(wdt->clock_src);
> +	} else {
> +		wdt->freq_src = clk_get_rate(wdt->clock);
> +	}
> +
>  	wdt->wdt_device.min_timeout = 1;
> -	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
> +	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->freq_src);
>  
>  	ret = s3c2410wdt_cpufreq_register(wdt);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register cpufreq\n");
> -		goto err_clk;
> +		goto err_clk_src;
>  	}
>  
>  	watchdog_set_drvdata(&wdt->wdt_device, wdt);
> @@ -707,6 +721,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   err_cpufreq:
>  	s3c2410wdt_cpufreq_deregister(wdt);
>  
> + err_clk_src:
> +	if (!IS_ERR(wdt->clock_src))
> +		clk_disable_unprepare(wdt->clock_src);

No. Errors in getting source clock should not be ignored, so you should
never store here ERR. You could store NULL. If() is anyway not needed in
both cases.

You can simplify all this and take pclk twice if src clock is missing.
Or assign src=pclk...

> +
>   err_clk:
>  	clk_disable_unprepare(wdt->clock);
>  
> @@ -727,6 +745,9 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>  
>  	s3c2410wdt_cpufreq_deregister(wdt);
>  
> +	if (!IS_ERR(wdt->clock_src))
> +		clk_disable_unprepare(wdt->clock_src);
> +
>  	clk_disable_unprepare(wdt->clock);
>  
>  	return 0;
> 


Best regards,
Krzysztof
