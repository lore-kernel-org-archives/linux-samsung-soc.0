Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F57C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 May 2022 07:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbiERH2X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 May 2022 03:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbiERH2W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 May 2022 03:28:22 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8692A6A033
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 May 2022 00:28:20 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u7so759602ljd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 May 2022 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G8aT1X87JNBdCI8skihL4Aci/WonpChvYF5exTqGUGQ=;
        b=jkmeGMT7U6r3ipXxlaZNQziLbo1jfUcG+l8wzWGpMtwVkbEsSh+Nv0S8o3o3Xx6uex
         1u+X36202XBACe4QDg4YsC2xPZB/cSlRPOwnTfKonKkfZuHuRrHIGWA+CE0qvVp9n+BG
         xNwOlrA3kMuPW/BCw62OZeoye0svLMaWUsOZFJIK2HTRxf1sJ4qjH+Yfz7WjkzxbroI+
         YJ4z+XelEGgBlQ8o1F3RGuxFsjfXgiAndFVM383dBD0EsheUvSAku6sbueRRrDeyZMTb
         STdFI3EHz0Wnd8K+jVqUChm0AGaS5X5YPxJi+QFnjBQJ8+wBQaWgSAmJDdOcHUqP+Xla
         h78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G8aT1X87JNBdCI8skihL4Aci/WonpChvYF5exTqGUGQ=;
        b=PZcOgEDrh+JCVq+ZLcd0ICIRYflQqjtfli/ImpBXGwX4DmggiYMsuvIytAh8UdxrcZ
         oqydVdIfOKfSfVp8OEFUS1Lyki5w02owiM9LoNkqok1xyBDlvEjHZOiH1sWDrctugHcP
         Ulrkbih42OlHK9raAOldyEEB8rxCVj+xAn8onoU655KfiNSVffN2nRjnsR+cCy2Zg80V
         JEpZEWFv/+M8vbDhkti4PeFZx/4AloP9OCsyjEm+M7fPKhKfP72TaaPZ3Zvx5X/fSFT/
         m8pzHSe7K/fQnKa7IRO3Mowo8ee4oPYMoCOnGRheGHopdr+c8gFhYSQ1e/qBjDO8SSa/
         TyuA==
X-Gm-Message-State: AOAM5324FF/MgcwOYT+vVLK3LoxNfSK2zTyG4PKWpH2gr/NjzOJhyJ/3
        U0lK2ZOnvyNBVp6eV32mZJfUtA==
X-Google-Smtp-Source: ABdhPJzQpIHYBfZIO+VNiBxbykGultqVVrcygi6gkVr7zCu6FvKyQHoW1r4bEz9pT8ZZfsJ63NoVow==
X-Received: by 2002:a2e:b8cc:0:b0:24f:501b:af80 with SMTP id s12-20020a2eb8cc000000b0024f501baf80mr16351009ljp.328.1652858898881;
        Wed, 18 May 2022 00:28:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z15-20020ac2418f000000b0047255d211c0sm119884lfh.239.2022.05.18.00.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 00:28:18 -0700 (PDT)
Message-ID: <a197ed7f-6115-4407-6931-f37b719587be@linaro.org>
Date:   Wed, 18 May 2022 09:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv2 2/6] thermal: exynos: Reorder the gpu clock
 initialization for exynos5420 SoC
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <20220515064126.1424-1-linux.amoon@gmail.com>
 <20220515064126.1424-3-linux.amoon@gmail.com>
 <68969550-e18b-3c27-d449-1478b314e129@linaro.org>
 <CANAwSgRBpm9gybfUWZbu3-eXLTYkpTZ=s3fmhpNyQcuj7+xdOA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CANAwSgRBpm9gybfUWZbu3-eXLTYkpTZ=s3fmhpNyQcuj7+xdOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/05/2022 20:43, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Sun, 15 May 2022 at 15:11, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/05/2022 08:41, Anand Moon wrote:
>>> Reorder the tmu_gpu clock initialization for exynos5422 SoC.
>>
>> Why?
> It just code reorder

I know what it is. I asked why. The answer in English to question "Why"
is starting with "Because".

You repeated again the argument what are you doing to my question "Why
are you doing it".

It was the same before, many, many times. It's a waste of reviewers
time, because you receive a review and you do not implement the feedback.

>>
>>>
>>> Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> v1: split the changes and improve the commit messages
>>> ---
>>>  drivers/thermal/samsung/exynos_tmu.c | 43 ++++++++++++++--------------
>>>  1 file changed, 21 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
>>> index 75b3afadb5be..1ef90dc52c08 100644
>>> --- a/drivers/thermal/samsung/exynos_tmu.c
>>> +++ b/drivers/thermal/samsung/exynos_tmu.c
>>> @@ -1044,42 +1044,41 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>>>               dev_err(&pdev->dev, "Failed to get clock\n");
>>>               ret = PTR_ERR(data->clk);
>>>               goto err_sensor;
>>> -     }
>>> -
>>> -     data->clk_sec = devm_clk_get(&pdev->dev, "tmu_triminfo_apbif");
>>> -     if (IS_ERR(data->clk_sec)) {
>>> -             if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
>>> -                     dev_err(&pdev->dev, "Failed to get triminfo clock\n");
>>> -                     ret = PTR_ERR(data->clk_sec);
>>> -                     goto err_sensor;
>>> -             }
>>>       } else {
>>> -             ret = clk_prepare_enable(data->clk_sec);
>>> +             ret = clk_prepare_enable(data->clk);
>>
>> This looks a bit odd. The clock was before taken unconditionally, not
>> within "else" branch...
> 
> The whole *clk_sec*  ie tmu_triminfo_apbif clock enable is being moved
> down to the switch case.
> tmu_triminfo_apbif  clock is not used by Exynos4412 and Exynos5433 and
> Exynos7 SoC.

This is not the answer. Why are you preparing data->clk within else{}
branch?


Best regards,
Krzysztof
