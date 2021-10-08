Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA58AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEF7561073
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhJHGww (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:52:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51852
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230081AbhJHGwv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 02:52:51 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3AB074001E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633675856;
        bh=BA1SQapvvCAz+oDHnVnfNV3L9jjEVw0WkLjaLMpinks=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=iuISxnzHEUmwzYQXlFvM/5hK/yKwVRUVMQyrc5w9kX+0R01PlnGXi7ySjoACxkFxm
         OJgyIxfj3Iqw5GW0gVypFoCqejLMofSkdae0UJbEj59jDj3619zLOAC20sAQigrpU6
         7pvcqrfbBXiEdvfoa0hOTykQq9+gK2ymhtBZAB5XycVrwA/Ge/OAMvjNhB1RvK15rI
         lwHmI5TKzeLT6gw35w6vKIkwZ9DYFNBKTXPH9/9KGRhVK7iVberL0mX45IgFV5Ns0Q
         L1O5qjFDvrricV5Ka+FwmKlDY6HYsgukXfXEpDBSVZlmoweopmK1DrZax1BfQ5GaD9
         0LkzQvrVQpRMg==
Received: by mail-wr1-f70.google.com with SMTP id o2-20020a5d4a82000000b00160c6b7622aso6423138wrq.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 23:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BA1SQapvvCAz+oDHnVnfNV3L9jjEVw0WkLjaLMpinks=;
        b=GwURys2pmZohU6PiApZX2Jz86zYl/ejkmocy2+gVnRnogqgbg4D97+Zq9NTQp/LY9P
         IWKozR8HPDQkHmMujt+tseMlEnScYoaVPFzgC4ifcAsMZbNb6h9nX9STmmyV9zRAx2H4
         4Lbx5P0xQSFIxmMA8gb90f/eC6MtJu5zwIsSmy7fYdzPZJBKzcx3R5scl6eynH7+GZQw
         suug0qFO0qv9lRlglTXTBpeF5bHpjSz3BpzZx0gZs1zGYtCLZ2ov27iDFFLlGYgh+fAg
         418IqA0X4MqhwR7eQ80aVtA1e7ydBZE2cB29/J6csk2/7X9FlyQj1SNd6zelABlsmNiL
         LsKw==
X-Gm-Message-State: AOAM533DSHySM3jmzoH2qorN9BX+tz5XlQuIpdaLpIPv1K5UakEHlzrr
        2viriomnRENNi+jCmbV29DQ8CYl8rpaS6LSnRAHgYIxZohOyoZCGlokWmxhffHtTclF/D89FhTv
        EWM3niUYMUdNc46yGYa4Dk0q+nAm+VlgBKBRmZn1xIHGVmRZX
X-Received: by 2002:a05:600c:a05:: with SMTP id z5mr1495910wmp.73.1633675855510;
        Thu, 07 Oct 2021 23:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJn4G0BCTauVPKraJBpGRAEDVJf2AuBVOtRPXrnC5PixUTqvRw3mA3WpMrgLu4BKdAtk85WA==
X-Received: by 2002:a05:600c:a05:: with SMTP id z5mr1495870wmp.73.1633675855214;
        Thu, 07 Oct 2021 23:50:55 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id d8sm1489334wrz.84.2021.10.07.23.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 23:50:54 -0700 (PDT)
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-2-semen.protsenko@linaro.org>
 <6ef3e9a3-77e7-48b7-cbcd-c13db50d0cd9@canonical.com>
 <CAPLW+4kexaByx0nfy3q5g9XmrYdLav7E25h8qiO4Z_zmUVbRYQ@mail.gmail.com>
 <16ee07a1-afa9-b258-8836-e96de84551db@canonical.com>
 <CAPLW+4kq7MuF8HiY-UYvC0b8woT6G=hktJPPLD0iQ39iddmceA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <14624734-40bf-2e39-354c-244e730ef8e1@canonical.com>
Date:   Fri, 8 Oct 2021 08:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kq7MuF8HiY-UYvC0b8woT6G=hktJPPLD0iQ39iddmceA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/10/2021 15:29, Sam Protsenko wrote:
> On Wed, 6 Oct 2021 at 15:38, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 06/10/2021 12:46, Sam Protsenko wrote:
>>> On Wed, 15 Sept 2021 at 11:21, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>> On 14/09/2021 17:56, Sam Protsenko wrote:
>>>>> By default if bus clock has no users its "enable count" value is 0. It
>>>>> might be actually running if it's already enabled in bootloader, but
>>>>> then in some cases it can be disabled by mistake. For example, such case
>>>>> was observed when dw_mci_probe() enabled bus clock, then failed to do
>>>>> something and disabled that bus clock on error path. After that even
>>>>> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
>>>>> CMU bus clock ended up being disabled and it wasn't possible to access
>>>>> CMU registers anymore.
>>>>>
>>>>> To avoid such cases, CMU driver must increment the ref count for that
>>>>> bus clock by running clk_prepare_enable(). There is already existing
>>>>> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
>>>>> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
>>>>> support for runtime PM"). But the clock is actually enabled only in
>>>>> Exynos5433 clock driver. Let's mimic what is done there in generic
>>>>> samsung_cmu_register_one() function, so other drivers can benefit from
>>>>> that `.clk_name' field. As was described above, it might be helpful not
>>>>> only for PM reasons, but also to prevent possible erroneous clock gating
>>>>> on error paths.
>>>>>
>>>>> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
>>>>> flag for corresponding gate clocks. But that might be not very good
>>>>> design decision, as we might still want to disable that bus clock, e.g.
>>>>> on PM suspend.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>>  drivers/clk/samsung/clk.c | 13 +++++++++++++
>>>>>  1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>>>>> index 1949ae7851b2..da65149fa502 100644
>>>>> --- a/drivers/clk/samsung/clk.c
>>>>> +++ b/drivers/clk/samsung/clk.c
>>>>> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>>>>>
>>>>>       ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
>>>>>
>>>>> +     /* Keep bus clock running, so it's possible to access CMU registers */
>>>>> +     if (cmu->clk_name) {
>>>>> +             struct clk *bus_clk;
>>>>> +
>>>>> +             bus_clk = __clk_lookup(cmu->clk_name);
>>>>> +             if (bus_clk) {
>>>>> +                     clk_prepare_enable(bus_clk);
>>>>> +             } else {
>>>>> +                     pr_err("%s: could not find bus clock %s\n", __func__,
>>>>> +                            cmu->clk_name);
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>
>>>> Solving this problem in generic way makes sense but your solution is
>>>> insufficient. You skipped suspend/resume paths and in such case you
>>>> should remove the Exynos5433-specific code.
>>>>
>>>
>>> Keeping core bus clocks always running seems like a separate
>>> independent feature to me (not related to suspend/resume). It's
>>> mentioned in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
>>> support for runtime PM") this way:
>>>
>>>     "Also for each CMU there is one special parent clock, which has to
>>> be enabled all the time when any access to CMU registers is being
>>> done."
>>>
>>> Why do you think suspend/resume paths have to be implemented along
>>> with it? Btw, I didn't add PM ops in clk-exynos850, as PM is not
>>> implemented on my board yet and I can't test it.
>>
>> You can skip the runtime PM, so keep your patch almost like it is now
>> (in respect to Sylwester's comment about __clk_lookup). However now the
>> Exynos5433 will enable the clk_name twice: here and in
>> exynos5433_cmu_probe().
>>
>> If you keep this approach, you need to remove duplicated part in
>> exynos5433_cmu_probe()...
>>
> 
> My patch is only touching samsung_cmu_register_one(), and
> exynos5433_cmu_probe() doesn't call samsung_cmu_register_one(). So I
> don't think there can be a problem there. Or I'm missing something?
> 
> samsung_cmu_register_one() is actually called from 5433 clk driver,
> but only from CMUs registered with CLK_OF_DECLARE(), and those are not
> setting .clk_name field, so my code is not affecting those either.

You are right.

> 
> Real problem I can see is that I can't avoid using __clk_lookup() if I
> implement that code in samsung_cmu_register_one(). Tried to do use
> clk_get(NULL, ...) instead, but it doesn't work with 1st param (dev)
> being NULL, because samsung_clk_register_*() functions don't register
> clkdev (only samsung_clk_register_fixed_rate() does), hence
> LIST_HEAD(clocks) is empty in clkdev.c, and clk_get() fails, when not
> provided with actual 'dev' param, which in turn is not present in
> samsung_cmu_register_one()...
> 
> About using platform_driver: as I can see from clk-exynos5433.c, only
> CMUs which belong to Power Domains are registered as platform_driver.
> Rest of CMUs are registered using CLK_OF_DECLARE(), thus they don't
> get platform_device param. That makes it harder to avoid using
> __clk_lookup() inside samsung_cmu_register_one().
> 
> All that said, I feel like correct way to implement this patch would be:
>   1. Register all PD-capable CMUs as platform_driver in clk-exynos850
> (all CMUs except CMU_TOP)
>   2. Move bus clock enablement code from samsung_cmu_register_one() to
> corresponding clk-exynos850 probe function
> 
> This way I would be able to use clk_get(dev, ...) instead of
> __clk_lookup(), and that won't affect any existing code for sure. Code
> will be more unified w.r.t. how it's done in clk-exynos5433, and
> platform_device will be a foundation for implementing PM ops later.
> Taking into account how much design decisions should be done for using
> that in common code -- I'd say let's do that later, as a separate
> refactoring activity.
> 
> Do you think that makes sense?

Yes, makes sense. Thank you!


Best regards,
Krzysztof
