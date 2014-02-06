From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu, 06 Feb 2014 19:43:44 +0100
Message-ID: <7214831.iPsDTEq8CU@amdc1032>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
 <5101685.tPb8PWOH5Q@amdc1032>
 <CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49037 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753445AbaBFSns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:43:48 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00AHY80ZL110@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Feb 2014 03:43:47 +0900 (KST)
In-reply-to: <CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Thursday, February 06, 2014 10:25:09 AM Olof Johansson wrote:
> On Thu, Feb 6, 2014 at 7:02 AM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> >
> > Hi,
> >
> > On Thursday, February 06, 2014 03:10:39 PM Tomasz Figa wrote:
> >> Hi Sachin,
> >>
> >> On 06.02.2014 12:59, Sachin Kamat wrote:
> >> > Instead of repeating the Kconfig entries for every SoC, move them under
> >> > ARCH_EXYNOS4 and 5 and move the entries common to both 4 and 5 under
> >> > ARCH_EXYNOS. Also, since the individual SoCs do not have any specific
> >> > machine/platform code, keep them as boolean symbols instead of user
> >
> > All soc_is_exynosxxxx() dependent code gets thrown away is specific SoC
> > support is not selected.  With this change this is not longer true.
> > Moreover some drivers are doing explicit ifdef checks for specific SoC
> > support, i.e. thermal driver.
> 
> I'm guessing you're referring to exynos_tmu_data.c? That's not all

Yes.

> that much data, and not all that substantial compared to things like
> pinctrl and clocks. Removing those ifdefs per SoC is reasonable.

I agree.  I just wanted to point out that the current patch description
is not entirely accurate.

> I'm ok with one Kconfig per family (EXYNOS 4 and 5), but we should
> avoid higher granularity than that. That's similar to how OMAP is
> handled. i.MX is more granular but they aren't introducing as many
> SoCs as Samsung so it's not as big a deal.

OK.

> >> > selectable and select them from Exynos4 and 5 config symbols. Individual
> >> > SoC symbols can be removed eventually once the driver Kconfig dependencies
> >> > on these symbols are removed.
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> > ---
> >> >   arch/arm/Kconfig             |   12 ++++++
> >> >   arch/arm/mach-exynos/Kconfig |   97 ++++++++++--------------------------------
> >> >   2 files changed, 35 insertions(+), 74 deletions(-)
> >>
> >> I fully agree that there is no real need of having per-SoC Kconfig
> >> entries, since the differences caused by them are quite insignificant.
> >
> > I think so but some numbers to back it up would be good..
> >
> >> Moreover, this makes me wonder if there is even need to distinguish
> >> between ARCH_EXYNOS4 and ARCH_EXYNOS5...
> >
> > Well, once again, seeing some numbers would be good. :)
> 
> What numbers do you want? Size comparisons with all SoC options on vs only one?

Yes, size comparisions with all SoCs (for given family) turned on vs
only one turned on (done on kernel without this patch applied).

Also size comparisons for ARCH_EXYNOS4 and ARCH_EXYNOS5 both turned
on vs only ARCH_EXYNOS4 or ARCH_EXYNOS5 turned on (with this patch
applied).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
