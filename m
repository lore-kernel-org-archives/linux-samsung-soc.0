Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22454C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 11:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 095D7610FC
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 11:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbhJFLUq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 07:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238159AbhJFLUp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 07:20:45 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77863C061749
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 04:18:53 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id y28so2498195vsd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dR4pbYgiCMJolLZa4rl1NsI5AKql6gs8uI5ZG1vogcA=;
        b=Oj7C7ewMlo55GrrQdI05zzX/5wY9fdW/QqdRW3E+PpO4KFTAZfF6FT5eb8JTSv4deb
         lr55nqtBRlKSNDLyYde57wRdZP4b6XjNoMLicjUtsZZ8kc+dTIrnBMedEUBHDfwwx6PM
         qaLXPYZ482UV863Z4xoi5ggrcMe+ofkm7vr9qcu3UFUBZZObNcQrNsJm++GKcGVkP1D0
         JMyXiTtGNQTdFqU0jLli0waMhVYSd2fg9TqKcp5P9zUMBAWq5UHVFymC6tvhTUB/TzkD
         IWIpHEng4Ig3Fj5g1rFkSAeUMZvL5IwhiDst+plAaFEWVs5xpQx4J1bZGG+eF2sXf2Gj
         lGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dR4pbYgiCMJolLZa4rl1NsI5AKql6gs8uI5ZG1vogcA=;
        b=NH/hu4ICPfY4VU8izqO42hOUIH3it5CmZ6XnDS6VHIJUhfNh2pkamKP6nIrWH9L9lL
         oLrHJtSuuy3Byhylapm1NhtoZowC05nVVBX0MJs75nGmb2Ye857UXDUQeM7q2JTiVeU9
         51Ah7OsAJUVlC2P/ZnV3eiu6DGI3QIJvNQ/FglxD/T8Cpoap4lXNN9U3Ge3UDn3xzlyd
         neJjhbpXb0XRPpNZD2GJHPp4KBb9+n5r5l+sUIKCWIc8Il7O3Pop7XF1QaDhKa6QgVDt
         n8QLc0tQQcoSr2cyR/jYxg5iTRT5VCWwo/K7zRiII6aF0JdIocUPhTYgserjoWGejrZG
         uc2A==
X-Gm-Message-State: AOAM532ZVIw0s8/40Myt6OrYb39wnxdK0rjZAGWNlfKwUKQxNO3xDRMg
        x62NMgTqZp7ztBtoeq2zaf1V0HxZcUtFPkDp/1mseQ==
X-Google-Smtp-Source: ABdhPJzFxz5+s2F+6jO+V19qhoMdDecX+bdO4F61ViOnmTCkjDFBAp28rmrm7xAi2GCJAtBgiruLyHcGYFUrgnRdvjU=
X-Received: by 2002:a67:1781:: with SMTP id 123mr23205807vsx.1.1633519132591;
 Wed, 06 Oct 2021 04:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <CGME20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed@eucas1p1.samsung.com>
 <20210914155607.14122-2-semen.protsenko@linaro.org> <b44e1c4a-5abc-7a27-e9ae-d4645d04527a@samsung.com>
