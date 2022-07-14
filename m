Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03EAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 14:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239729AbiGNOAJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 10:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbiGNN6p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 09:58:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5A01084
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 06:58:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bf9so2911400lfb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AsyrMzElWzo80Z5egogMNWofiRDznVZXTCiFutbvKII=;
        b=eZvDJbMtdOPQ3Hlc73SGr+GXOezfkTn0ravZ4O7F1MoOod7OhqpD8vvfNfTFMeVp74
         j5NNgqimVWpvNd+hChUbhIZNlrM3MLHTmzV8E6ztrs4iqKNuKTpgKjgCI4GQK+C5k31G
         lj6n12ONLcGYveOkj8O41G87V4fCSke/tHYo+N6uFox0EqjJa6jhVvgyoNGqABFydujL
         sWXjC6waub7/4XEcL6TJUQnrYqacqJKZLdYZ+WzEdL1NQ1xLz9C0JaG+PQbMiWoQEufV
         qxsp7Y+znXbPuD9CuWNsBW1ZYNAV1G/6IM6bdntXeYy61oTPfMlrmrsJqSzmNcjigXAS
         u1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsyrMzElWzo80Z5egogMNWofiRDznVZXTCiFutbvKII=;
        b=ViQ0J1mbVsUz2WuPrzx1FtIXl95lSDV+OEh9jy1he1rrJy8jlwXmYSi52GDHl/dIac
         HccruwhQ1iqIEf9mGNYWc0p26wKqJvfEqBbFu4aN3jK7WJPjx2iFIBDKruowQg/vh47Y
         4TYpexQ3HMoWqTb+K5W4ZH3I+aTcw1hks1kIVCLxEcKXeYTPlRkpwCMr8B44JPSBBOwA
         f0Nn7ZzGE5CkF/jMzcSduPpNzsI5vQOecpyFprTCMb1g9QhmPSSQz45D+p0LK4bxke9H
         QQ4ywQSzVt2R/8xDgG5SY0HXdTWf0/qybPUFon4fkkNl+JUEhHOYKWTFuTRG5O90/rhK
         G+9Q==
X-Gm-Message-State: AJIora/MWKV0dBjiGCuGPzfiItno3Yq+DL10+l0/wJzvSWtJ5ulzsXtk
        GxKq3g5MoJsAA02p8HRhIY/yyDpoLIIK2CfQbXdnrw==
X-Google-Smtp-Source: AGRyM1utf5B4o7kELwBxm7mmneS2IRfBXaZ05RbaenlLg45jt5LuOHpIalhl4TyctEbGWWsqOS6t/zSaVykK5WbqsVo=
X-Received: by 2002:ac2:47f6:0:b0:488:b649:9f77 with SMTP id
 b22-20020ac247f6000000b00488b6499f77mr5638296lfp.559.1657807082858; Thu, 14
 Jul 2022 06:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
 <20220710230603.13526-7-semen.protsenko@linaro.org> <dcf4da29-9da0-69ea-300e-80d1f5cc10a3@arm.com>
In-Reply-To: <dcf4da29-9da0-69ea-300e-80d1f5cc10a3@arm.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 14 Jul 2022 16:57:51 +0300
Message-ID: <CAPLW+4nc2B0J4yvnz37MrJnTHKtkDCNBX5L2ff_YRGDEbZiKQA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] iommu/exynos: Add SysMMU v7 register sets
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 12 Jul 2022 at 20:00, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-07-11 00:06, Sam Protsenko wrote:
> > SysMMU v7 might have different register layouts (VM capable or non-VM
> > capable). Check which layout is implemented in current SysMMU module and
> > prepare the corresponding register table for futher usage.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >    - (none) This patch is new and added in v2
> >
> >   drivers/iommu/exynos-iommu.c | 26 ++++++++++++++++++++++----
> >   1 file changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index 48681189ccf8..64bf3331064f 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -166,6 +166,8 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >   enum {
> >       REG_SET_V1,
> >       REG_SET_V5,
> > +     REG_SET_V7_NON_VM,
> > +     REG_SET_V7_VM,
> >       MAX_REG_SET
> >   };
> >
> > @@ -201,6 +203,16 @@ static const unsigned int sysmmu_regs[MAX_REG_SET][MAX_REG_IDX] = {
> >               0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x20, 0x24,
> >               0x60, 0x64,
> >       },
> > +     /* SysMMU v7: Default register set (non-VM) */
> > +     {
> > +             0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x20, 0x24,
> > +             0x60, 0x64,
> > +     },
> > +     /* SysMMU v7: VM capable register set */
> > +     {
> > +             0x00, 0x04, 0x08, 0x800c, 0x8010, 0x8014, 0x8018, 0x8020,
> > +             0x8024, 0x60, 0x64,
>
> Yuck, see, it's turning into an unreadable mess already.
>

Will be reworked in v2, using variant struct approach suggested by Krzysztof.

> This is also raising the question of whether it's worth abstracting
> accesses to the common registers if it means having an ever-increasing
> number of copies of those same offsets. Personally I'd leave those using
> regular readl/writel, but even if there's an argument for keeping all
> the callsites consistent (modulo the one that already can't be), there's
> no reason the wrappers couldn't pick up the slack, e.g.:
>

Agreed. Gonna leave the common regs out of it in v2, having only
non-common registers in the variant structure. Also in v2 gonna stick
with plain readl/writel calls, using SYSMMU_REG() wrapper suggested by
Krzysztof.

> static void sysmmu_write(struct sysmmu_drvdata *data, size_t idx, u32 val)
> {
>         unsigned int offset;
>
>         if (idx <= IDX_STATUS) {
>                 offset = idx * 4;
>         } else {
>                 offset = data->regs[idx - IDX_PT_BASE];
>                 if (WARN_ON(!offset))
>                         return;
>         }
>         writel(val, data->sfrbase + offset);
> }
>
> Indeed, not abstracting REG_MMU_CTRL via data->regs would then make it
> trivial to be robust against unimplemented registers without even having
> to remember to initialise their offsets to some magic value, which seems
> rather attractive.
>

Just on the discussion point (as this function won't be present in
v2): one reason for this rework is to avoid using if-else branching,
AFAIU those might have some performance impact (caches/branch
prediction). Also the code looks better that way. Of course, in this
particular driver those I/O calls don't happen very often, but still.
One-line static function I used in v1 would be probably inlined by the
compiler. Also SysMMU register layout(s) doesn't seem to be very
consistent, w.r.t. offset values :)

Anyway, I hope the way it's done in v2 will be more to your liking.

> (also, as it only strikes me now, why are we passing enum values around
> as size_t? That's just odd)
>
> Thanks,
> Robin.
>

[snip]
