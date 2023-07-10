Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ABDEB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jul 2023 10:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbjGJKPu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jul 2023 06:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbjGJKPg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 06:15:36 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EF535AB
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 03:14:04 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so7954109a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688984043; x=1691576043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUEWXEFp+1oZr3kpVMJaoQSxkbkTSjRww+xMqeNuW+U=;
        b=coOXt0JVy/PKdCwR4/GcJ2HCVu/jydih7pmt243YtW7vhvpPOEmjrMvIUoiGNb2tqw
         KUmOuEut8EA2oUMSKMubkfa6j/7dqVGpgdbIFI9TWrsfWlxVYf779f9F8xrMNW2dabhg
         tx9BWEHUJX1XLBGIP29lOQpaqsE7awuMjNMnWQzkiDB1yAWLBlFv79Ar+CpmOB2Nn0vy
         rr5mREIrx/Tut1WlmmcDE8ProxiTJthgC4g1kR8OCgQBw7A+VkKs4QA6HYpcsNEA0J/K
         x4UGQI8wPTq53z1DO/XEsCAe50C+8iiXfLx7SQCyXXH6uUUO4vDxvQ5VTT/HISalohPr
         HFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688984043; x=1691576043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUEWXEFp+1oZr3kpVMJaoQSxkbkTSjRww+xMqeNuW+U=;
        b=GuBV0uCuYPtW5pd505GZm+ijeDpwECMWCiDDn5N289LZQsWlcuDERT2nn963gVbsVe
         f2tb2VOcJECRXIal4UMQh+oZAQ6F/lzPnM0tuRZ4TYsbkgJpqTTTWBIHId0pW+vS9rmy
         XcdpgsXWQIzSydmzbFPxwD8jqcxd4vxkuEwYQO7ENWDwjOoNiSwb8Jvi3O6R6H42aFP/
         UXQhA15l1yUVdQs0FbPxZXmqJRl870vVtxdfW6QnKM8MMunTfpxH+GoYPV2ocN0nYqCZ
         YBXkN55AZZWOhsody95OH3f1gzEsyHSHfkinLhAdpusm4LYFeNR7H2qYieEGMm/09RaR
         MgZg==
X-Gm-Message-State: ABy/qLatVflTARaog5juZPOdyqs94bvFVxrMYHLB//5Pfn4kfxpez1RU
        V7Cxy0gX7JZemzUhdJvN+kVBeA==
X-Google-Smtp-Source: APBJJlHmi2r9OzHgiqvApCLLnrK8IZai9S0ZSxrSRSQMHeshe+fZ1oKO/Dp9bywWV1JxTmwA8MelPg==
X-Received: by 2002:aa7:c508:0:b0:51d:e185:a211 with SMTP id o8-20020aa7c508000000b0051de185a211mr8809170edq.21.1688984043258;
        Mon, 10 Jul 2023 03:14:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0051df583ca96sm5454199edo.43.2023.07.10.03.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 03:14:02 -0700 (PDT)
Message-ID: <c1dcf8dc-b230-fd54-fc25-e57d6c6b6dea@linaro.org>
Date:   Mon, 10 Jul 2023 12:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 10/21] thermal/drivers/exynos: convert to use
 devm_request*_irq_probe()
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230710095926.15614-1-frank.li@vivo.com>
 <20230710095926.15614-10-frank.li@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230710095926.15614-10-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/07/2023 11:59, Yangtao Li wrote:
> There are more than 700 calls to devm_request_threaded_irq method and
> more than 1000 calls to devm_request_irq method. Most drivers only
> request one interrupt resource, and these error messages are basically
> the same. If error messages are printed everywhere, more than 2000 lines
> of code can be saved by removing the msg in the driver.
> 
> And tglx point out that:
> 
>   If we actually look at the call sites of
>   devm_request_threaded_irq() then the vast majority of them print more or
>   less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
> 
>      519 messages total (there are probably more)
> 
>      352 unique messages
> 
>      323 unique messages after lower casing
> 
>          Those 323 are mostly just variants of the same patterns with
>          slight modifications in formatting and information provided.
> 
>      186 of these messages do not deliver any useful information,
>          e.g. "no irq", "
> 
>      The most useful one of all is: "could request wakeup irq: %d"
> 
>   So there is certainly an argument to be made that this particular
>   function should print a well formatted and informative error message.
> 
>   It's not a general allocator like kmalloc(). It's specialized and in the
>   vast majority of cases failing to request the interrupt causes the
>   device probe to fail. So having proper and consistent information why
>   the device cannot be used _is_ useful.
> 
> So convert to use devm_request*_irq_probe() API, which ensure that all
> error handling branches print error information.
> 
> In this way, when this function fails, the upper-layer functions can
> directly return an error code without missing debugging information.
> Otherwise, the error message will be printed redundantly or missing.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