In-Reply-To: <b44e1c4a-5abc-7a27-e9ae-d4645d04527a@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 6 Oct 2021 14:18:40 +0300
Message-ID: <CAPLW+4=cL00WxQpobovE3Jo62RijOpqwYNAF8TJHXQTdGxNHHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
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
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 15:51, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> Hi,
>
> On 14.09.2021 17:56, Sam Protsenko wrote:
> > By default if bus clock has no users its "enable count" value is 0. It
> > might be actually running if it's already enabled in bootloader, but
> > then in some cases it can be disabled by mistake. For example, such case
> > was observed when dw_mci_probe() enabled bus clock, then failed to do
> > something and disabled that bus clock on error path. After that even
> > attempt to read the 'clk_summary' file in DebugFS freezed forever, as
> > CMU bus clock ended up being disabled and it wasn't possible to access
> > CMU registers anymore.
> >
> > To avoid such cases, CMU driver must increment the ref count for that
> > bus clock by running clk_prepare_enable(). There is already existing
> > '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
> > It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> > support for runtime PM"). But the clock is actually enabled only in
> > Exynos5433 clock driver. Let's mimic what is done there in generic
> > samsung_cmu_register_one() function, so other drivers can benefit from
> > that `.clk_name' field. As was described above, it might be helpful not
> > only for PM reasons, but also to prevent possible erroneous clock gating
> > on error paths.
> >
> > Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
> > flag for corresponding gate clocks. But that might be not very good
> > design decision, as we might still want to disable that bus clock, e.g.
> > on PM suspend.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/clk.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index 1949ae7851b2..da65149fa502 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
> >
> >       ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
> >
> > +     /* Keep bus clock running, so it's possible to access CMU registers */
> > +     if (cmu->clk_name) {
> > +             struct clk *bus_clk;
> > +
> > +             bus_clk = __clk_lookup(cmu->clk_name);
> > +             if (bus_clk) {
> > +                     clk_prepare_enable(bus_clk);
> > +             } else {
> > +                     pr_err("%s: could not find bus clock %s\n", __func__,
> > +                            cmu->clk_name);
> > +             }
> > +     }
> > +
> >       if (cmu->pll_clks)
> >               samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
> >                       reg_base);
>
> I would suggest to implement runtime PM ops in your driver instead, even though
> those would initially only contain single clk enable/disable. Things like
> the clk_summary will work then thanks to runtime PM support in the clk core
> (see clk_pm_runtime_* calls).

Can you please elaborate more? I don't see how adding PM ops would
solve the problem I'm trying to address, which is keeping core bus
clocks always running. For example, I'm looking at clk-exynos5433.c
implementation, which enables bus clock on resume path:

<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
static int __maybe_unused exynos5433_cmu_resume(struct device *dev)
{
    ...
    clk_prepare_enable(data->clk);
    ...
}
<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>

But that resume operation won't be called on driver init, because it
configures runtime PM like this:

<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
static int __init exynos5433_cmu_probe(struct platform_device *pdev)
{
    ...
    /*
     * Enable runtime PM here to allow the clock core using runtime PM
     * for the registered clocks. Additionally, we increase the runtime
     * PM usage count before registering the clocks, to prevent the
     * clock core from runtime suspending the device.
     */
    pm_runtime_get_noresume(dev);
    pm_runtime_set_active(dev);
    pm_runtime_enable(dev);
    ...
    pm_runtime_put_sync(dev);
    ...
}
<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>

When I tried to implement the same in my driver, only suspend function
is called during kernel startup.

Anyway, even clk-exynos5433.c driver (which also implements PM ops)
does the same for core bus clocks:

<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
static int __init exynos5433_cmu_probe(struct platform_device *pdev)
{
    ...
    if (info->clk_name)
        data->clk = clk_get(dev, info->clk_name);
    clk_prepare_enable(data->clk);
    ...
}
<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>

So it looks like separate feature to me. Not sure how that can be
implemented only by adding PM ops. Also, my board lacks PM support in
upstream kernel right now, so I probably won't be able to test PM ops
if I implement those, that's why I decided to skip it for now.

> We could also make common runtime PM suspend/resume helpers but I wouldn't focus
> on that too much now, it could well be done later.
> And please avoid introducing new __clk_lookup() calls.
>

The reason I used __clk_lookup() is that it's the only API that works
in that case. I tried to use clk_get(), but we lack 'struct dev'
pointer in samsung_cmu_register_one(), so when providing dev=NULL into
clk_get() it fails to get the clock. That's happening because
LIST_HEAD(clocks) is probably empty in clkdev.c. So this chain fails:

<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
clk_get()    // dev = NULL
  v
__clk_get_sys()
  v
clk_find_hw()
  v
clk_find()   // returns 0, because LIST_HEAD(clocks) is empty
<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>

I saw your patches which get rid of __clk_lookup() usage by accessing
ctx->clk_data.hws[], but that requires using clock index, not name.
'struct samsung_cmu_info' only stores bus clock name (.clk_name),
which seems logical to me, so we can't get away from using
__clk_lookup() in that case without refactoring 'struct
samsung_cmu_info' first.

All that said, I suggest next: I'll pull the code from this patch into
clk-exynos850.c, adding platform_driver registration there, so I can
actually use clk_get() for getting bus clocks. As for PM ops, I'd like
to skip it for now, if you don't mind, as I can't fully test those.
Otherwise please elaborate more on how PM ops can solve this problem.

Thanks!

> --
> Regards,
> Sylwester
