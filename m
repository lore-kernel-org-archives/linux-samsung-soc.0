Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D560BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCDF5610A4
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhJISvm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 14:51:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhJISvk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:51:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B513C60F6B;
        Sat,  9 Oct 2021 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633805383;
        bh=CvKTdCN1yIArwD+iF2n19tqqgAX1lw8yOSLPhHar5Fo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OV+IrVObRpcFO+czVbwRillFts8rECpgCtAbF/Gw5dwiHkVQb3wJVmy0L95GjG8dD
         7MnwXudGRDnGl5Dv5pDEDE8KeLPKULPSmjQ8uUKDf4Nr21Xnulz8zR5aC1iGGkyy+I
         TjYcydOh0482oIDE3JTSpMfntyK8VD122GAlq+789XJIlffAat5nGwZC8oL5v6Kk6F
         0VkjBlbzFsCANpDxVWlISquQy6MYfWPDxbQwXEeRBiAlkRAnTNpzhEZwxnY8aRimoF
         XEls+HExuBYmKRNBGzzqOOMPCinMjdVKqsdkkc2KyhUinFqY0cJKy3/+IHOVw8fk4v
         YwJTv2jy57uWw==
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <CGME20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed@eucas1p1.samsung.com>
 <20210914155607.14122-2-semen.protsenko@linaro.org>
 <b44e1c4a-5abc-7a27-e9ae-d4645d04527a@samsung.com>
 <CAPLW+4=cL00WxQpobovE3Jo62RijOpqwYNAF8TJHXQTdGxNHHg@mail.gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <356ecdc2-6059-b89c-9956-7aafc33456ac@kernel.org>
Date:   Sat, 9 Oct 2021 20:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=cL00WxQpobovE3Jo62RijOpqwYNAF8TJHXQTdGxNHHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06.10.2021 13:18, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 15:51, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> On 14.09.2021 17:56, Sam Protsenko wrote:
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

>>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>>> index 1949ae7851b2..da65149fa502 100644
>>> --- a/drivers/clk/samsung/clk.c
>>> +++ b/drivers/clk/samsung/clk.c
>>> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>>>
>>>        ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
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
>>>        if (cmu->pll_clks)
>>>                samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
>>>                        reg_base);
>>
>> I would suggest to implement runtime PM ops in your driver instead, even though
>> those would initially only contain single clk enable/disable. Things like
>> the clk_summary will work then thanks to runtime PM support in the clk core
>> (see clk_pm_runtime_* calls).
> 
> Can you please elaborate more? I don't see how adding PM ops would
> solve the problem I'm trying to address, which is keeping core bus
> clocks always running. For example, I'm looking at clk-exynos5433.c

I missed the fact that there is usually a specific SFR sequence required
for disabling the CMU root (and APB) clock. We would need to figure out what
an exact sequence is for each CMU, similarly as is done in clk-exynos5433,
then keeping the CMU source clock always enabled shouldn't be required.
I'm fine with just enabling the APB clocks in probe() until proper CMU
suspend/resume support is added.

> implementation, which enables bus clock on resume path:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __maybe_unused exynos5433_cmu_resume(struct device *dev)
> {
>      ...
>      clk_prepare_enable(data->clk);
>      ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> But that resume operation won't be called on driver init, because it
> configures runtime PM like this:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __init exynos5433_cmu_probe(struct platform_device *pdev)
> {
>      ...
>      /*
>       * Enable runtime PM here to allow the clock core using runtime PM
>       * for the registered clocks. Additionally, we increase the runtime
>       * PM usage count before registering the clocks, to prevent the
>       * clock core from runtime suspending the device.
>       */
>      pm_runtime_get_noresume(dev);
>      pm_runtime_set_active(dev);
>      pm_runtime_enable(dev);
>      ...
>      pm_runtime_put_sync(dev);
>      ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> When I tried to implement the same in my driver, only suspend function
> is called during kernel startup.

I think some of the clocks supplied by a CMU need to be in use
(e.g. clk_prepare()) to get the resume op in the CMU driver invoked.

> Anyway, even clk-exynos5433.c driver (which also implements PM ops)
> does the same for core bus clocks:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __init exynos5433_cmu_probe(struct platform_device *pdev)
> {
>      ...
>      if (info->clk_name)
>          data->clk = clk_get(dev, info->clk_name);
>      clk_prepare_enable(data->clk);
>      ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>

Enabling the clock corresponds with the pm_runtime_set_active() call you
pointed out above. Such pattern also ensures the clock will stay enabled
when CONFIG_PM_RUNTIME is disabled.

> So it looks like separate feature to me. Not sure how that can be
> implemented only by adding PM ops. Also, my board lacks PM support in
> upstream kernel right now, so I probably won't be able to test PM ops
> if I implement those, that's why I decided to skip it for now.

It is not really a separate feature, I think having the clocks permanently
enabled is not something we would like to end up with. It would need to be
revisited anyway when adding the power domains support.

>> We could also make common runtime PM suspend/resume helpers but I wouldn't 
>> focus on that too much now, it could well be done later.
>> And please avoid introducing new __clk_lookup() calls.
> 
> The reason I used __clk_lookup() is that it's the only API that works
> in that case. I tried to use clk_get(), but we lack 'struct dev'
> pointer in samsung_cmu_register_one(), so when providing dev=NULL into
> clk_get() it fails to get the clock. That's happening because
> LIST_HEAD(clocks) is probably empty in clkdev.c. So this chain fails:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> clk_get()    // dev = NULL
>    v
> __clk_get_sys()
>    v
> clk_find_hw()
>    v
> clk_find()   // returns 0, because LIST_HEAD(clocks) is empty
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> I saw your patches which get rid of __clk_lookup() usage by accessing
> ctx->clk_data.hws[], but that requires using clock index, not name.
> 'struct samsung_cmu_info' only stores bus clock name (.clk_name),
> which seems logical to me, so we can't get away from using
> __clk_lookup() in that case without refactoring 'struct
> samsung_cmu_info' first.

You need device pointer to get the CMU input clocks as specified in DT.
clk_get with NULL device pointer and global clock name will now only work
on Samsung non-DT platforms, for DT-only SoCs we don't register clkdev
entries at all (see samsung_clk_register_alias()).

> All that said, I suggest next: I'll pull the code from this patch into
> clk-exynos850.c, adding platform_driver registration there, so I can
> actually use clk_get() for getting bus clocks. As for PM ops, I'd like
> to skip it for now, if you don't mind, as I can't fully test those.

Sounds good to me, thank you for working on this.

--
Regards,
Sylwester
