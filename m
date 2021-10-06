Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E662C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 10:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 337BF61039
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 10:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237984AbhJFKsY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 06:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237836AbhJFKsX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 06:48:23 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51155C061753
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 03:46:31 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id q13so1452872uaq.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAZ6VYVxXpp+/4weV4Gw1QKhKbSTkxuMKBLfGMMXi34=;
        b=RW9U4DrKauxl7RiYBSIz5WrXXIfcuHG+K0ocrRpKxF4zt5xL9u4Fg9K6qYhR9lBPUl
         y93WKKhFCAtxSPKBKYCjA4QJ+8FwXc/5sku7+kPilJLHB2VdACALVbJaOlRA89g7O7DU
         Ik1VVeEJ4TJgHGexGQuKQSL+001+Wq5E7FzeRwC0K5S7UU8WQoM187ddsNnLUvQ1xA0R
         C684SbtTBtrE4+uvIvzyL09hXp/luX8lpE8xIKgenBW874pWNGtFq5b9x5LhNP000LvE
         yHp1CV3ozWmUotvTQbqGaUmaacMrD4brCiA2pHu/4d0FkCUHrgYmDY29/2zgPC2K3l2j
         nbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAZ6VYVxXpp+/4weV4Gw1QKhKbSTkxuMKBLfGMMXi34=;
        b=hbaxzXbpkMRahz2fbf/Z8Tm7pb4RoeeqWFELGnK2NZdUS8t7UXVgP+YLEMZy80mco8
         t/j/P9++ORy0sHZxVp/zx4RN0IoNxxuOw5XhUndpXhYDwBg7Z6yzTKhALKFZ1vZLIDiw
         KJMwmpRF/csdcB5YThMHihO2uzgS1+d4m4sAO3FYvw6WDI6eNWLuNDSchq4jPGhdGzvb
         AGWFeM/JX1WEP6aHzP3UsWtQYX2NCbzHdNnTig2npLmKrrBCKwDINpgGNXJGzsymgzrw
         erWRWb3hIIb+udeRnSJX1pQhNK0Ef3QjIFg/HOyG0h7KCrD9RrWT/zTN1TBbu6LrQ6UP
         AUkg==
X-Gm-Message-State: AOAM5332veT7IoY08Qp00A/+zzIn2vq3TjnFv9CNeYBaM91qyGJgVBnF
        hk9xjNgJ6gSQ+WYfpoydZYuG1niO33DIjKqo4uo82g==
X-Google-Smtp-Source: ABdhPJzperz80UwQyac4C188t+tTN5/53/Vnxod/Zh2JotmRFJ6a4lcnzID/HuIDr8OIw9iJs9s2pzC6TK1K9n06Z9E=
X-Received: by 2002:ab0:3303:: with SMTP id r3mr17099371uao.17.1633517190130;
 Wed, 06 Oct 2021 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-2-semen.protsenko@linaro.org> <6ef3e9a3-77e7-48b7-cbcd-c13db50d0cd9@canonical.com>
In-Reply-To: <6ef3e9a3-77e7-48b7-cbcd-c13db50d0cd9@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 6 Oct 2021 13:46:18 +0300
Message-ID: <CAPLW+4kexaByx0nfy3q5g9XmrYdLav7E25h8qiO4Z_zmUVbRYQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 11:21, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/09/2021 17:56, Sam Protsenko wrote:
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
>
> Solving this problem in generic way makes sense but your solution is
> insufficient. You skipped suspend/resume paths and in such case you
> should remove the Exynos5433-specific code.
>

Keeping core bus clocks always running seems like a separate
independent feature to me (not related to suspend/resume). It's
mentioned in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
support for runtime PM") this way:

    "Also for each CMU there is one special parent clock, which has to
be enabled all the time when any access to CMU registers is being
done."

Why do you think suspend/resume paths have to be implemented along
with it? Btw, I didn't add PM ops in clk-exynos850, as PM is not
implemented on my board yet and I can't test it.

If you are suggesting moving all stuff from exynos5433_cmu_probe()
into samsung_cmu_register_one(), it would take passing platform_device
there, and implementing all PM related operations. I guess it's not a
super easy task, as it would require converting clk-exynos7 to
platform_driver for instance, and re-testing everything on exynos5433
and exynos7 boards (which I don't have).

What do you say if I pull that code to clk-exynos850.c instead for v2?
Refactoring (merging stuff from exynos5433_cmu_probe() into
samsung_cmu_register_one() ) can be done later, when I add PM ops into
clk-exynos850.

> Best regards,
> Krzysztof
