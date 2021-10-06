Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46597C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2884961184
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhJFMkw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:40:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35476
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232277AbhJFMkv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:40:51 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE1F33FFF0
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633523938;
        bh=9mJv7vydoc4KxolrYZqQszFixt0Rzsc2yW8Qm+0Oasg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=DDx0kfFBw5+UKhGwr3dRbHf7usgPGYWZwmZja0yJy6MfLXqRgLp46UT9/6XAy8/Ob
         39Z5rRU7N5z9hp0yebe985HsgjwBc1CfdinGMIlIFycO7468ZGhHS10tpH3TEA8PEa
         4GPg7cUKYgQ62nC7kVn1Bm7UOc6i7wBix0xJULMNVhZIsNNcoKX+iFWtbhHSexsoTK
         deuMPz0lzyO1DsMbr072TzfydlArQIFqCco87V10G4yrUXy5DlPwj2RP0ZIsltSyDl
         /lx8m2fqvZzldqNp46R60posO3lqH/L6x6WAhahsAk1Bz7GuyZhZ3lH4R99beaA4hA
         SFnPqzZaWkbaw==
Received: by mail-lf1-f72.google.com with SMTP id n22-20020a0565120ad600b003fcc09af59fso1843123lfu.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 05:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9mJv7vydoc4KxolrYZqQszFixt0Rzsc2yW8Qm+0Oasg=;
        b=25uHGbuHxs43vR28uiDJko6EByawNFNX5SpFbd9jmdGkniCNB29upnlyQ2ZTzSPD77
         Qt0vVHRHaMShRuXbtO2DGYDUrAsQBCgWdlR7btFc81AYw7z/lnpVY3UNEgjVf0H6gvHd
         TeL2SCfSqUR85qhSSrwDRBAVNdf63sKIyjYRklI6z5aqALKJ4dIhhkco1aG+vhLfP5gq
         3qcaVvgZHiwqVm0WXBs5NPqlOtk6C8heiyXq22k/1T2I+A2FZTIapE6UkpCSz0aBEuiv
         QNCP7O6hpOEH/7o4nhsRntTB/hste6rWbkpOfCoGdEnWktnfoP3r0mDJhyH7jakCXoP0
         d1Ow==
X-Gm-Message-State: AOAM531GI7tcu5EgxvCTklhcelrjzA8IWC2deThlGctI3vznssK620Pg
        R/v4mr4vwAvq1m7FvANKKkKauIHEXT/mvJ16lxfkr5rKOd2Ws3uPUzB0kiwQSeX4+jj/fGXhwlN
        +08q+gpu5KoMFb1o8VZZJUS0Z2pHLPOpKFkU3NfoxWGpEGsxI
X-Received: by 2002:a05:6512:3a88:: with SMTP id q8mr9272045lfu.425.1633523937624;
        Wed, 06 Oct 2021 05:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykyA+GW2Du8nJg20OBGB5WUBySz7bq6hoifotyrhP3nCgvQX2XPulj9GID977EqoW8vHGO8A==
X-Received: by 2002:a05:6512:3a88:: with SMTP id q8mr9272011lfu.425.1633523937405;
        Wed, 06 Oct 2021 05:38:57 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c5sm2256595ljd.94.2021.10.06.05.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:38:57 -0700 (PDT)
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <16ee07a1-afa9-b258-8836-e96de84551db@canonical.com>
Date:   Wed, 6 Oct 2021 14:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kexaByx0nfy3q5g9XmrYdLav7E25h8qiO4Z_zmUVbRYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/10/2021 12:46, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 11:21, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 14/09/2021 17:56, Sam Protsenko wrote:
>>> By default if bus clock has no users its "enable count" value is 0. It
>>> might be actually running if it's already enabled in bootloader, but
>>> then in some cases it can be disabled by mistake. For example, such case
>>> was observed when dw_mci_probe() enabled bus clock, then failed to do
>>> something and disabled that bus clock on error path. After that even
>>> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
>>> CMU bus clock ended up being disabled and it wasn't possible to access
>>> CMU registers anymore.
>>>
>>> To avoid such cases, CMU driver must increment the ref count for that
>>> bus clock by running clk_prepare_enable(). There is already existing
>>> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
>>> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
>>> support for runtime PM"). But the clock is actually enabled only in
>>> Exynos5433 clock driver. Let's mimic what is done there in generic
>>> samsung_cmu_register_one() function, so other drivers can benefit from
>>> that `.clk_name' field. As was described above, it might be helpful not
>>> only for PM reasons, but also to prevent possible erroneous clock gating
>>> on error paths.
>>>
>>> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
>>> flag for corresponding gate clocks. But that might be not very good
>>> design decision, as we might still want to disable that bus clock, e.g.
>>> on PM suspend.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/clk/samsung/clk.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>>> index 1949ae7851b2..da65149fa502 100644
>>> --- a/drivers/clk/samsung/clk.c
>>> +++ b/drivers/clk/samsung/clk.c
>>> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>>>
>>>       ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
>>>
>>> +     /* Keep bus clock running, so it's possible to access CMU registers */
>>> +     if (cmu->clk_name) {
>>> +             struct clk *bus_clk;
>>> +
>>> +             bus_clk = __clk_lookup(cmu->clk_name);
>>> +             if (bus_clk) {
>>> +                     clk_prepare_enable(bus_clk);
>>> +             } else {
>>> +                     pr_err("%s: could not find bus clock %s\n", __func__,
>>> +                            cmu->clk_name);
>>> +             }
>>> +     }
>>> +
>>
>> Solving this problem in generic way makes sense but your solution is
>> insufficient. You skipped suspend/resume paths and in such case you
>> should remove the Exynos5433-specific code.
>>
> 
> Keeping core bus clocks always running seems like a separate
> independent feature to me (not related to suspend/resume). It's
> mentioned in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> support for runtime PM") this way:
> 
>     "Also for each CMU there is one special parent clock, which has to
> be enabled all the time when any access to CMU registers is being
> done."
> 
> Why do you think suspend/resume paths have to be implemented along
> with it? Btw, I didn't add PM ops in clk-exynos850, as PM is not
> implemented on my board yet and I can't test it.

You can skip the runtime PM, so keep your patch almost like it is now
(in respect to Sylwester's comment about __clk_lookup). However now the
Exynos5433 will enable the clk_name twice: here and in
exynos5433_cmu_probe().

If you keep this approach, you need to remove duplicated part in
exynos5433_cmu_probe()...

> 
> If you are suggesting moving all stuff from exynos5433_cmu_probe()
> into samsung_cmu_register_one(), it would take passing platform_device
> there, and implementing all PM related operations. I guess it's not a
> super easy task, as it would require converting clk-exynos7 to
> platform_driver for instance, and re-testing everything on exynos5433
> and exynos7 boards (which I don't have).
> 
> What do you say if I pull that code to clk-exynos850.c instead for v2?
> Refactoring (merging stuff from exynos5433_cmu_probe() into
> samsung_cmu_register_one() ) can be done later, when I add PM ops into
> clk-exynos850.
> 
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof
