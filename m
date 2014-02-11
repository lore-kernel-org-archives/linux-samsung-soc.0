From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Tue, 11 Feb 2014 11:40:08 +0530
Message-ID: <CAL5jtJ=2adaiTvX6BUr1TWqA4w35ALadx32g53HMQ54sRihp+g@mail.gmail.com>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
	<5101685.tPb8PWOH5Q@amdc1032>
	<CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
	<7214831.iPsDTEq8CU@amdc1032>
	<CAOesGMhGTVQex7vu49QnHv2HsdE7S8jz7oKY04FsT4Hg1VR7sA@mail.gmail.com>
	<52F50ACC.3020105@samsung.com>
	<CAK9yfHxi7EPTdeMoLYHrnomC3w5OpEux6vOHPeOEKhZg9Jw8+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:57934 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721AbaBKGKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 01:10:09 -0500
Received: by mail-we0-f170.google.com with SMTP id w62so5127127wes.29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2014 22:10:08 -0800 (PST)
In-Reply-To: <CAK9yfHxi7EPTdeMoLYHrnomC3w5OpEux6vOHPeOEKhZg9Jw8+g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

2014-02-10 10:20 GMT+05:30 Sachin Kamat <sachin.kamat@linaro.org>:
>
> On 7 February 2014 22:03, Tomasz Figa <t.figa@samsung.com> wrote:
> > On 06.02.2014 19:59, Olof Johansson wrote:
> >>
> >> On Thu, Feb 6, 2014 at 10:43 AM, Bartlomiej Zolnierkiewicz
> >> <b.zolnierkie@samsung.com> wrote:
> >>
> >>>>> Well, once again, seeing some numbers would be good. :)
> >>>>
> >>>>
> >>>> What numbers do you want? Size comparisons with all SoC options on vs
> >>>> only one?
> >>>
> >>>
> >>> Yes, size comparisions with all SoCs (for given family) turned on vs
> >>> only one turned on (done on kernel without this patch applied).
> >>>
> >>> Also size comparisons for ARCH_EXYNOS4 and ARCH_EXYNOS5 both turned
> >>> on vs only ARCH_EXYNOS4 or ARCH_EXYNOS5 turned on (with this patch
> >>> applied).
> >>
> >>
> >> exynos_defconfig-based build data below.
> >>
> >>     text    data     bss     dec     hex filename
> >> 5109986  319952  270196 5700134  56fa26 obj-tmp/vmlinux   # all 4+5 SoCs
> >> enabled
> >> 5088312  296912  270196 5655420  564b7c obj-tmp/vmlinux  # EXYNOS5
> >> off, all EXYNOS4 SoCs enabled
> >> 5088032  296896  270196 5655124  564a54 obj-tmp/vmlinux  # Only 4210
> >> enabled
> >> 5079205  299928  270068 5649201  563331 obj-tmp/vmlinux  # EXYNOS4
> >> off, all EXYNOS5 SoCs enabled
> >> 5063355  286792  270068 5620215  55c1f7 obj-tmp/vmlinux   # Only 5250
> >> enabled
> >> 5067815  298152  270068 5636035  55ffc3 obj-tmp/vmlinux    # Only
> >> 5250+5420 enabled
> >> 5053357  278480  269364 5601201  5577b1 obj-tmp/vmlinux  # Only 5440
> >> enabled
> >>
> >> The main difference of disabling 5440 is that it removed the PCI
> >> support, which explains that reduction in size.
> >>
> >> So, I would argue that theere might be some value in disabling whole
> >> families (since it saves about 20k of text and the same of data), but
> >> that there's less gain per SoC member. 5440 is an oddball in this
> >> setup so it might make sense to treat it differently due to the PCI
> >> aspect.
> >
> >
> > Well, the numbers basically represent what I expected. Thanks for checking
> > this.
>
> Thanks to Olof for coming out with these numbers.
>
> >So I second this patch even more now,
>
> Thanks Tomasz :)
>
> > but maybe let's change it a bit
> > and introduce third entry for Exynos5440, since it doesn't really belong to
> > either of ARCHs. Candidates that come to my mind are ARCH_EXYNOS5440 (seems
> > to specific) or ARCH_EXYNOS5_SERVER. Feel free to suggest anything better,
> > though.
>
> Though Exynos5440 belongs to the Exynos5 family, it is different in a
> few ways and hence
> I preferred to keep it as a separate entry for now. I agree with your
> suggestion to have a third
> ARCH category but I would prefer to wait for a while until we have one
> more candidate for this
> category so that we have a bit more data for naming and grouping.
>
Well, I also, having soc number would be good like 5440 you thought
because I can't say upcoming exynos ARMv7 based SoCs are familiar with
previous exynos SoCs or not at this moment. And it means sometimes we
need to add the numbering and sometime we don't need. It's not fair
enough I think. And I have strong objection on Thomasz' suggestion
about ARCH_EXYNOS5_SERVER? Please don't guess.

- Kukjin
